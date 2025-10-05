package config

import (
	"context"
	"fmt"
	"log"
	"time"

	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
)

var DB *mongo.Database

func ConectarMongo() {
	clientOptions := options.Client().ApplyURI("mongodb://estante:estante123@localhost:27017")

	ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
	defer cancel()

	client, err := mongo.Connect(ctx, clientOptions)
	if err != nil {
		log.Fatal(err)
	}

	err = client.Ping(ctx, nil)
	if err != nil {
		log.Fatal(" Erro ao conectar no MongoDB:", err)
	}

	DB = client.Database("biblioteca")
	fmt.Println(" Conectado ao MongoDB!")
}

func GetCollection(nome string) *mongo.Collection {
	return DB.Collection(nome)
}
