.PHONY: build up makemigrations clean

build:
	@COMPOSE_BAKE=true docker-compose build

up: build
	@docker-compose up

makemigrations:
	@docker-compose run --rm server uv run python manage.py makemigrations

clean:
	@docker-compose down --volumes
