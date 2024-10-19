# Simple v dev container

This is a simple dev container for the V programming language using Ubuntu:24.10

## Build and run using docker compose

Docker compose will mount the local parent directory to the docker container's /v directory. Change ```volume.source``` in ```docker-compose.yaml``` to use another directory.

The commands in this section can also be found and run from ```compose_convenience_scripts```

When building I like to use the following arguments for debugging purposes (both can be omitted):

* ```--no-cache``` ignores cached steps and builds everything from scratch.
* ```--progress=plain``` displays the log of what is going on, as well as the container output for the different build steps.

```bash
# Build the image
docker compose build --no-cache --progress=plain

# Run the container in detatched mode (-d)
docker compose up -d 

# Attach and follow the logs
docker compose logs -f

# Stop the container
docker compose down
```

### Database

Using docker compose also adds a Postgres database container. It uses the ```.env``` file for some very simple configuration, setting the username, password and database name.

The ```POSTGRES_URL``` uses the container name and port. If the postgres service is renamed in ```docker-compose.yaml```, then the postgres url must be updated in ```.env``` aswell.

```plaintext
POSTGRES_USER="test"
POSTGRES_PASSWORD="test"
POSTGRES_URL="database:5432"
```

## Build and run without compose

```build_image.sh``` contains this simple build script to build the container image. It basically does the same as the docker compose build command above, except for mounting directories and opening a TTY to keep the container from exiting.

Building and running the image manually obviously does not include any database container or config like above.

```bash
docker build . --progress=plain --no-cache -t devcontainer_vlang
```

### Accessing the database

 Access the database using the CLI inside the postgres container:

```bash
# psql -d database_name username
psql -d postgres test

# Inside psql
\l      # List databases
\dn     # List schemas
\dt     # List tables inside schemas

# Connect to the database
\c database name
```
