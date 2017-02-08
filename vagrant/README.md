# Notes on using Vagrant
Virtual machines using vagrant

[Vagrant](https://www.vagrantup.com/) is a portable development environment that uses [Virtualbox]() and is meant to be included in the version control of your project. It makes managing virtual machines very easy from a command line via ssh connection. Vagrant uses a base image to create a virtual machine called boxes. 

## Getting Started
To start an environment type in either bash or powershell

```bash
mkdir vagrant_getting_started
cd vagrant_getting_started
vagrant init hashicorp/precise32  # creates Ubuntu 12.04 LTS 32-bit image
# or vagrant init ubuntu/trusty64
vagrant up
```
Once the box is set up, make sure you have git install to access the MINGGW32 bash terminal in windows or use bash in linux. From the *git bash* type
```
vagrant ssh
```
and that will enter an ssh terminal into the box

The VM syncs easily with the host machine. To test run in the ssh session of the vagrant machine

```
touch /vagrant/foo
echo "testing the files sync in a vagrant VM" >> /vagrant/sync
exit
ls
```

## Provisioning

1. Add a bash script to the vagrant folder
2. Add a line to the *Vagrantfile*
3. run ```vagrant up``` or ```vagrant reload--provision```

## Restarting and Stopping
To reload a VM, run ```vagrant reload```, which will reload any new changes, or if starting fresh ```vagrant up```. When complete, run ```vagrant halt``` to finish the session

## Networking

To run a webserver from the vagrant VM, edit the *Vagranfile* and add a line 

```
Vagrant.configure("2") do |config|
  config.vm.network "public_network"
end
```

This will give the VM its own ip address, which can be fouind as *eth1* using ```ifconfig```

More to come
