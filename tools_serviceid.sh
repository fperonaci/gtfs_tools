#!/bin/bash

source ~/Desktop/GTFS/tools/tools.sh

_get_service_ids() {
    echo $2
    }

_get_trips() {
    awk -F, -vsearch="${2}" '$2 == search' ${1}/trips.txt
    }

_get_route_ids() {
    get_trips $@ | tail -n+2 | cut -d, -f1 | awk '!seen[$0]++'
    }
