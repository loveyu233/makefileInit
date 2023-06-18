goBuild:
	go run main.go

goTidy:
	go mod tidy

goBuildLinux:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build main.go

goBuildWinds:
	CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build main.go

protoc:
	protoc \
 	--go_out=. --go_opt=paths=source_relative \
    --go-grpc_out=. --go-grpc_opt=paths=source_relative \
    ./*.proto

protocGateway:
	protoc \
  	--go_out . --go_opt paths=source_relative \
  	--go-grpc_out . --go-grpc_opt paths=source_relative \
  	--grpc-gateway_out . --grpc-gateway_opt paths=source_relative \
  	./proto/rest.proto