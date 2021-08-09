Vagrant.configure("2") do |config|
  config.vm.define "source", autostart: false do |source|
      source.vm.box = "{{.SourceBox}}"
  end
  config.vm.define "output" do |output|
      output.vm.box = "{{.BoxName}}"
  end

  config.vm.provider "virtualbox" do |vbox|
    vbox.cpus = 2
    vbox.memory = 4096

    # Make sure the VirtualBox clock remains in sync, full paranoia mode
    # (Stolen from: https://gist.github.com/aboutte/f4adcbfc33cc7309791e0d21102c3d38)
    vb.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-interval", 10000 ]
    vb.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-min-adjust", 100 ]
    vb.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-on-restore", 1 ]
    vb.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-start", 1 ]
    vb.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 1000 ]

    # Fixes bug with audio stack on MacOS
    vb.customize [ "modifyvm", :id, "--audio", "null", "--audioin", "off", "--audioout", "off" ]

    # Fixes bug with video stack on MacOS
    vb.customize [ "modifyvm", :id, '--graphicscontroller', 'vmsvga' ]
    vb.customize [ "modifyvm", :id, '--vram', '20' ]

    # Use NAT DNS proxy to fix potential DHCP issues (note: do not use --natdnsproxy1 since this can cause horrible network slowdowns on macOS)
    vb.customize [ "modifyvm", :id, "--natdnsproxy1", "on" ]
  end

  {{ if ne .SyncedFolder "" -}}
  		config.vm.synced_folder "{{.SyncedFolder}}", "/vagrant"
  {{- else -}}
  		config.vm.synced_folder ".", "/vagrant", disabled: true
  {{- end}}
end