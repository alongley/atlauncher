#FROM openjdk:8u121-jre
FROM openjdk:8-jre
MAINTAINER Andrew Longley <aolongley@gmail.com>
# update of jschulberger/atlauncher to fix build issues

EXPOSE 5901 25565

RUN adduser atlauncher --disabled-login
#RUN adduser atlauncher sudo

RUN apt-get update && \
    apt-get -y install \
    vim \
    wget \
    lxde-core \
    tightvncserver && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/atlauncher/ATLauncher
#run mkdir -p /home/atlauncher/.vnc

WORKDIR /home/atlauncher/ATLauncher

RUN wget https://download.nodecdn.net/containers/atl/ATLauncher.jar

COPY entrypoint.sh /tmp
COPY *vnc* /tmp/
#COPY xstartup /tmp
#COPY passwd /tmp
RUN chmod a+x /tmp/*.sh

RUN chown -R atlauncher /home/atlauncher

RUN /tmp/vncsetup.sh

USER vnc

CMD ["/home/vnc/entrypoint.sh"]
