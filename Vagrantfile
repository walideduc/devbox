required_plugins = %w( vagrant-vbguest vagrant-proxyconf )
required_plugins.each do |plugin|
  system "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end

Vagrant.configure("2") do |config|

  config.vm.box = "centos/7"

  config.vm.define "devbox", primary: true do |web|

    config.vm.hostname = "devbox"

    config.vm.provider "virtualbox" do |vb|
      vb.cpus = "4"
      vb.memory = "4096"
    end

    if Vagrant.has_plugin?("vagrant-proxyconf")

      # vagrant proxy-conf does not work with docker/systemd and centos7 base box, disable and set proxy by hand
      config.proxy.enabled = { docker: false }
      config.proxy.http     = "http://proxy.priv.atos.fr:3128/"
      config.proxy.https    = "http://proxy.priv.atos.fr:3128/"
      config.proxy.no_proxy = "localhost,127.0.0.1,devbox,.priv.atos.fr,.local"

    end

    # force shared folder with VB instead of rsync (configured in base box)
    config.vm.synced_folder "./", "/vagrant", type: "virtualbox", disabled: false

    config.vm.network "forwarded_port", guest: 80, host: 80
    config.vm.network "forwarded_port", guest: 443, host: 443

    config.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "provisioning/playbook.yml"
    end

  end

end
