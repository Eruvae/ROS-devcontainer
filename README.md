# ROS devcontainer

Provides an easy setup of ROS with the Dev Container extension of VS Code. The setup was originally created using the [VS Code Docker Guide](https://docs.ros.org/en/humble/How-To-Guides/Setup-ROS-2-with-VSCode-and-Docker-Container.html) in the ROS 2 documentation, but has been modified.

## Prerequisites

You have to install VS Code, Docker, and the Dev Container extension for VS Code. The installation of VS Code on Ubuntu is described [here](https://code.visualstudio.com/docs/setup/linux). For a guide to set up dev containers, check out [this tutorial](https://code.visualstudio.com/docs/devcontainers/tutorial). For installing docker on Ubuntu, you can use the docker apt repository, as described in the [docker docs](https://docs.docker.com/engine/install/ubuntu/). The official docker packages of Ubuntu may also work, but may be older version.

## Workspace setup

The ros1 and ros2 folders contain a hidden .devcontainer folder with the configuration files for the container. To start up the container, you can press F1 and search for "Dev Containers: Open Folder in Container...", then select either ros1 or ros2. Alternatively, you can navigate to the folder in a terminal and open it with "code .". VS Code should recognize the .devcontainer configuration and ask you if you want to reopen the folder in the container. If it doesn't, you can also press F1 and search for "Dev Containers: Rebuild and Reopen in Container".

You may want to modify the files for your setup:

### devcontainer.json

The entry point for the devcontainer. You may want to change the ROS_DISTRO and IMAGE_SUFFIX variables. It also by default mounts the .ssh directory from your home folder into the docker home directory, so that you can use your keys from within. This may not be necessary depending on your use case (devcontainers also have a [built-in functionality](https://code.visualstudio.com/remote/advancedcontainers/sharing-git-credentials) to share git credentials and ssh keys).

### Dockerfile

Pulls the docker image for the specified distribution. Note that there are different versions of docker images with preinstalled packages available, so depending on your use case, you might want to switch to one of those (see devcontainer.json). Also installs some basic packages. You can add additional packages you need. Workspace dependencies will be installed via rosdep when the container is started via postCreateCommand, but these packages might have to be reinstalled if you change the workspace and have additional dependencies. So it could be worth it to manually check your dependencies and add those here. These will then be cached by Docker, so as long as you don't change the Dockerfile, you will not need to reinstall them.

### initialize.sh

This file is executed on the host machine during initialization. Currently not used.

### postCreate.sh

This file is executed after the container has been created. It installs missing workspace dependencies via rosdep and gives the container user ownership of the mounted workspace folder. It also initializes and builds the workspace.