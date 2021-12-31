#!/bin/sh
nvidia-smi | grep '[0-9][0-9]C' | awk '{print $3}' | sed 's/C//'
