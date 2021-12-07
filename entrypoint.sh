#!/bin/sh -l

if [ -z "${artifact-name}" ] || [ -z "${device-type}" ] || [ -z "${type}" ] || [ -z "${artifact-content}" ] || [ -z "${output-path}" ]; then
  echo "Please provide all required variables"
  exit 1;
fi

echo "Done"