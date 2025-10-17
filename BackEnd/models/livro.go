package models

import "go.mongodb.org/mongo-driver/bson/primitive"

type Livro struct {
	ID          primitive.ObjectID `bson:"_id,omitempty" json:"id,omitempty"`
	Titulo      string             `bson:"titulo" json:"titulo"`
	Autor       string             `bson:"autor" json:"autor"`
	Ano         int                `bson:"ano" json:"ano"`
	Genero      string             `bson:"genero" json:"genero"`
	Exemplares  int                `bson:"exemplares" json:"exemplares"`
	Emprestimos []string           `bson:"emprestimos" json:"emprestimos"`
}

type GeneroStats struct {
	Genero      string `bson:"_id" json:"genero"`
	TotalLivros int    `bson:"totalLivros" json:"totalLivros"`
}

type EmprestimoRequest struct {
	Nome string `json:"nome_amiguinho" binding:"required"`
}
