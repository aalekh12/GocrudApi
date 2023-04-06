FROM golang:1.20.3-alpine3.16
RUN mkdir app 
ADD . /app
WORKDIR /app
COPY go.mod .
COPY go.sum .
RUN go mod download
COPY . .
RUN go build -o ./out/dist .
CMD ./out/dist