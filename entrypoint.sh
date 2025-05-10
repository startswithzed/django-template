#!/bin/sh
set -e

# Run migrations
echo "Running migrations..."
uv run python manage.py migrate

# Create superuser if it doesn't exist
echo "Creating superuser..."
uv run python manage.py createsuperuser --noinput 2>/dev/null || true

# Start gunicorn
echo "Starting server..."
exec uv run gunicorn --reload -c gunicorn.conf.py 