#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ] || [ -z "$4" ] || [ -z "$5" ]; then
  echo "Please provide all required variables"
  exit 1;
else
  ARTIFACT_NAME=$1
  echo "Artifact name $ARTIFACT_NAME is set for mender-artifact creation."
  DEVICE_TYPE=$2
  echo "Device type $DEVICE_TYPE is set for mender-artifact creation."
  TYPE=$3
  echo "Mender module type $TYPE is set for mender-artifact creation."

  ARTIFACT_CONTENT=$4
  if [ -d "$ARTIFACT_CONTENT" ]; then
    echo "Artifact content $ARTIFACT_CONTENT path is set for mender-artifact creation."
    true
  else
    echo "Error: $ARTIFACT_CONTENT path does not exist."
    exit 1;
  fi

  OUTPUT_PATH=$5
  if [ -d "$OUTPUT_PATH" ]; then
    echo "Output path $OUTPUT_PATH is set for mender-artifact creation."
    true
  else
    echo "Error: $OUTPUT_PATH path does not exist."
    exit 1;
  fi
fi

if [ ! -z "$6" ]; then
  STATE_SCRIPTS=$6
  if [ -d "$STATE_SCRIPTS" ]; then
    echo "State scripts $STATE_SCRIPTS path is set for mender-artifact creation."
    true
  else
    echo "Error: $STATE_SCRIPTS path does not exist."
    exit 1;
  fi
fi

if [ ! -z "$7" ]; then
  SOFTWARE_NAME=$7
  echo "Software name $SOFTWARE_NAME is set for mender-artifact creation."
fi

if [ ! -z "$8" ]; then
  SOFTWARE_VERSION=$8
  echo "Software version $SOFTWARE_VERSION is set for mender-artifact creation."
fi

/bin/mender-artifact > file.txt
cat file.txt

#s/bin/mender-artifact write module-image \
#s  --artifact-name $(echo "$ARTIFACT_NAME") \
#s  --type $(echo "$TYPE") \
#s  --device-type $(echo "$DEVICE_TYPE") \
#s  --output-path $(echo "$OUTPUT_PATH") 
