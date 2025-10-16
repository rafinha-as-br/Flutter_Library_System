package routes

import (
	"go-api/controllers"

	"github.com/gin-gonic/gin"
)

func ConfigurarRotas(router *gin.Engine) {
	router.GET("/livro", controllers.BuscarLivros)
	router.GET("/livro/disponiveis", controllers.BuscarLivrosDisponiveis)
	router.POST("/livro", controllers.InserirLivro)
	router.PUT("/livro/:id", controllers.AtualizaLivro)
	router.DELETE("/livro/:id", controllers.DeletarLivro)
}
