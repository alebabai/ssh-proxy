#!/bin/bash

function open_ssh_tunnel {
    local timestamp=`date +%s`

    local tunnel_host=${SSH_TUNNEL_HOST:-"serveo.net"}
    local tunnel_prefix=${SSH_TUNNEL_PREFIX:-$timestamp}
    local tunnel_port=${SSH_TUNNEL_PORT:-"443"}
    local tunnel_bindings=()
    local tunnel_urls=()

    for address in ${ADDRESS[@]}
    do
        local remote_hostname=$(echo $address | cut -d ':' -f 1)
        local tunnel_address=$tunnel_prefix-$remote_hostname:$tunnel_port
        tunnel_bindings+=("$tunnel_address:$address")
        tunnel_urls+=("https://$tunnel_prefix-$remote_hostname.$tunnel_host")
    done

    if [ -z "$tunnel_bindings" ]; then
        exit 1
    else
        local output_file=${OUTPUT_FILE:-"/tmp/ssh-proxy/output.txt"}
        printf "%s\n" ${tunnel_urls[@]} > $output_file
        
        local cmd="ssh -T -o ExitOnForwardFailure=yes -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $SSH_ARGS $(printf " -R %s" ${tunnel_bindings[@]}) $tunnel_host"
        echo $cmd
        exec $cmd
    fi
}

open_ssh_tunnel
