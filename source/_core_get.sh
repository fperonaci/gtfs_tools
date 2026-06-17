#!/bin/bash

_get_agencies() {
    for id in $(_get_agency_ids $@)
      do grep ^${id}, ${1}/agency.txt
    done
    }

_get_calendars() {
    for id in $(_get_service_ids $@)
      do grep ^${id}, ${1}/calendar.txt
    done
    }

_get_calendar_dates() {
    for id in $(_get_service_ids $@)
      do grep ^${id}, ${1}/calendar_dates.txt
    done
    }

_get_routes() {
    for id in $(_get_route_ids $@)
      do grep ^${id}, ${1}/routes.txt
    done
    }

_get_shapes() {
    for id in $(_get_shape_ids $@)
      do grep ^${id}, ${1}/shapes.txt
    done
    }

_get_stops() {
    for id in $(_get_stop_ids $@)
      do grep ^${id}, ${1}/stops.txt
    done
    }

_get_stop_times() {
    for id in $(_get_trip_ids $@)
      do grep ^${id}, ${1}/stop_times.txt
    done
    }

_get_trips() {
    for id in $(_get_trip_ids $@)
      do awk -F, -vsearch="${id}" '$3 == search' ${1}/trips.txt
    done
    }
