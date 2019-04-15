FROM golang:1.12
CMD ["./main"]
EXPOSE 3000
RUN mkdir -p /go/src/github.com/prototype
WORKDIR /go/src/github.com/prototype
ADD . /go/src/github.com/prototype
RUN go get && go build -a -installsuffix cgo -o main .
