# Atlauncher Docker

Pull the repository

## via KiteMatic:

search for atlauncher, click this repository (alongley/atlauncher) and click create

## via command line

docker pull alongley/atlauncher

## then

1. start the container if it's not already started
2. open a prompt into the container, either via KiteMatic's Exec button or via 
`docker exec -ti -u root <container_name> bash`
3. su to the vnc user and change the user's password from the default password
	$ su vnc
	$ <enter default password from vncsetup.sh file e.g. passpops when prompted>
	$ passwd
	$ <enter old password when prompted>
	$ <enter new password twice when prompted>
4. start vncserver and set the password for vnc sessions
	$ vncserver
5. edit the entrypoint.sh script and uncomment the line which invokes vncserver.
You can also comment out the tail line if you like, it's purposes is to allow you to exec into the container.

## other notes

startvncserver.sh is a relic of a previous method of setting up vncserver as a service 
that runs automatically on container startup. it uses systemd which docker containers do not
support well.