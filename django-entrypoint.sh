#!/bin/bash

python manage.py migrate 
python manage.py collectstatic --no-input

python manage.py createsuperuser --no-input

gunicorn --workers=1 --bind $SERVICE_HOST:$SERVICE_PORT devops_demo.wsgi
