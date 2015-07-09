FROM java:8-jdk
MAINTAINER Nicholas Iaquinto <nickiaq@gmail.com>

RUN apt-get update && \
    apt-get install -y maven

RUN mkdir /app
WORKDIR /app

ENTRYPOINT ["mvn"]
CMD ["-version"]
