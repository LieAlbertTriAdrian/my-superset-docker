FROM python:2.7.11
MAINTAINER liealberttriadrian <alberttri23@gmail.com>

# Install dependencies via apt
RUN apt-get update && apt-get install -y \
	libsasl2-dev \
	libpq-dev \
	postgresql \
	python-psycopg2

# Initiate the project folder
RUN mkdir superset

# Install dependencies via pip
COPY requirements.txt superset/
RUN pip install --upgrade -r superset/requirements.txt

# Set PYTHONPATH
ENV PYTHONPATH="/superset"

# Create an admin user
RUN /usr/local/bin/fabmanager create-admin --app superset --username "admin" --password "albert" --firstname "Lie" --lastname "Adrian" --email "alberttri23@gmail.com"

# Copy superset configuration
COPY superset_config.py superset/

# Initialize the database
RUN superset db upgrade

# Create default roles and permissions
RUN superset init

# Load some data to play with
# RUN superset load_examples

# Start the development web server
CMD superset runserver -p 8080 -t 600