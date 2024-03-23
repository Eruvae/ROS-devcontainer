#!/bin/bash
mkdir -p src
sudo rosdep update
sudo rosdep install --from-paths /home/ws/src --ignore-src -y
sudo chown -R $(whoami) /home/ws/
./initialize_workspace.sh
./compile_release.sh
./merge_compile_commands.sh