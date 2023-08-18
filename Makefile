generate:
	go run github.com/99designs/gqlgen generate
	go mod tidy

init:
	go run github.com/99designs/gqlgen init
	go mod tidy

.PHONY: generate init