ARG DOCKER_REPO
ARG ROS_DISTRO
ARG IMAGE_SUFFIX
FROM $DOCKER_REPO:$ROS_DISTRO$IMAGE_SUFFIX
ARG USERNAME
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME
# Install additonal packages - add any that you need
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y python3-pip python-is-python3 python3-catkin-tools jq ssh neovim git
ENV SHELL /bin/bash

# Source ROS environment automatically
RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> /home/$USERNAME/.bashrc
RUN echo "source /home/ws/devel_release/setup.bash" >> /home/$USERNAME/.bashrc

# Set the default user
USER $USERNAME
CMD ["/bin/bash"]
