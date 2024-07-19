#!/bin/bash

source ~/gtfs_tools/common.sh

_get_route_ids() {
    _use_route_get_route_ids $@
    }

_get_trips() {
    _use_route_get_trips $@
    }
