#!/bin/bash

get_trips_by_service_id() {
    for id in $(get_trip_ids $@)
      do awk -F, -vsearch="${id}" '$3 == search' ${1}/trips.txt
    done
    }
