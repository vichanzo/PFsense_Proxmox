# Using Ansible to install PFsense as a VM in Proxmox
This is my personal notes on running PFsense as a VM in Proxmox.
I am using Ansible as the tool to maintain and deploy most packages.

Basic Process:
1) Install Proxmox using the ISO if you don't know how search the web for how to "install Proxmox using USB"
2) Run the provided shell scriptDown
    + This shell script will install the basic pre-requisites using APT
    + Clone the files from this repository
    + Download the PFsense ISO using wget to the appropriate folder /var/lib/images
3) Run the Ansible Playbook to complete the rest of the installation and configuration
    + ksd 

What you need:
- Server with at least 2 network ports (one for WAN/external network and one for LAN/internal network)
- USB disk 4-8GB that you can wipe clean
- Some basic knowledge of Linux

## Step 1 - Install Proxmox on your server
Download the Proxmox iso from [https://enterprise.proxmox.com/iso/proxmox-ve_8.0-2.iso]
Create a bootable USB following your favorite method or use this [guide] (https://pve.proxmox.com/wiki/Prepare_Installation_Media).

## Step 2 - Create and run the shell script.
- Log into your proxmox as root (and password you provided)
- nano preinstall.sh
- Copy the below text into the editor window (press CNTL-X when done and ENTER to save the file)
```
# Install the base programs needed to run ansible
apt install git openssh-server sudo ansible

# Clone this repository to your computer
git clone https://github.com/vichanzo/PFsense_Proxmox.git

```
