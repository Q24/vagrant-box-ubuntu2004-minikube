## Changelog

### 1.2.4-20220825
* Updated to ilionx/ubuntu2004 base box version 1.1.7-20220825 (with Ansible 6.3.0)
* Updated minikube to version 1.26.1
* Installed cri-dockerd version 0.2.5 (required by minikube)
* Installed cri-tools version 1.24.2-00 (required by minikube)
* Updated Docker to version 20.10.17
* Updated kubectl to version 1.25.0
* Updated Helm to version 3.9.4
* Updated build dependencies: VirtualBox (6.1.36r152435), Packer (1.8.3), Vagrant (2.3.0)
* 
### 1.2.3-20220503
* Updated to ilionx/ubuntu2004 base box version 1.1.6-20220503 (with Ansible 5.7.0)
* Updated docker to version 5:20.10.14~3-0~ubuntu-focal
* Updated kubectl to version 1.23.6-00
* Updated helm to version 3.8.2
* Updated virtualbox dependency to version 6.1.34
* Updated packer dependency to version 1.8.0

### 1.2.2-20220415
* Unreleased internal testing version

### 1.2.1-20220228
* Updated to ilionx/ubuntu2004 base box version 1.1.5-20220228 (with Ubuntu 20.04.4 and Ansible 5.4.0)
* Updated minikube to version 1.25.2
* Updated kubectl to version 1.23.4
* Updated virtualbox dependency to version 6.1.32
* Updated packer dependency to version 1.7.10
* Zeroed out the file system at the end of the build, to reduce the size of the virtual disk after compression

### 1.2.0-20220125
* Add [kubelogs](https://gitlab.com/mrvantage/kubelogs/) tool 
* Updated to ilionx/ubuntu2004 base box version 1.1.3-20220125 (with Ansible 5.2.0)
* Updated minikube to version 1.25.1
* Updated Docker to version 5:20.10.12~3-0~ubuntu-focal
* Updated kubectl to version 1.23.2
* Updated helm to version 3.8.0

### 1.1.2-20211122
* Updated to ilionx/ubuntu2004 base box version 1.1.2-20211122 (with Ansible 4.8.0)
* Updated minikube to version 1.24.0
* Updated Docker to version 5:20.10.11~3-0~ubuntu-focal
* Updated kubectl to version 1.22.4
* Updated helm to version 3.7.1
* Updated packer dependency to version 1.7.8
* Updated vagrant dependency to version 2.2.19

### 1.1.1-20211006
* Updated to ilionx/ubuntu2004 base box version 1.1.1-20211006 (with Ansible 4.6.0)
* Updated minikube to version 1.23.2
* Updated Docker to version 5:20.10.9~3-0~ubuntu-focal
* Updated kubectl to version 1.22.2
* Updated helm to version 3.7.0
* Updated packer dependency to version 1.7.6
* Updated vagrant dependency to version 2.2.18

### 1.1.0-20210902
* Updated to ilionx/ubuntu2004 base box version 1.1.0-20210902 (with Ubuntu 20.04.3)
* Updated kubectl to version 1.22.1

### 1.0.0-20210811
* First release of this box, based on ilionx/ubuntu2004 version 1.0.0-20210811
* minikube: 1.22.0
* Docker: 20.10.8
* kubectl: 1.22.0
* Helm: 3.6.3
* kubetail: 1.6.13