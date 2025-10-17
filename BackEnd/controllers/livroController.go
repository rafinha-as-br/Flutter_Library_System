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
	"go.mongodb.org/mongo-driver/bson/primitive"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
)

func BuscarLivros(c *gin.Context) { // vai puxar quase isso por baixo dos panos : GET 8080/livro?titulo=MongoDB
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

func BuscarLivrosDisponiveis(c *gin.Context) {
	collection := config.GetCollection("livro")

	pipeline := mongo.Pipeline{
		{{Key: "$match", Value: bson.D{
			{Key: "emprestados", Value: bson.D{{Key: "$size", Value: 0}}},
		}}},
		{{Key: "$group", Value: bson.D{
			{Key: "_id", Value: "$genero"},
			{Key: "totalLivros", Value: bson.D{{Key: "$sum", Value: 1}}},
		}}},
		{{Key: "$sort", Value: bson.D{{Key: "totalLivros", Value: -1}}}},
	}

	ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
	defer cancel()

	cursor, err := collection.Aggregate(ctx, pipeline)

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	defer cursor.Close(ctx)

	var GeneroStats []models.GeneroStats

	if err = cursor.All(ctx, &GeneroStats); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, GeneroStats)
}

func InserirLivro(c *gin.Context) {
	collection := config.GetCollection("livro")

	ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
	defer cancel()

	var novoLivro models.Livro

	if err := c.ShouldBindJSON(&novoLivro); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"erro": err.Error()})
	}

	if novoLivro.Emprestimos == nil {
		novoLivro.Emprestimos = []string{}
	}

	result, err := collection.InsertOne(ctx, novoLivro)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Erro ao inserir livro", "details": err.Error()})
		return
	}

	if oid, ok := result.InsertedID.(primitive.ObjectID); ok {
		novoLivro.ID = oid
	}

	c.JSON(http.StatusCreated, novoLivro)
}

func AtualizaLivro(c *gin.Context) {
	collection := config.GetCollection("livro")

	idParam := c.Param("id")

	objID, err := primitive.ObjectIDFromHex(idParam)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "ID de livro inválido."})
		return
	}

	ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
	defer cancel()

	var dadosAtualizacao models.Livro

	if err := c.ShouldBindJSON(&dadosAtualizacao); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Erro a atualizar livro", "details": err.Error()})
		return
	}

	updateDocument := bson.M{
		"$set": bson.M{
			"titulo":     dadosAtualizacao.Titulo,
			"autor":      dadosAtualizacao.Autor,
			"ano":        dadosAtualizacao.Ano,
			"genero":     dadosAtualizacao.Genero,
			"exemplares": dadosAtualizacao.Exemplares,
		},
	}

	filter := bson.M{"_id": objID}

	result, err := collection.UpdateOne(
		ctx,
		filter,
		updateDocument,
	)

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Falha ao atualizar livro no MongoDB", "details": err.Error()})
		return
	}

	if result.ModifiedCount == 0 {
		c.JSON(http.StatusNotFound, gin.H{"error": "Livro não encontrado ou nenhum dado para alterar."})
		return
	}

	var livroAtualizado models.Livro
	err = collection.FindOne(ctx, filter).Decode(&livroAtualizado)

	if err != nil {
		c.JSON(http.StatusAccepted, gin.H{"message": "Livro atualizado, mas não foi conseguido trazer o documento completo"})
		return
	}

	c.JSON(http.StatusOK, livroAtualizado)
}

func DeletarLivro(c *gin.Context) {
	colletion := config.GetCollection("livro")

	idParam := c.Param("id")

	objID, err := primitive.ObjectIDFromHex(idParam)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "ID de livro inválido."})
		return
	}
	ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
	defer cancel()

	filter := bson.M{"_id": objID}

	result, err := colletion.DeleteOne(ctx, filter)

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Falha ao deletar livro no MongoDB", "details": err.Error()})
		return
	}

	if result.DeletedCount == 0 {
		c.JSON(http.StatusNotFound, gin.H{"message": "Livro não encontrado."})
		return
	}

	c.JSON(http.StatusNoContent, nil)
}

func BuscarLivrosEmprestados(c *gin.Context) {
	titulo := strings.ToLower(c.Query("titulo"))
	autor := strings.ToLower(c.Query("autor"))
	genero := strings.ToLower(c.Query("genero"))

	collection := config.GetCollection("livro")

	filter := bson.M{"emprestados": bson.M{"$not": bson.M{"$size": 0}}}
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

func AtualizaEmprestimo(c *gin.Context) {
	collection := config.GetCollection("livro")
	idParam := c.Param("id")

	objID, err := primitive.ObjectIDFromHex(idParam)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "ID de livro inválido."})
		return
	}

	ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
	defer cancel()

	var emprestimo models.EmprestimoRequest

	if err := c.ShouldBindJSON(&emprestimo); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "O campo 'nome_amiguinho' é obrigatório."})
		return
	}

	update := bson.M{
		"$push": bson.M{"emprestados": emprestimo.Nome},
	}

	filter := bson.M{"_id": objID}

	result, err := collection.UpdateOne(ctx, filter, update)

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Falha ao registrar empréstimo no MongoDB", "details": err.Error()})
		return
	}

	if result.ModifiedCount == 0 {
		c.JSON(http.StatusNotFound, gin.H{"error": "Livro não encontrado para emprestar."})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"message": "Livro emprestado com sucesso.",
		"cliente": emprestimo.Nome,
	})
}

func Devolver(c *gin.Context) {
	collection := config.GetCollection("livro")
	idParam := c.Param("id")

	objID, err := primitive.ObjectIDFromHex(idParam)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "ID de livro inválido."})
		return
	}

	ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
	defer cancel()

	var emprestimoData models.EmprestimoRequest

	if err := c.ShouldBindJSON(&emprestimoData); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "O campo 'nome_cliente' é obrigatório para a devolução."})
		return
	}

	update := bson.M{
		"$pull": bson.M{"emprestados": emprestimoData.Nome},
	}

	filter := bson.M{"_id": objID}

	result, err := collection.UpdateOne(ctx, filter, update)

	if err != nil {
		c.JSON(http.StatusInternalServerError,
			gin.H{
				"error":   "Falha ao registrar devolução no MongoDB",
				"details": err.Error(),
			})
		return
	}

	if result.ModifiedCount == 0 {
		c.JSON(http.StatusNotFound, gin.H{"error": "Livro não encontrado ou cliente já havia devolvido o livro."})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"message": "Livro devolvido com sucesso.",
		"cliente": emprestimoData.Nome,
	})
}
