NAME=portal
.PHONY: dev start

dev:
	docker run -it -p 3333:3000 --rm -w /go/src/github.com/$(NAME) \
	  -v $(shell pwd)/:/go/src/github.com/$(NAME) \
	  golang:1.12

start:
	VIRTUAL_HOST='b2d' KATACODA_HOST='http://localhost:3000' KATACODA_USER='test' ./portal
