#!/bin/bash
jq -s 'map(.[])' build_release/**/compile_commands.json > build_release/compile_commands.json
jq -s 'map(.[])' build_debug/**/compile_commands.json > build_debug/compile_commands.json
