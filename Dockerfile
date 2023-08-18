FROM golang:alpine

RUN mkdir -p build-go-graphql && rm -rf /build-go-graphql/*

ADD . /build-go-graphql

WORKDIR /build-go-graphql

RUN go build -o go-graphql .

EXPOSE 8080

CMD ["/build-go-graphql/go-graphql"]