---
title: Docker basics
draft: false
tags:
  - Docker
  - Dockerfile
  - containers
  - term
  - Go
---

# Docker

## Docker Engine

It runs the whole thing.

## Docker Build

Build images from **Dockerfiles**. In terms of command line toys, there's `docker build` and `docker buildx build` which is [like `build` on rails.](https://docs.docker.com/build/builders/#difference-between-docker-build-and-docker-buildx-build)\
**Docker Buildx** though is the client interface for building & managing images, whereas **Docker BuildKit** is the server that does the heavy lifting including execution.\
Builx's build request to BuildKit includes the **Dockerfile**, **build args** and **export and/or caching opts**.

### Example Dockerfile

From [`https://github.com/cloudnativedevops/demo.git`](https://github.com/cloudnativedevops/demo).\
Anyways, here's a very plain and simple Go HTTP server that runs on `127.0.0.1:8888`:

```go
package main

import (
	"fmt"
	"log"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "Hello, 世界")
}

func main() {
	http.HandleFunc("/", handler)
	fmt.Println("Running demo app. Press Ctrl+C to exit...")
	log.Fatal(http.ListenAndServe(":8888", nil))
}
```

Now here's the Dockerfile

```dockerfile
FROM golang:1.17-alpine AS build

WORKDIR /src/
COPY main.go go.* /src/
RUN CGO_ENABLED=0 go build -o /bin/demo

FROM scratch
COPY --from=build /bin/demo /bin/demo
ENTRYPOINT ["/bin/demo"]
```

Then you run one of those[^1] to build and run at `127.0.0.1:9999`:

```sh
docker image build -t myhello .
docker container run -p 9999:8888 myhello
```

> [!caution] Caution
>
> The port syntax for `docker run` is `HOST_PORT:CONTAINER_PORT`, so to access the container and receive the pretty *"Hello, 世界"* you refer to your host's address with the **first** port you provided.
> ```sh
> curl -v 127.0.0.1:9999
> ```

Inspect your image & container (prints a JSON to stdout):

```sh
docker image inspect myhello
docker inspect myhello
docker container inspect c7112281a566
docker inspect c7112281a566
```

Also check if it's running:

```sh
docker ps
docker container ls
```

> [!tip]- Container names
> 
> When you build an image, by default it just gets a hexadecimal ID, which you can use to refer to it later (for example, to run it). These IDs aren't particularly memorable or easy to type, so Docker allows you to give the image a human-readable name, using the `-t` switch to `docker image build`. In the previous example you named the image `myhello`, so you should be able to use that name to run the image now.
>
> *(Credit: writers of book from parent chapter's [repository](https://github.com/cloudnativedevops/demo))*

## Docker Compose

Docker, but on rails (featuring YAML from DevOps May Cry).

[^1]: Of course, appending `sudo` to both commands in the case I'm still a silly GoobSec shellhead that doesn't wanna create a Docker group.

