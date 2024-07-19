#!/bin/bash

source ~/gtfs_tools/common.sh

_get_route_ids() {
    _use_trip_get_route_ids $@
    }

_get_trip_ids() {
    _use_trip_get_trip_ids $@
    }
