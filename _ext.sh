#!/bin/bash

get_start_end_time_validity() {
    #stop_times=($(grep ^${2}, ${1}/stop_times.txt))
    #stop_times=($(echo ${stop_times} | sort -k5 -t, -n | cut -d, -f2))
    stop_times=($(_get_stop_times $@ | sort -k5 -t, -n | cut -d, -f2))
    echo ${stop_times[0]} ${stop_times[-1]}
    }

get_first_calendar_date() {
    calendar_dates=($(_get_calendar_dates $@ | sort -k2 -t, -n | cut -d, -f2))
    echo ${calendar_dates[0]}
    }

get_both() {
    source ~/gtfs_tools/use_tripid.sh
    trip=$(_get_trips $@)
    stop_times=($(_get_stop_times $@ | sort -k5 -t, -n | cut -d, -f2))
    calendar_dates=($(_get_calendar_dates $@ | sort -k2 -t, -n | cut -d, -f2))
    echo ${trip},${calendar_dates[0]},${stop_times[0]},${stop_times[-1]}
    }

get_me_good() {
    _get_header_trips $@
    trip_ids=($(_get_trips $@ | cut -d, -f3))
    for id in ${trip_ids[@]}
      do get_both ${1} ${id}
    done
    }
