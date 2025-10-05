# Etapa 1 - Build da aplicação Go
FROM golang:1.23 AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN go build -o main .

# Etapa 2 - Imagem leve para execução
FROM debian:bookworm-slim

WORKDIR /root/

COPY --from=builder /app/main .
EXPOSE 8080

CMD ["./main"]