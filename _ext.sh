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

get_trips_validity_() {
    f=${1}
    shift
    trips=("${@}")
    source ~/gtfs_tools/use_tripid.sh
    for trip in "${trips[@]}"; do
      id=$(echo "${trip}" | cut -d, -f 3)
      stimes=($(_get_stop_times ${f} ${id} | sort -k5 -t, -n | cut -d, -f2))
      dates=($(_get_calendar_dates ${f} ${id} | sort -k2 -t, -n | cut -d, -f2))
      echo "${trip}","${dates[0]}","${stimes[0]}","${stimes[-1]}"
    done
    }

get_trips_validity__() {
    source ~/gtfs_tools/use_tripid.sh
    trip=$(cat)
    id=$(echo "${trip}" | cut -d, -f 3)
    stimes=($(_get_stop_times ${1} ${id} | sort -k5 -t, -n | cut -d, -f2))
    dates=($(_get_calendar_dates ${1} ${id} | sort -k2 -t, -n | cut -d, -f2))
    echo "${trip}","${dates[0]}","${stimes[0]}","${stimes[-1]}"
    }

get_trips_validity___() {
    source ~/gtfs_tools/use_tripid.sh
    mapfile -t trips < <( cat )
    for trip in "${trips[@]}"; do
      id=$(echo ${trip} | cut -d, -f 3)
      stimes=($(_get_stop_times ${1} ${id} | sort -k5 -t, -n | cut -d, -f2))
      dates=($(_get_calendar_dates ${1} ${id} | sort -k2 -t, -n | cut -d, -f2))
      echo ${trip},${dates[0]},${stimes[0]},${stimes[-1]}
    done
    }
