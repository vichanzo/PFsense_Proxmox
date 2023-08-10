# Using Ansible to install PFsense as a VM in Proxmox
This is my personal notes on running PFsense as a VM in Proxmox.
I am using Ansible as the tool to maintain and deploy most packages.

Basic Process:
1) Install Proxmox using the ISO if you don't know how search the web for how to "install Proxmox using USB"
2) Run the provided shell script
    + This shell script will install the basic pre-requisites using APT
    + Clone the files from this repository
    + Download the PFsense ISO using wget to the appropriate folder /var/lib/images
3) Run the Ansible Playbook to complete the rest of the installation and configuration
    + substep 1
    + substep 2 

What you need:
- Server with at least 2 network ports (one for WAN/external network and one for LAN/internal network)
- USB disk 4-8GB that you can wipe clean
- Some basic knowledge of Linux

## Step 1 - Install Proxmox on your server
1) Download the Proxmox iso from https://enterprise.proxmox.com/iso/proxmox-ve_8.0-2.iso
2) Create a bootable USB following your favorite method or use this guide: https://pve.proxmox.com/wiki/Prepare_Installation_Media.

## Step 2 - Create and run the shell script.
1) Log into your proxmox as root (and password you provided)
2) nano preinstall.sh
3) Copy the below text into the editor window (press CNTL-X when done and ENTER to save the file)
```
# Install the base programs needed to run ansible
apt install git openssh-server sudo ansible

# Clone this repository to your computer
git clone https://github.com/vichanzo/PFsense_Proxmox.git

# Download the PFsense ISO
wget https://atxfiles.netgate.com/mirror/downloads/pfSense-CE-2.7.0-RELEASE-amd64.iso.gz

# Extract the ISO
gunzip -c pfSense-CE-2.7.0-RELEASE-amd64.iso.gz > /var/lib/vz/template/iso/pfsense.iso
``` 

4) run the shell script

```
bash ./preinstall.sh
```

## Step 3 - Run the Ansible Playbook locally
run the following command:
```
cd PFsense_Proxmox && ansible-playbook local.yml
```
What does the local.yml file do?
- Install tools to allow Ansible to manage Proxmox
- Create a VM for PFsense
- Run the VM for PFsense

## Step 4 - Load the configuration file that you backed up into your virtualized PFSense

