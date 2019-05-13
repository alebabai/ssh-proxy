#!/bin/bash

function open_ssh_tunnel {
    local timestamp=`date +%s`

    local tunnel_host=${SSH_TUNNEL_HOST:-serveo.net}
    local tunnel_port=${SSH_TUNNEL_PORT:-443}
    local tunnel_bindings=""

    for address in ${ADDRESS[@]}
    do
        local tunnel_prefix=$(echo $address | cut -d ':' -f 1)-$timestamp
        tunnel_bindings+=" -R $tunnel_prefix:$tunnel_port:$address"
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
