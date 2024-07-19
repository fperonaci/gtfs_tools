#!/bin/bash

source ~/gtfs_tools/common.sh

_get_route_ids() {
    _use_service_get_route_ids $@
    }

_get_service_ids() {
    _use_service_get_service_ids $@
    }

_get_trips() {
    _use_service_get_trips $@
    }
