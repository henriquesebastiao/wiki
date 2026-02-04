#!make

run:
	uv run mkdocs serve

build:
	uv run mkdocs build

lint:
	mdformat --check ./docs

.PHONY: run build
