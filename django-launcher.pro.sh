#!/bin/sh

# Collect static files
echo "Collect static files"
python3 manage.py collectstatic --noinput

# Apply database migrations
echo "Apply database migrations"
python3 manage.py makemigrations
python3 manage.py migrate

# Start server
echo "Starting server"
## With WebSockets
uvicorn --workers=4 --host 0.0.0.0 --port 8000 chapps.asgi:application
## without WebSockets
#gunicorn --workers=4 -b 0.0.0.0:8000 gotrucki.wsgi:application
