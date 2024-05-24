#!/bin/sh

if ! grep "HEALTHY" /healthcheck/status; then
	echo "HEALTHY check failed"
	exit 1
fi