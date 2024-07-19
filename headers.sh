#!/bin/bash

print_header_agencies() {
    head -n1 ${1}/agency.txt
    }

print_header_calendars() {
    head -n1 ${1}/calendar.txt
    }

print_header_calendar_dates() {
    head -n1 ${1}/calendar_dates.txt
    }

print_header_routes() {
    head -n1 ${1}/routes.txt
    }

print_header_shapes() {
    head -n1 ${1}/shapes.txt
    }

print_header_stops() {
    head -n1 ${1}/stops.txt
    }

print_header_stop_times() {
    head -n1 ${1}/stop_times.txt
    }

print_header_trips() {
    head -n1 ${1}/trips.txt
    }
