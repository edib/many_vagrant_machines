NUMBER_OF_MEMBERS = 2
OS_DISTRO = "generic"
OS_VERSION = "ubuntu2004"
MEMBER_HOSTNAME_PREFIX = "node"
CLUSTER_RANGE = "10.11.12.1"

Vagrant.configure(2) do |config|
  (1..NUMBER_OF_MEMBERS).each do |i|
    config.vm.box = "#{OS_DISTRO}/#{OS_VERSION}"

    config.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 2
    end
    config.vm.define "#{MEMBER_HOSTNAME_PREFIX}#{i}" do |node|
      ## debian için
      #node.vm.provision "shell", inline: 'echo "vagrant:vagrant" | chpasswd'
      node.vm.hostname = "#{MEMBER_HOSTNAME_PREFIX}#{i}"
      node.vm.network "private_network", ip: "#{CLUSTER_RANGE}#{i}"
      node.vm.provision "shell", inline: <<-SHELL
          sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config   
          hostname -I
          systemctl restart ssh 
     SHELL
    end
  end
end
