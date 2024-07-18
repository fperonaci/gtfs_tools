#!/bin/bash

source ~/Desktop/GTFS/tools/tools.sh

get_route_ids() {
    get_trips $@ | tail -n+2 | cut -d, -f1 | awk '!seen[$0]++'
    }

get_trip_ids() {
    echo $2
    }
