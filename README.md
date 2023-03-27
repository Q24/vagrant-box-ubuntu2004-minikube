# vagrant-box-ubuntu2004-minikube
## Archival warning
**IMPORTANT NOTE**: This project has been archived and will no longer be updated with new box versions. While Ubuntu 20.04 itself is still actively supported, we encourage you to switch to Ubuntu 22.04, using project [vagrant-box-ubuntu2204](https://github.com/Q24/vagrant-box-ubuntu2204). Internally, we've switched all our Vagrant boxes to this version for quite some time already, without any problems.

## Description
This project contains everything needed to build the ubuntu2004-minikube vagrant box. The box is build using Vagrant's packer tool. Currently only a box for the VirtualBox provider is built.

The box resulting is based on a clean Ubuntu 20.04 minimal install. I try to keep the builds up to date with the latest version of this box. Several tools are included in the box:
* ansible
* minikube
* docker
* helm
* kubectl
* kubetail

Built boxes can be found on [Vagrant Cloud](https://app.vagrantup.com/ilionx/boxes/ubuntu2004-minikube)

## Prerequisites
To be able to build the box yourself, you'll need at least following tools installed:

* [Virtualbox](https://www.virtualbox.org/) (tested with version 7.0.4 - not backwards compatible with version 6)
* [Packer](https://www.packer.io/) (tested with version 1.8.5)
* [Vagrant](https://www.vagrantup.com/) (tested with version 2.3.4)

The build wil be uploaded to Vagrant Cloud, so you'll need an account and corresponding token there. On top of that, the box has to be pre-created for the upload to succeed.

## Usage
1. Make sure you have a Vagrant Cloud account with an authentication token. You need to have "admin" access to the [Vagrant Cloud box](https://app.vagrantup.com/ilionx/boxes/ubuntu2004-minikube), or you need to be the owner of the box for the upload to work automatically. This token can be created via [`Account settings -> Security`](https://app.vagrantup.com/settings/security). You can enter the username and token when requested by the `build.sh` script (but you will need to do this every time when creating a new build), or you can create a file `build.env` in the root of this repository where you set the variables as follows:

```
DEFAULT_VAGRANT_CLOUD_USER="your.username"
DEFAULT_VAGRANT_CLOUD_TOKEN="your.vagrant.cloud.token"
```

2. The script will update box `ilionx/ubuntu2004-minikube`. This name is hardcoded in the scripts. If you wish to create a box in your own account, change the following two environment variables in `build.sh`:

```
export VAGRANT_CLOUD_BOX_USER="ilionx"
export VAGRANT_CLOUD_BOX_NAME="ubuntu2004-minikube"
```

3. Make your changes, and commit them in your local git repository.
4. From this project's root directory run the build.sh bash script:
```
./build.sh
```
5. The packer Vagrant builder will create and package your new box in a file named `build/package.box`.
6. Vagrant cloud post-processor will create a new version and upload the box to the Vagrant Cloud.
7. If the box build succeeded, the script will automatically create a tag in your local git repository. If you are happy with the results, push to GitHub, and create a GitHub release based on the tag.
8. Finally, log into your Vagrant Cloud and release the box to make it available for everybody, and publish the GitHub release.
9. Get yourself a celebratory beer!

## Using the base box
You can use the base box like any other base box. The easiest way is to use the Vagrant `init` command:

```
vagrant init ilionx/ubuntu2004-minikube
```

This will create a barebones `Vagrantfile` which you can customise to your liking. The box itself is provisioned with Ansible, so if you wish to use Ansible in your provisioning process, you do not need to install Ansible again, as this is already part of the base box.

Configure your `Vagrantfile` as follows to re-use the pre-installed Ansible (if you don't want to use Ansible to do your provisioning, you can skip this):

```
# Provision using Ansible, using the pre-installed Ansible in the base box
config.vm.provision :ansible_local do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.install = false
    ansible.compatibility_mode = "2.0"
    ansible.become = true # This can be true or false, whether or not you need to do stuff as root
end
```

If you wish to do provisioning on every box boot, you can use Ansible for that too:

```
# Provision using Ansible on every boot, using the pre-installed Ansible in the base box
config.vm.provision 'ansible', run: 'always', type: :ansible_local do |ansible|
    ansible.playbook = "on-boot-playbook.yml"
    ansible.install = false
    ansible.compatibility_mode = "2.0"
    ansible.become = true # This can be true or false, whether or not you need to do stuff as root
end
```

## Changelog
You can find the changelog [here](CHANGELOG.md).

## License
This code is licensed under the [Apache 2.0 license](LICENSE).