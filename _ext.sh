#!/bin/bash

get_trips_validity() {
    mapfile -t trips < <( _get_trips ${@} )
    source ~/gtfs_tools/use_tripid.sh
    for trip in "${trips[@]}"; do
      id=$(echo ${trip} | cut -d, -f 3)
      stimes=($(_get_stop_times ${1} ${id} | sort -k5 -t, -n | cut -d, -f2))
      dates=($(_get_calendar_dates ${1} ${id} | sort -k2 -t, -n | cut -d, -f2))
      echo ${trip},${dates[0]},${stimes[0]},${stimes[-1]}
    done
    }
