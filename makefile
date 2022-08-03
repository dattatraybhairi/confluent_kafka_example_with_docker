.PHONY: lint fmt build test

lint: 
	go vet ./...

fmt:
	@go fmt ./...

build:
	@go build go-kafka-example

test:
	@go mod download
	@go test -coverprofile=coverage.out ./... -json > report.out
	@go tool cover -func=coverage.out | tail -n 1
