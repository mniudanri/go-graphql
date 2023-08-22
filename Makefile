generate:
	go run github.com/99designs/gqlgen generate
	go mod tidy

init:
	go run github.com/99designs/gqlgen init
	go mod tidy

migrate_up:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/testdb?sslmode=disable" -verbose up

migrate_down:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/testdb?sslmode=disable" -verbose down

create_db:
	docker exec -it postgres createdb --username=root --owner=root testdb

drop_db:
	docker exec -it postgres dropdb testdb


sqlc_init:
	@if [["$(shell docker images -q sqlc/sqlc:latest)" == ""]]; then \
		($(shell docker pull sqlc/sqlc)) \
	fi \
	docker run --rm -v $(PWD):/src -w /src sqlc/sqlc init

sqlc:
	@if [["$(shell docker images -q sqlc/sqlc:latest)" == ""]]; then \
		$(shell docker pull sqlc/sqlc) \
	fi \
	docker run --rm -v $(PWD):/src -w /src sqlc/sqlc generate



.PHONY: generate init