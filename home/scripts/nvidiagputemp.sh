#!/bin/sh
#command -v nvidia-smi && nvidia-smi | grep '[0-9][0-9]C' | awk '{print $3}' | sed 's/C//'

command -v nvidia-smi >/dev/null && nvidia-smi | grep '[0-9][0-9]C' | awk '{print $3}' | sed 's/C//'
