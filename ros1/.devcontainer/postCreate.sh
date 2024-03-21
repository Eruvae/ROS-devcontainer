#!/bin/bash
sudo rosdep update
sudo rosdep install --from-paths /home/ws --ignore-src -y
sudo chown -R $(whoami) /home/ws/
catkin config --profile release -x _release --extend /opt/ros/noetic --cmake-args -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
catkin config --profile debug -x _debug --extend /opt/ros/noetic --cmake-args -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
catkin profile set release
catkin build
./merge_compile_commands.sh