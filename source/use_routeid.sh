#!/bin/bash

source ~/gtfs_tools/source/common.sh

_get_route_ids() {
    echo $2
    }

_get_trips() {
    SKIP="${3:-1}"
    grep ^${2}, ${1}/trips.txt | split -n r/1/${SKIP}
    }
