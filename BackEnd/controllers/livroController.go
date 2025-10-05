package controllers

import (
	"context"
	"net/http"
	"strings"
	"time"

	"go-api/config"
	"go-api/models"

	"github.com/gin-gonic/gin"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/mongo/options"
)

func BuscarLivros(c *gin.Context) { // vai puxar quase isso por baixo dos panos : GET /livros?titulo=MongoDB
	titulo := strings.ToLower(c.Query("titulo"))
	autor := strings.ToLower(c.Query("autor"))
	genero := strings.ToLower(c.Query("genero"))

	//chama a coleção de livro do MongoDB
	collection := config.GetCollection("livro")

	// se cria um filtro usando o regex
	filter := bson.M{}
	if titulo != "" {
		filter["titulo"] = bson.M{"$regex": titulo, "$options": "i"}
		//find do mongo db.livro.find(),
	}
	if autor != "" {
		filter["autor"] = bson.M{"$regex": autor, "$options": "i"}
	}
	if genero != "" {
		filter["genero"] = bson.M{"$regex": genero, "$options": "i"}
	}

	ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
	defer cancel()

	opts := options.Find().SetSort(bson.D{{Key: "titulo", Value: 1}})

	cursor, err := collection.Find(ctx, filter, opts)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	var livros []models.Livro
	if err = cursor.All(ctx, &livros); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, livros)
}
