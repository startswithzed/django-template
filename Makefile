.PHONY: build up makemigrations clean build-no-cache up-no-cache

build:
	@COMPOSE_BAKE=true docker-compose build

up: build
	@docker-compose up

build-no-cache:
	@COMPOSE_BAKE=true docker-compose build --no-cache server

up-no-cache: build-no-cache
	@docker-compose up

makemigrations:
	@docker-compose run --rm server uv run python manage.py makemigrations

clean:
	@docker-compose down --volumes
