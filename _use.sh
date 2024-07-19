#!/bin/bash

_use_route_get_route_ids() {
    echo $2
    }

_use_route_get_trips() {
    SKIP="${3:-1}"
    grep ^${2}, ${1}/trips.txt | split -n r/1/${SKIP}
    }

_use_trip_get_route_ids() {
    get_trips $@ | tail -n+2 | cut -d, -f1 | awk '!seen[$0]++'
    }

_use_trip_get_trip_ids() {
    echo $2
    }

_use_service_get_route_ids() {
    get_trips $@ | tail -n+2 | cut -d, -f1 | awk '!seen[$0]++'
    }

_use_service_get_service_ids() {
    echo $2
    }

_use_service_get_trips() {
    awk -F, -vsearch="${2}" '$2 == search' ${1}/trips.txt
    }
