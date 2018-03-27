BINARY = keres
GOARCH = amd64

VERSION?=?
COMMIT=$(shell git rev-parse HEAD)
BRANCH=$(shell git rev-parse --abbrev-ref HEAD)

# Symlink into GOPATH
GITHUB_USERNAME=arcade
CURRENT_DIR=$(shell pwd)

# Setup the -ldflags option for go build here, interpolate the variable values
LDFLAGS = -ldflags "-X main.VERSION=${VERSION} -X main.COMMIT=${COMMIT} -X main.BRANCH=${BRANCH}"

# Build the project
all: clean linux darwin windows

linux:
	GOOS=linux GOARCH=${GOARCH} go build ${LDFLAGS} -o bin/${BINARY}-linux-${GOARCH} cmd/keres/main.go ; \

darwin:
	GOOS=darwin GOARCH=${GOARCH} go build ${LDFLAGS} -o bin/${BINARY}-darwin-${GOARCH} cmd/keres/main.go ; \

windows:
	GOOS=windows GOARCH=${GOARCH} go build ${LDFLAGS} -o bin/${BINARY}-windows-${GOARCH}.exe cmd/keres/main.go ; \

clean:
	-rm -f bin/${BINARY}-*

.PHONY: linux darwin windows clean
