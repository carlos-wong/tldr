# docker

> Manage Docker containers and images.
> Homepage: <https://docs.docker.com/engine/reference/commandline/cli/>.

- List currently running docker containers:

`docker ps`

- List all docker containers (running and stopped):

`docker ps -a`

- Start a container from an image, with a custom name:

`docker run --name {{container_name}} {{image}}`

- Start or stop an existing container:

`docker {{start|stop}} {{container_name}}`

- Pull an image from a docker registry:

`docker pull {{image}}`

- Open a shell inside of an already running container:

`docker exec -it {{container_name}} {{sh}}`

- Remove a stopped container:

`docker rm {{container_name}}`

- Fetch and follow the logs of a container:

`docker logs -f {{container_name}}`

- Commit container as image

`docker commit -m "add pymongo" -a "carlos" hash imagename:ver`

- Push image to server

`docker push imagename`

- Login

`docker login domain -u username`

- Remove stop containers

`docker ps -q -f status=exited | xargs -I {} -p docker rm {}`


