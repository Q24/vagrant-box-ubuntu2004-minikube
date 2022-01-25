# Creating a new box release

To create a new box release, do the following:

## Prepare build environment

Check [README.md](README.md) to install all necessary tools and configurations to set up your local build environment.

## Update build.sh

* Update `BOX_VERSION_BASE` to a new version, use the semantic versioning scheme.
* Check if there is a new [base box](https://github.com/Q24/vagrant-box-ubuntu2004) release, if so update `BOX_BASE_VERSION`.
* Check if there is a new [Minikube](https://github.com/kubernetes/minikube/releases) release, if so update `MINIKUBE_VERSION`
* Check if there is a new [Docker](https://docs.docker.com/engine/release-notes/) release using `apt list -a docker-ce`, if so update `DOCKER_VERSION`.
* Check if there is a new [kubectl](https://github.com/kubernetes/kubernetes/releases) release using `apt list -a kubectl`, if so update `KUBECTL_VERSION`.
* Check if there is a new [Helm](https://github.com/helm/helm/releases) release, if so update `HELM_VERSION`.
* Check if there is a new [kubetail](https://github.com/johanhaleby/kubetail/releases) release, if so update `KUBETAIL_VERSION`.
* Check if there is a new [kubelogs](https://gitlab.com/mrvantage/kubelogs/-/releases) release, if so update `KUBELOGS_VERSION`.
* Check your local tools versions, and update `VIRTUALBOX_VERSION`, `PACKER_VERSION`, and `VAGRANT_VERSION` accordingly.

## Update CHANGELOG.md

Create a new section in [CHANGELOG.md](CHANGELOG.md) with the new box version you have just created. The final version  tag will be `BOX_VERSION_BASE-YYYYMMDD` with `YYYYMMDD` being today's date (at the time of running `build.sh`).

In this section, add bullets for every item you have changed in the release.

## Update README.md

Check [README.md](README.md) under Prerequisites, check if you need to update the tool versions for VirtualBox, Packer and Vagrant in you used new versions to create the build.

## Commit your changes

If you are satisfied with all changes made to all files, commit your changes in git but do not push them yet.

```shell
git commit -am "New box version: BOX_VERSION_BASE-YYYYMMDD."
```

Be sure to replace the commit message with the actual box version.

## Run build.sh

Run `build.sh` to create the actual build.

This will create the base box and updload it to Vagrant, but will not publish it yet. It will incorporate the git commit you have just made in the documentation so the build can be reproduced.

## Push the code and publish the release

If you are happy with your new build, do the following:

Push your git commit and tag to GitHub:

```shell
git push
git push origin BOX_VERSION_BASE-YYYYMMDD
```

Log into Vagrant and publish the box you have just uploaded.

Finally, in GitHub, create a release based on the tag you have just pushed, copying the section you have added in [CHANGELOG.md](CHANGELOG.md) as the release notes.

## Failed build or changes needed

Should the build fail, or if you want to make changes, do the following:

* Delete the uploaded and unreleased box from Vagrant.
* If it had been created, delete the tag in your local git repository created by `build.sh`.
* Change anything as you so wish.
* Git `commit --amend` to update your previous commit.
* Run `build.sh` to build again.
* If you are happy with this build, push your code as normal, or re-run these steps until you are happy.