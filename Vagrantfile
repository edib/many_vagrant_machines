
# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

CLUSTER_RANGE = "10.11.12"
CLUSTER_RANGE_START = 2
NUMBER_OF_MEMBERS = 3
OS_DISTRO = "generic"
OS_VERSION = "ubuntu2004"
MEMBER_HOSTNAME_PREFIX = "#{OS_DISTRO}#{OS_VERSION}"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "#{OS_DISTRO}/#{OS_VERSION}"

config.vm.provider "virtualbox" do |v|
  v.memory = 2048
  v.cpus = 2
end

  (CLUSTER_RANGE_START..CLUSTER_RANGE_START+NUMBER_OF_MEMBERS-1).each do |i|
        vm_name = "#{MEMBER_HOSTNAME_PREFIX}#{i}"
        ip_address = "#{CLUSTER_RANGE}.#{i}"
        config.vm.define vm_name do |server|
          server.vm.hostname = vm_name
          server.vm.network "private_network", ip: "#{ip_address}"
          server.vm.provision "shell", inline: <<-SHELL
          sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config   
	          ## node ip addresses
            hostname -I
            systemctl restart ssh 
            hostname -I
          SHELL                  
      end
end
