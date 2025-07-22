#!/bin/bash

_get_header_agencies() {
    head -n1 ${1}/agency.txt
    }

_get_header_calendars() {
    head -n1 ${1}/calendar.txt
    }

_get_header_calendar_dates() {
    head -n1 ${1}/calendar_dates.txt
    }

_get_header_routes() {
    head -n1 ${1}/routes.txt
    }

_get_header_shapes() {
    head -n1 ${1}/shapes.txt
    }

_get_header_stops() {
    head -n1 ${1}/stops.txt
    }

_get_header_stop_times() {
    head -n1 ${1}/stop_times.txt
    }

_get_header_trips() {
    head -n1 ${1}/trips.txt
    }
