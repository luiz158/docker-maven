# Gradle Executable Container

This docker image includes Oracle Java 7 and Maven 3.0.5 configured with Maven as the entrypoint.

## Usage

By defaut, running this image without any command will run `maven -version` in the /app directory. 

### Doing Something Actually Useful
To run something more interesting, say `maven clean install`, you should mount your project root in /app. For example, you can run the following: 

```bash
docker run --rm -v /path/to/your/project:/app:rw niaquinto/maven clean install
```

### Changing the Default Behavior
Say you want `maven package` to run if you launch the container without any options. To do that, just make a new dockerfile like the following. Also, while your at it, you should change the user to match your development environment (so that running the container doesn't keep chown'ing your /build directory to root).

```bash
# Use this image as a base
FROM niaquinto/maven
MAINTAINER your-name <your@email.com>

# In case someone loses the Dockerfile
RUN rm -rf /etc/Dockerfile
ADD Dockerfile /etc/Dockerfile

# Get /app out of the way
RUN rm -rf /app

# Add your desired user and group
RUN groupadd your-group-name
RUN useradd -s /bin/bash -m -d /app -g your-group-name your-user-name

# Set your desired user as default
USER your-user-name

# Set your default behavior
ENTRYPOINT ["maven"]
CMD ["install"]
```

## Get the Image

To build this image yourself, run...
 
```bash
docker build github.com/niaquinto/docker-maven
```

Or, you can pull the image from the central docker repository by using... 

```bash
docker pull niaquinto/maven
```
