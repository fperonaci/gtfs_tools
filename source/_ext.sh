#!/bin/bash

add_validity() {
    source ~/gtfs_tools/use_tripid.sh
    mapfile -t trips < <( cat )
    for trip in "${trips[@]}"; do
      id=$(echo ${trip} | cut -d, -f 3)
      stimes=($(_get_stop_times ${1} ${id} | sort -k5 -t, -n | cut -d, -f2))
      dates=($(_get_calendar_dates ${1} ${id} | sort -k2 -t, -n | cut -d, -f2))
      echo ${trip},${dates[0]},${stimes[0]},${stimes[-1]}
    done
    }

add_parent_station() {
    mapfile -t stops < <( cat )
    for stop in "${stops[@]}"; do
      parent_stop_id=$(echo ${stop} | cut -d, -f 11)
      grep ^${parent_stop_id}, ${1}/stops.txt
    done
    }
