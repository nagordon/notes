# Using virtualbox for virtualization

## Creating a share drive in Windows 7 and VirtualBox with Linux

1. Create a directory named ```share``` on the host machine, perferrably in the VM folder typically ```C:\Users\user1\VirtualBox VMs\xubuntu\share```
2. Create a directory in the home directory, ```mkdir /home/user1/share```
3. Launch virtual machine and add share definition with 
```
> Devices
 > Shared Folder Settings
  > Add new share folder definition
```
4. run ```sudo mount -t vboxsf share /home/user1/share``` on the host machine to mount


To work through the command line with a shared folder, set up ssh, and connect with gitbash

```bash
sudo apt-get install ssh

#launch gitbash from the share folder
ssh neal@12.34.56.78
```

if having issues with Screen resolution and copy-paste etc, run the guest additions install

VirtualBox -> Devices -> Insert Guest Additions CD Image
