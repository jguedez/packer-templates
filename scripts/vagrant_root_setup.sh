# updating and Upgrading dependencies
apt-get update -y -q
apt-get upgrade -y -q

#extra software nice to have...
apt-get install -y -q tmux vim curl unzip

# dependencies for vbox guest additions
apt-get install -y -q linux-headers-$(uname -r) build-essential dkms bzip2
echo 'vagrant ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers.d/vagrant

# install vbox guest additions
mkdir /tmp/virtualbox
mount -o loop /home/vagrant/VBoxGuestAdditions.iso /tmp/virtualbox
sh /tmp/virtualbox/VBoxLinuxAdditions.run --nox11
umount /tmp/virtualbox
rmdir /tmp/virtualbox
rm /home/vagrant/*.iso

# disable reverse dns lookups on ssh
echo 'UseDNS no' >> /etc/ssh/sshd_config

# remove apt proxy if used...
rm -f /etc/apt/apt.conf
