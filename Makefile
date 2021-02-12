BINARY=engine
engine:
	go build -o ${BINARY} main.go

clean: 
	if [ -f ${BINARY} ] ; then rm ${BINARY} ; fi

docker:
	docker build -t clean-arch .

run:
	docker-compose up --build -d

stop:
	docker-compose down

lint-prepare:
	@echo "Installing golangci-lint" 
	curl -sfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh| sh -s latest

lint:
	./bin/golangci-lint run ./...

.PHONY: clean install unittest build docker run stop vendor lint-prepare lint