#!/bin/bash

#----------------------------------------------------------------------------#

print_one_trip() {

  mod=trip

  source ~/Desktop/GTFS/tools/tools_common.sh

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

#----------------------------------------------------------------------------#

print_one_route() {

  mod=route

  source ~/Desktop/GTFS/tools/tools_common.sh

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

#----------------------------------------------------------------------------#
