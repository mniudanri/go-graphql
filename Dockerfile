FROM golang:alpine

RUN mkdir test

ADD . /test

WORKDIR /test

RUN go build -o go-graphql .

EXPOSE 8080

CMD ["/test/go-graphql"]