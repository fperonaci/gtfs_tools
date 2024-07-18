#!/bin/bash

#----------------------------------------------------------------------------#

get_route_ids() {
    echo $2
    }

get_trips() {
    head -n1 ${1}/trips.txt
    grep ^${2}, ${1}/trips.txt | split -n r/1/${3}
    }

#----------------------------------------------------------------------------#
