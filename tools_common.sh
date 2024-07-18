#!/bin/bash

#----------------------------------------------------------------------------#

get_agencies() {
    head -n1 ${1}/agency.txt
    for id in $(get_agency_ids $@)
      do grep ^${id}, ${1}/agency.txt
    done
    }

get_calendars() {
    head -n1 ${1}/calendar.txt
    for id in $(get_service_ids $@)
      do grep ^${id}, ${1}/calendar.txt
    done
    }

get_calendar_dates() {
    head -n1 ${1}/calendar_dates.txt
    for id in $(get_service_ids $@)
      do grep ^${id}, ${1}/calendar_dates.txt
    done
    }

get_routes() {
    head -n1 ${1}/routes.txt
    for id in $(get_route_ids $@)
      do grep ^${id}, ${1}/routes.txt
    done
    }

get_shapes() {
    head -n1 ${1}/shapes.txt
    for id in $(get_shape_ids $@)
      do grep ^${id}, ${1}/shapes.txt
    done
    }

get_stops() {
    head -n1 ${1}/stops.txt
    for id in $(get_stop_ids $@)
      do grep ^${id}, ${1}/stops.txt
    done
    }

get_stop_times() {
    head -n1 ${1}/stop_times.txt
    for id in $(get_trip_ids $@)
      do grep ^${id}, ${1}/stop_times.txt
    done
    }

get_trips() {
    head -n1 ${1}/trips.txt
    for id in $(get_trip_ids $@)
      do awk -F, -vsearch="${id}" '$3 == search' ${1}/trips.txt
    done
    }

#----------------------------------------------------------------------------#

get_agency_ids() {
    get_routes $@ | tail -n+2 | cut -d, -f2 | awk '!seen[$0]++'
    }

get_route_ids() {
    get_routes $@ | tail -n+2 | cut -d, -f1 | awk '!seen[$0]++'
    }

get_shape_ids() {
    get_trips $@ | tail -n+2 | cut -d, -f8 | awk '!seen[$0]++'
    }

get_service_ids() {
    get_trips $@ | tail -n+2 | cut -d, -f2 | awk '!seen[$0]++'
    }

get_stop_ids() {
    get_stop_times $@ | tail -n+2 | cut -d, -f4 | awk '!seen[$0]++'
    }

get_trip_ids() {
    get_trips $@ | tail -n+2 | cut -d, -f3 | awk '!seen[$0]++'
    }

#----------------------------------------------------------------------------#

if [[ ${mod} == "route" ]]; then
  source tools_routes.sh
elif [[ ${mod} == "trip" ]]; then
  source tools_trips.sh
else
  echo Please set mod to either "route" or "trip"
fi

#----------------------------------------------------------------------------#
