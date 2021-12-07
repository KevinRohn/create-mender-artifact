#!/bin/sh -l

echo ${INPUT_DEVICE-TYPE}

#if [ -z "${INPUT_artifact-name}" ] || [ -z "${device-type}" ] || [ -z "${type}" ] || [ -z "${artifact-content}" ] || [ -z "${output-path}" ]; then
#  echo "Please provide all required variables"
#  exit 1;
#fi
#
#if [ -d "${output-path}" ]; then
#  true
#else
#  echo "Error: ${output-path} does not exist"
#  exit 1
#fi
#
#if 