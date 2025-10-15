# Etapa 1 - Build da aplicação Go
FROM golang:1.23 AS builder

WORKDIR /app

COPY go.mod ./

RUN go mod tidy

COPY . .

RUN go build -o main .

# Etapa 2 - Imagem leve para execução
FROM debian:bookworm-slim

WORKDIR /root/

COPY --from=builder /app/main .
EXPOSE 8000

CMD ["./main"]