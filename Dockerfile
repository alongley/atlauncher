FROM openjdk:8u121-jre
MAINTAINER Andrew Longley <aolongley@gmail.com>
# update of jschulberger/atlauncher to fix build issues

EXPOSE 5901 25565

RUN adduser atlauncher --disabled-login
RUN adduser atlauncher sudo

RUN apt-get update && \
    apt-get -y install \
    wget \
    lxde-core \
    tightvncserver && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/atlauncher/ATLauncher
WORKDIR /home/atlauncher/ATLauncher

RUN wget https://download.nodecdn.net/containers/atl/ATLauncher.jar

COPY entrypoint.sh /home/atlauncher

RUN chmod a+x /home/atlauncher/entrypoint.sh

RUN chown -R atlauncher /home/atlauncher

CMD ["/home/atlauncher/entrypoint.sh"]
