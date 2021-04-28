Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  
  # Define VM
  config.vm.define "devops-for-programmers-project-lvl1"

  # The hostname the machine should have
  config.vm.hostname = "devops-for-programmers-project-lvl1"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine.
  config.vm.network "forwarded_port", guest: 8080, host: 8080,
    id: "port_nodejs_http",
    guest_ip: "0.0.0.0",
    host_ip: "127.0.0.1"

  config.vm.network "forwarded_port", guest: 80, host: 8000,
    id: "port_caddy_http",
    guest_ip: "0.0.0.0",
    host_ip: "127.0.0.1"

  config.vm.network "forwarded_port", guest: 443, host: 4430,
    id: "port_caddy_https",
    guest_ip: "0.0.0.0",
    host_ip: "127.0.0.1"

  # Share an additional folder to the guest VM.
  config.vm.synced_folder ".", "/vagrant"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false
  
    # Customize the amount of memory on the VM
    vb.memory = "2048"

    # Customize the name that appears in the VirtualBox GUI
    vb.name = "devops-for-programmers-project-lvl1"

    # Enable Symbolic Links
    vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant", "1"]
  end

  # Run Ansible from the Vagrant Host
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "./provision/playbook.yml"
  end
end
