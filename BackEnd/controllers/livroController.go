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

func BuscarLivros(c *gin.Context) {
	titulo := strings.ToLower(c.Query("titulo"))
	autor := strings.ToLower(c.Query("autor"))
	genero := strings.ToLower(c.Query("genero"))

	collection := config.GetCollection("livros")

	filter := bson.M{}
	if titulo != "" {
		filter["titulo"] = bson.M{"$regex": titulo, "$options": "i"}
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
