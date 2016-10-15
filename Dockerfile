FROM python:2.7.11
MAINTAINER liealberttriadrian <alberttri23@gmail.com>

# Install dependencies via apt
RUN apt-get update && apt-get install -y \
	libsasl2-dev \
    libmysqlclient-dev \
	libpq-dev \
	postgresql \
	python-psycopg2

# Initiate the project folder
RUN mkdir caravel

# Install dependencies via pip
COPY requirements.txt caravel/
RUN pip install -r caravel/requirements.txt

# Copy admin password details to project folder for fabmanager
COPY admin.config caravel/

# Create an admin user
RUN /usr/local/bin/fabmanager create-admin --app caravel < /caravel/admin.config

# Initialize the database
RUN caravel db upgrade

# Create default roles and permissions
RUN caravel init

# Load some data to play with
# RUN caravel load_examples

# Start the development web server (default port: 8088)
CMD caravel runserver -d
