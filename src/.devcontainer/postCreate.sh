#!/bin/bash
sudo rosdep update
sudo rosdep install --from-paths /home/ws --ignore-src -y
sudo chown -R $(whoami) /home/ws/