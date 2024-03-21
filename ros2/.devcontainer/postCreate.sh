#!/bin/bash
mkdir -p src
sudo rosdep update
sudo rosdep install --from-paths /home/ws/src --ignore-src -y
sudo chown -R $(whoami) /home/ws/
colcon build --cmake-args -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_EXPORT_COMPILE_COMMANDS=ON