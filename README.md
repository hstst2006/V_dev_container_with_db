# Simple v dev container

This is a simple dev container for the V programming language using Ubuntu:24.10

## Build and run using docker compose

Docker compose will mount the local parent directory to the docker container's /v directory. Change ```volume.source``` in ```docker-compose.yaml``` to use another directory.

When building I like to use the following arguments (both can be omitted):

* ```--no-cache``` ignores cached steps and builds everything from scratch.
* ```--progress=plain``` displays the log of what is going on, as well as the container output for the different build steps.

```bash
# Build the image
docker compose build --no-cache --progress=plain

# Run the container in detatched mode (-d)
docker compose up -d 

# Stop the container
docker compose down
```

## Build and run without compose

```build_image.sh``` contains this simple build script to build the container image. It basically does the same as the docker compose build command above, except for mounting directories and opening a TTY to keep the container from exiting.

```bash
docker build . --progress=plain --no-cache -t devcontainer_vlang
```
