set -e -u

# disable selinux
sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config
# enable vagrant PasswordAuthentication
sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
reboot
