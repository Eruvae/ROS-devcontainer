#!/bin/bash
catkin profile set debug
catkin build
./merge_compile_commands.sh