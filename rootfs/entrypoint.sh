#!/bin/bash

function open_ssh_tunnel {
    local timestamp=`date +%s`

    local tunnel_host=${SSH_TUNNEL_HOST:-serveo.net}
    local tunnel_prefix=${SSH_TUNNEL_PREFIX:-$timestamp}
    local tunnel_port=${SSH_TUNNEL_PORT:-443}
    local tunnel_bindings=""

    for address in ${ADDRESS[@]}
    do
        local remote_hostname=$(echo $address | cut -d ':' -f 1)
        local tunnel_address=$tunnel_prefix-$remote_hostname:$tunnel_port
        tunnel_bindings+=" -R $tunnel_address:$address"
    done

    if [ -z "$tunnel_bindings" ]; then
        exit 1
    else
        local cmd="ssh -T -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $SSH_ARGS $tunnel_bindings $tunnel_host"
        echo $cmd
        exec $cmd
    fi
}

open_ssh_tunnel
