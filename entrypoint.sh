#!/bin/sh

set -e

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

PACKAGES=
for PACKAGE in $(ls $ARTIFACT_CONTENT/*.deb); do
  PACKAGES="${PACKAGES} $PACKAGE"
done 

echo "$PACKAGES" | sed -e 's/ / -f /g'

check_dependency() {
  if ! which "$1" > /dev/null; then
    echo "The $1 utility is not found but required to generate Artifacts." 1>&2
    return 1
  fi
}

if ! check_dependency mender-artifact; then
  echo "Please follow the instructions here to install mender-artifact and then try again: https://docs.mender.io/downloads#mender-artifact" 1>&2
  exit 1
  else 
  echo "Found mender-artifact installation"
  fi 
fi

ls -lah $ARTIFACT_CONTENT/
echo "START"
#mender-artifact write module-image -T "${TYPE}" -n "${ARTIFACT_NAME}" -t "${DEVICE_TYPE}" -o "${OUTPUT_PATH}" -f $(echo "$PACKAGES" | sed -e 's/ / -f /g')
mender-artifact write module-image -T "deb" -n "test" -t "raspberrypi3" -o "myupdate.mender" -f "content/nano_3.2-3_armhf.deb" > out.file
echo "END"