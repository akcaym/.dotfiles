#!/usr/bin/env bash

i3-msg -t subscribe -m '["workspace", "output"]' | {
    i3-msg -t get_workspaces;
    while read; do i3-msg -t get_workspaces; done;
} | jq --unbuffered -c '[ .[] | select(.name != "9" or .focused) ]'


