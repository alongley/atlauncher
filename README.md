# Atlauncher Docker

Pull the repository

## via KiteMatic:

search for atlauncher, click this repository (alongley/atlauncher) and click create

## via command line

docker pull alongley/atlauncher

## then

1. create and start the container if it's not already started, e.g.
	$ docker build -t atlauncher .
	$ docker run -p 5901:5901 -p 25565:25565 -td --name atlauncher atlauncher
This creates an atlauncher container using the atlauncher image. You can
name the container anything you like, but if you change the container name you must
use the new name in all the appropriate commands below.
2. open a prompt into the container, either via KiteMatic's EXEC button or via 
	$ docker exec -ti -u root atlauncher bash
3. su to the vnc user and change the user's password from the default password
	$ su vnc
	$ <enter default password from vncsetup.sh file e.g. passpops if/when prompted>
	$ passwd
	$ <enter old password when prompted>
	$ <enter new password twice when prompted>
4. start vncserver and set the password for vnc sessions
	$ vncserver
	<enter the client password twice>
5. exit out of the shell and restart the container
	$ exit
	$ exit
	$ docker stop atlauncher
	$ docker start atlauncher

## other notes

startvncserver.sh is a relic of a previous method of setting up vncserver as a service 
that runs automatically on container startup. it uses systemd which docker containers do not
support well.