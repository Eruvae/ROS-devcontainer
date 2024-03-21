#!/bin/bash
if [ -d build_release ]; then
  jq -s 'map(.[])' build_release/**/compile_commands.json > build_release/compile_commands.json
fi
if [ -d build_debug ]; then
  jq -s 'map(.[])' build_debug/**/compile_commands.json > build_debug/compile_commands.json
fi