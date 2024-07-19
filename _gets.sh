#!/bin/bash

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
