package main

import (
	"go-api/config"
	"go-api/routes"

	"github.com/gin-gonic/gin"
)

func main() {
	config.ConectarMongo()

	r := gin.Default()
	routes.ConfigurarRotas(r)

	r.Run(":8080")
}
