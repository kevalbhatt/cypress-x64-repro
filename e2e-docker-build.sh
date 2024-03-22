#!/bin/bash -i
# -i for interactive mode

# Expand aliases defined in the shell ~/.bashrc
shopt -s expand_aliases

export $(cat .env | perl -lne 'print unless /^#/' | xargs)

docker build --no-cache --build-arg CYPRESS_BASE_URL="$CYPRESS_BASE_URL" \
--build-arg CYPRESS_UI_LINK="$CYPRESS_UI_LINK" \
--build-arg CYPRESS_USERNAME="$CYPRESS_USERNAME" \
--build-arg CYPRESS_PASSWORD="$CYPRESS_PASSWORD" \
--build-arg CYPRESS_VIDEO="$CYPRESS_VIDEO" \
--build-arg CYPRESS_TENANCY_NAME="$CYPRESS_TENANCY_NAME" \
--build-arg CYPRESS_EXCLUDE_SPEC_PATTERN="$CYPRESS_EXCLUDE_SPEC_PATTERN" \
--build-arg CYPRESS_COMPARTMENT_NAME="$CYPRESS_COMPARTMENT_NAME" \
--build-arg CYPRESS_BUCKET_NAME="$CYPRESS_BUCKET_NAME" \
--build-arg CYPRESS_FOLDER_NAME="$CYPRESS_FOLDER_NAME" \
--pull=true -t="ui-canary-repro-arm" -f "Dockerfile.e2e-ol8.arm" .


docker build --no-cache --build-arg CYPRESS_BASE_URL="$CYPRESS_BASE_URL" \
--build-arg CYPRESS_UI_LINK="$CYPRESS_UI_LINK" \
--build-arg CYPRESS_USERNAME="$CYPRESS_USERNAME" \
--build-arg CYPRESS_PASSWORD="$CYPRESS_PASSWORD" \
--build-arg CYPRESS_VIDEO="$CYPRESS_VIDEO" \
--build-arg CYPRESS_TENANCY_NAME="$CYPRESS_TENANCY_NAME" \
--build-arg CYPRESS_EXCLUDE_SPEC_PATTERN="$CYPRESS_EXCLUDE_SPEC_PATTERN" \
--build-arg CYPRESS_COMPARTMENT_NAME="$CYPRESS_COMPARTMENT_NAME" \
--build-arg CYPRESS_BUCKET_NAME="$CYPRESS_BUCKET_NAME" \
--build-arg CYPRESS_FOLDER_NAME="$CYPRESS_FOLDER_NAME" \
--pull=true -t="ui-canary-repro-x64" -f "Dockerfile.e2e-ol8.x64" .