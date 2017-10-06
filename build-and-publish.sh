#! /bin/bash

# Switch to script path.
cd "$( dirname "${BASH_SOURCE[0]}" )"

echo "Logging in to docker hub..."
docker login -u $DOCKERHUB_USER -p "$DOCKERHUB_PW" || exit 1

###############
### Nightly ###
###############

# Build.
echo "Building nightly image..."
docker build -f ./dockerfiles/Nightly -t ready2order/rust-ci:nightly . || exit 1

# Use docker run to retrieve the current nightly version.
VERSION=`docker run ready2order/rust-ci:nightly rustc --version`
NIGHTLY=`echo $VERSION | grep -o -E '[0-9]{4}-[0-9]{2}-[0-9]{2}'`

echo "Tagging nightly-$NIGHTLY..."
docker tag ready2order/rust-ci:nightly ready2order/rust-ci:nightly-$NIGHTLY || exit 1

echo "Publish nightly..."
docker publish ready2order/rust-ci:nightly || exit 1

echo "Publish nightly-$NIGHTLY..."
docker publish ready2order/rust-ci:nightly-$NIGHTLY || exit 1

echo "Complete"
