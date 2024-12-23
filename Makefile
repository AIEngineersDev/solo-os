.PHONY: all build_iso build_docker test clean

all: build_iso build_docker

build_iso:
	@echo "Building Solo OS ISO..."
	./build/scripts/build_iso.sh

build_docker:
	@echo "Building Docker images..."
	docker build -t solo-os/base -f build/Dockerfiles/base.Dockerfile .
	docker build -t solo-os/inference-engine -f build/Dockerfiles/inference_engine.Dockerfile .

test:
	@echo "Running tests..."
	@make -C tests

clean:
	@echo "Cleaning build artifacts..."
	rm -rf build/output/*
	docker system prune -f
