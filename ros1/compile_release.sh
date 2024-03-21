#!/bin/bash
catkin profile set release
catkin build
./merge_compile_commands.sh