#!/bin/sh
mpc | grep volume | awk '{print $2}'
