# Docker is a containerization open-source program that allows for isolated development environments.

I am using a windows machine with VirtualBox and Ubuntu 14.04 LTS. To install docker, use. For more info on Docker, see the [documentation](http://docs.docker.com/userguide/usingdocker/)

files needed on a windows machine

[boot2docker](https://github.com/boot2docker/windows-installer/releases/tag/v1.3.0)
[docker-toolbox](https://docs.docker.com/installation/windows/)

## Quick commands
You may need to run ```sudo``` before all the commands 

```bash
docker # returns commands
docker --help  # returns help
docker attach --help  # returns help on the command attach
docker ps # Lists running containers. use -a for all
docker logs # Shows us the standard output of a container.
docker stop # Stops running containers.
docker run -i -t ubuntu /bin/bash   # run interactive container
docker version
```

## Install

```bash
sudo apt-get install docker.io  
```

Now, check to make sure that docker installed properly, run

```bash
sudo docker run hello-world  
```

Now, to create a base ubuntu container, run  

```bash
sudo docker.io pull ubuntu   
sudo docker.io run -i -t ubuntu /bin/bash    
```

Now, we can run all the programs in ubuntu without having any problems with programs clashing


We can also just run docker with an image called and if it is not found, it will download an image from docker hub and use it

```bash
docker run ubuntu:14.04 /bin/bash 'Hello Docker World'
# or for an interactive terminal
docker run -t -i ubuntu:14.04 /bin/bash
```

Finally, we get exit our container bash session with

```bash
exit
```

To run a container as a daemon, run

```bash
docker run -d ubuntu:14.04 /bin/sh -c "while true; do echo hello world; sleep 1; done"
```

to see all docker processes

```bash
docker ps
```
stops the current docker container

```bash
docker stop #containernum
```

Shows the images we have local
```bash
docker images
```

Can search docker images on hub
```bash
docker search calibre

# pull the image we searched
docker pull zeitgeist/docker-calibre

# run the container
docker run -t -i zeitgeist/docker-calibre /bin/bash 
```


## How about some practical stuff, python with miniconda

For example, a program I use a lot is miniconda for managing python packages

lets find info about our os with
 
```bash
uname -a
wget https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh
chmod +x Miniconda-latest-Linux-x86_64.sh
bash Miniconda-latest-Linux-x86_64.sh
```


## Docker GUI for windows

We can use [kitematic](http://docs.docker.com/kitematic/userguide/) to make setting up containers easier.
