#!/bin/sh
# Script invoked by ignition-dracut generator to detect whether this is a
# live system without a root device.  We can't test for /run/ostree-live
# because it may not have been created yet.
get_karg() {
    local arg="$1"
    local cmdline=( $(</proc/cmdline) )
    local i
    local k
    local v
    for i in "${cmdline[@]}"; do
        k=${i%%=*};
        if [ "$k" != "$arg" ]; then
            continue
        fi
        echo ${i##*=}
    done
}

get_karg coreos.live-root
