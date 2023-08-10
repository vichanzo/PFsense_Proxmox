# Install the base programs needed to run ansible
apt install git openssh-server sudo ansible

# Clone this repository to your computer
git clone https://github.com/vichanzo/PFsense_Proxmox.git

# Download the PFsense ISO
wget https://atxfiles.netgate.com/mirror/downloads/pfSense-CE-2.7.0-RELEASE-amd64.iso.gz?_gl=1*3rkkdf*_ga*NDk4MDQ4NzE4LjE2OTE2NDQ0ODE.*_ga_TM99KBGXCB*MTY5MTY0NDQ4MS4xLjAuMTY5MTY0NDQ4MS42MC4wLjA.

# Extract the ISO
gunzip -c pfSense-CE-2.7.0-RELEASE-amd64.iso.gz > /var/lib/vz/template/iso/pfsense.iso
