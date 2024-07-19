#!/bin/bash

get_agency_ids() {
    _get_routes $@ | cut -d, -f2 | awk '!seen[$0]++'
    }

get_route_ids() {
    _get_routes $@ | cut -d, -f1 | awk '!seen[$0]++'
    }

get_shape_ids() {
    _get_trips $@ | cut -d, -f8 | awk '!seen[$0]++'
    }

get_service_ids() {
    _get_trips $@ | cut -d, -f2 | awk '!seen[$0]++'
    }

get_stop_ids() {
    _get_stop_times $@ | cut -d, -f4 | awk '!seen[$0]++'
    }

get_trip_ids() {
    _get_trips $@ | cut -d, -f3 | awk '!seen[$0]++'
    }
