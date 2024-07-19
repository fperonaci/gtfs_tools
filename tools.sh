#!/bin/bash

source ~/gtfs_tools/_core.sh
source ~/gtfs_tools/_ids.sh
source ~/gtfs_tools/_headers.sh

get_agencies() {
    _get_header_agencies $1
    _get_agencies $@
    }

get_calendars() {
    _get_header_calendars $1
    _get_calendars $@
    }

get_calendar_dates() {
    _get_header_calendar_dates $1
    _get_calendar_dates $@
    }

get_routes() {
    _get_header_routes $1
    _get_routes $@
    }

get_shapes() {
    _get_header_shapes $1
    _get_shapes $@
    }

get_stops() {
    _get_header_stops $1
    _get_stops $@
    }

get_stop_times() {
    _get_header_stop_times $1
    _get_stop_times $@
    }

get_trips() {
    _get_header_trips $1
    _get_trips $@
    }

print_one() {
  mkdir -p ${2}
  get_agencies $@ > ${2}/agency.txt
  get_calendars $@ > ${2}/calendar.txt
  get_calendar_dates $@ > ${2}/calendar_dates.txt
  get_routes $@ > ${2}/routes.txt
  get_shapes $@ > ${2}/shapes.txt
  get_stops $@ > ${2}/stops.txt
  get_stop_times $@ > ${2}/stop_times.txt
  get_trips $@ > ${2}/trips.txt
  }
