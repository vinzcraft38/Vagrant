
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.define "gitlab" do |gitlab|
    gitlab.vm.hostname = "gitlab"
    gitlab.vm.network "forwarded_port", guest: 80, host:8080, auto_correct: true 
    gitlab.vm.provider "virtualbox" do |vbox|
      vbox.name = "Gitlab"
      vbox.cpus = "2"
      vbox.memory = "4096"
    end
    gitlab.vm.provision "shell", path: "scripts/gitlab-provision.sh" ##execution d'un script bash
  end
end
