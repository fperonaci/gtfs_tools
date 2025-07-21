#!/bin/bash

print_many() {
  mapfile -t many < <( cat )
  for m in ${many[@]}; do
    print_one ${1} ${m}
  done;
  }

print_one() {
  mkdir -p ${2}
  get_agencies $@ | tee ${2}/agency.txt
  get_calendars $@ | tee ${2}/calendar.txt
  get_calendar_dates $@ | tee ${2}/calendar_dates.txt
  get_routes $@ | tee ${2}/routes.txt
  get_shapes $@ | tee ${2}/shapes.txt
  get_stops $@ | tee ${2}/stops.txt
  get_stop_times $@ | tee ${2}/stop_times.txt
  get_trips $@ | tee ${2}/trips.txt
  }

put_together() {
  mapfile -t folders < <( cat )
  mkdir -p ${2}
  _get_header_agencies ${1} > ${2}/agency.txt
  _get_header_calendars ${1} > ${2}/calendar.txt
  _get_header_calendar_dates ${1} > ${2}/calendar_dates.txt
  _get_header_routes ${1} > ${2}/routes.txt
  _get_header_shapes ${1} > ${2}/shapes.txt
  _get_header_stops ${1} > ${2}/stops.txt
  _get_header_stop_times ${1} > ${2}/stop_times.txt
  _get_header_trips ${1} > ${2}/trips.txt
  for d in ${folders[@]}; do
    echo ${d}
    tail -n+2 ${d}/agency.txt >> ${2}/agency.txt
    tail -n+2 ${d}/calendar.txt >> ${2}/calendar.txt
    tail -n+2 ${d}/calendar_dates.txt >> ${2}/calendar_dates.txt
    tail -n+2 ${d}/routes.txt >> ${2}/routes.txt
    tail -n+2 ${d}/shapes.txt >> ${2}/shapes.txt
    tail -n+2 ${d}/stops.txt >> ${2}/stops.txt
    tail -n+2 ${d}/stop_times.txt >> ${2}/stop_times.txt
    tail -n+2 ${d}/trips.txt >> ${2}/trips.txt
  done
  awk -i inplace '!seen[$0]++' ${2}/agency.txt
  awk -i inplace '!seen[$0]++' ${2}/calendar.txt
  awk -i inplace '!seen[$0]++' ${2}/calendar_dates.txt
  awk -i inplace '!seen[$0]++' ${2}/routes.txt
  awk -i inplace '!seen[$0]++' ${2}/shapes.txt
  awk -i inplace '!seen[$0]++' ${2}/stops.txt
  awk -i inplace '!seen[$0]++' ${2}/stop_times.txt
  awk -i inplace '!seen[$0]++' ${2}/trips.txt
  }
