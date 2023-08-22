package main

import (
	"log"
	"net/http"

	"github.com/99designs/gqlgen/graphql/handler"
	"github.com/99designs/gqlgen/graphql/playground"
	"github.com/mniudanri/go-graphql/graph"
	"github.com/mniudanri/go-graphql/util"
)

const defaultPort = "8080"

func main() {
	config := util.LoadConfig(".")

	port := config.Port
	if port == "" {
		port = defaultPort
	}

	srv := handler.NewDefaultServer(graph.NewExecutableSchema(graph.Config{Resolvers: &graph.Resolver{}}))

	http.Handle("/", playground.Handler("GraphQL Specification", "/query"))
	http.Handle("/query", srv)

	log.Printf("connect to http://localhost:%s/ for GraphQL Specification", port)
	log.Fatal(http.ListenAndServe(":"+port, nil))
}
