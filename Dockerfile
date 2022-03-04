FROM golang:latest as build

WORKDIR /src/app

COPY . .

RUN go mod download

RUN go build -o /desafio-docker-golang

FROM scratch

WORKDIR /

COPY --from=build /desafio-docker-golang /desafio-docker-golang

CMD [ "/desafio-docker-golang" ]
