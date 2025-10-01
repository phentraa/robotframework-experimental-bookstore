#!/bin/bash

# Checking argument

TEST_TYPE="$1"

if [[ "$TEST_TYPE" != "web" && "$TEST_TYPE" != "api" ]]; then
  echo "Usage: $0 [web|api]"
  exit 1
fi

echo "Running with test type: $TEST_TYPE"

# Checking dependencies
if ! command -v docker >/dev/null 2>&1
then
    echo "Docker could not be found. Terminating."
    exit 1
fi

if [[ ! -e ./src/.env ]]; then
    echo "ENV file is missing from src/. Terminating."
    exit 1
fi

# Preparations

IMAGE_TAG="rf-bookstore"
TEST_RESULTS_DIR_LOCAL="results"
TEST_RESULTS_DIR_CONTAINER="/app/results"

echo "Checking image..."

if [[ -z $(docker images | grep $IMAGE_TAG) ]]; then
    echo "Image $IMAGE_TAG is not available yet. Start building..."
    docker build --no-cache -t $IMAGE_TAG .
else
    echo "Image $IMAGE_TAG is already available."
fi

# Test execution

echo "Robot is executing $TEST_TYPE tests now..."
docker run -it --env-file ./src/.env $IMAGE_TAG bash -c "robot --outputdir $TEST_RESULTS_DIR_CONTAINER /app/$TEST_TYPE/tests"

docker cp $(docker ps -alq):/app/results/. ./results/
docker rm $(docker ps -alq)

echo "Tests have been executed"
echo "Results stored in $PWD/results/ directory"

