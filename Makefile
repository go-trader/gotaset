
COMMIT = $(shell git rev-parse HEAD | head -c 7)
TIMESTAMP=$(shell TZ='UTC' date '+%Y%m%dt%H%M')
tag="$(COMMIT)-$(TIMESTAMP)"
tagversion="1.0"
get:
	go get -t -v 

test: get 
	go vet		
	go test -parallel 8 -count=1 -cover $$(go list ./... | grep -v /interactivebrokers)

build: test	
	GOOS=linux CGO_ENABLED=0 go build -ldflags "-X main.build=$(TIMESTAMP)-$(COMMIT)" -o bin/gotaset_linux main.go
	GOOS=darwin go build -ldflags "-X main.build=$(TIMESTAMP)-$(COMMIT)" -o bin/gotaset_darwin main.go

docker: build
	docker build -t totomz84/gotaset:$(tag) .
	docker push totomz84/gotaset:$(tag)
	docker tag totomz84/gotaset:$(tag) totomz84/gotaset:latest 
	docker push totomz84/gotaset:latest
