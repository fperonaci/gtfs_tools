#!/bin/bash

source ~/Desktop/GTFS/tools/core.sh
source ~/Desktop/GTFS/tools/headers.sh
source ~/Desktop/GTFS/tools/ids.sh
source ~/Desktop/GTFS/tools/tools.sh

get_route_ids() {
    echo $2
    }

_get_trips() {
    grep ^${2}, ${1}/trips.txt | split -n r/1/${3}
    }
