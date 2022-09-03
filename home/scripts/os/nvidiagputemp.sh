#!/bin/sh
command -v nvidia-smi >/dev/null && nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader
