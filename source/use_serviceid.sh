#!/bin/bash

source ~/gtfs_tools/source/common.sh

_get_route_ids() {
    get_trips $@ | tail -n+2 | cut -d, -f1 | awk '!seen[$0]++'
    }

_get_service_ids() {
    echo $2
    }

_get_trips() {
    awk -F, -vsearch="${2}" '$2 == search' ${1}/trips.txt
    }
