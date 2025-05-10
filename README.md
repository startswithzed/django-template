# Django Template

A modern Django project template with Docker support, using Django Ninja for API development.

## Features

- Python 3.13+ support
- Docker and Docker Compose setup
- Django Ninja for fast API development
- Gunicorn for production deployment
- UV for dependency management
- Makefile for common commands

## Prerequisites

- Docker and Docker Compose
- Python 3.13 or higher (for local development)
- UV package manager (optional, for local development)

## Getting Started

1. Clone the repository:

```bash
git clone <repository-url>
cd django-template
```

2. Create a `.env` file in the project root (see `.env.example` for required variables)

3. Build and start the containers:

```bash
make build
make up
```

The application will be available at `http://localhost:8000`

## Development

### Common Commands

- `make build` - Build Docker containers
- `make up` - Start the application
- `make makemigrations` - Create new database migrations
- `make clean` - Stop containers and remove volumes

### Project Structure

```
django-template/
├── config/             # Django project settings
├── staticfiles/        # Static files
├── manage.py          # Django management script
├── Dockerfile         # Docker configuration
├── docker-compose.yml # Docker Compose configuration
├── pyproject.toml     # Project dependencies
└── Makefile          # Common commands
```

## API Development

This template uses Django Ninja for API development. API endpoints should be defined in the `config/api.py` file.

## Production Deployment

The project is configured with Gunicorn for production deployment. The Docker setup includes:

- Gunicorn as the WSGI server
- Static file serving
- Environment variable configuration
- Volume management for static files

## License

[Add your license here]
