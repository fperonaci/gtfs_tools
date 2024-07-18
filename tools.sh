#!/bin/bash

_get_agencies() {
    for id in $(get_agency_ids $@)
      do grep ^${id}, ${1}/agency.txt
    done
    }

_get_calendars() {
    for id in $(get_service_ids $@)
      do grep ^${id}, ${1}/calendar.txt
    done
    }

_get_calendar_dates() {
    for id in $(get_service_ids $@)
      do grep ^${id}, ${1}/calendar_dates.txt
    done
    }

_get_routes() {
    for id in $(get_route_ids $@)
      do grep ^${id}, ${1}/routes.txt
    done
    }

_get_shapes() {
    for id in $(get_shape_ids $@)
      do grep ^${id}, ${1}/shapes.txt
    done
    }

_get_stops() {
    for id in $(get_stop_ids $@)
      do grep ^${id}, ${1}/stops.txt
    done
    }

_get_stop_times() {
    for id in $(get_trip_ids $@)
      do grep ^${id}, ${1}/stop_times.txt
    done
    }

_get_trips() {
    for id in $(get_trip_ids $@)
      do awk -F, -vsearch="${id}" '$3 == search' ${1}/trips.txt
    done
    }

get_agency_ids() {
    _get_routes $@ | cut -d, -f2 | awk '!seen[$0]++'
    }

get_route_ids() {
    _get_routes $@ | cut -d, -f1 | awk '!seen[$0]++'
    }

get_shape_ids() {
    _get_trips $@ | cut -d, -f8 | awk '!seen[$0]++'
    }

get_service_ids() {
    _get_trips $@ | cut -d, -f2 | awk '!seen[$0]++'
    }

get_stop_ids() {
    _get_stop_times $@ | cut -d, -f4 | awk '!seen[$0]++'
    }

get_trip_ids() {
    _get_trips $@ | cut -d, -f3 | awk '!seen[$0]++'
    }

get_agencies() {
    head -n1 ${1}/agency.txt
    _get_agencies $@
    }

get_calendars() {
    head -n1 ${1}/calendar.txt
    _get_calendars $@
    }

get_calendar_dates() {
    head -n1 ${1}/calendar_dates.txt
    _get_calendar_dates $@
    }

get_routes() {
    head -n1 ${1}/routes.txt
    _get_routes $@
    }

get_shapes() {
    head -n1 ${1}/shapes.txt
    _get_shapes $@
    }

get_stops() {
    head -n1 ${1}/stops.txt
    _get_stops $@
    }

get_stop_times() {
    head -n1 ${1}/stop_times.txt
    _get_stop_times $@
    }

get_trips() {
    head -n1 ${1}/trips.txt
    _get_trips $@
    }
