BINARY = keres
PROJ = keres
ORG_PATH=github.com/arcade
REPO_PATH=$(ORG_PATH)/$(PROJ)

GOARCH = amd64
VERSION?=$(shell ./scripts/git-version)
COMMIT=$(shell git rev-parse HEAD)
BRANCH=$(shell git rev-parse --abbrev-ref HEAD)

# Symlink into GOPATH
GITHUB_USERNAME=arcade
CURRENT_DIR=$(shell pwd)

export GOBIN=$(PWD)/bin

# Setup the -ldflags option for go build here, interpolate the variable values
LDFLAGS = "-w -X $(REPO_PATH)/version.Version=$(VERSION) -X main.COMMIT=${COMMIT} -X main.BRANCH=${BRANCH}"

# Build the project
all: clean bin/keres

bin/keres:
	@GOARCH=${GOARCH} go install -v -ldflags $(LDFLAGS) $(REPO_PATH)/cmd/keres

linux:
	GOOS=linux GOARCH=${GOARCH} go build ${LDFLAGS} -o bin/${BINARY}-linux-${GOARCH} cmd/keres/main.go ; \

darwin:
	GOOS=darwin GOARCH=${GOARCH} go build ${LDFLAGS} -o bin/${BINARY}-darwin-${GOARCH} cmd/keres/main.go ; \

windows:
	GOOS=windows GOARCH=${GOARCH} go build ${LDFLAGS} -o bin/${BINARY}-windows-${GOARCH}.exe cmd/keres/main.go ; \

clean:
	@-rm -f bin/${BINARY}-*

.PHONY: clean bin/keres
