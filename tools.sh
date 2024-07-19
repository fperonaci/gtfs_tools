#!/bin/bash

source ~/Desktop/GTFS/tools/_core.sh
source ~/Desktop/GTFS/tools/_ids.sh

source ~/Desktop/GTFS/tools/headers.sh

get_agencies() {
    print_header_agencies $1
    _get_agencies $@
    }

get_calendars() {
    print_header_calendars $1
    _get_calendars $@
    }

get_calendar_dates() {
    print_header_calendar_dates $1
    _get_calendar_dates $@
    }

get_routes() {
    print_header_routes $1
    _get_routes $@
    }

get_shapes() {
    print_header_shapes $1
    _get_shapes $@
    }

get_stops() {
    print_header_stops $1
    _get_stops $@
    }

get_stop_times() {
    print_header_stop_times $1
    _get_stop_times $@
    }

get_trips() {
    print_header_trips $1
    _get_trips $@
    }
