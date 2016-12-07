#!/usr/bin/env bash

set -e

# capture anonymous metrics for reporting
curl https://mesosphere.com/wp-content/themes/mesosphere/library/images/assets/sdk/build-sh-start.png >/dev/null 2>&1

FRAMEWORK_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR=$FRAMEWORK_DIR/../..
BUILD_DIR=$ROOT_DIR/build/distributions
PUBLISH_STEP=${1-none}
${ROOT_DIR}/gradlew distZip -p ${ROOT_DIR}/sdk/executor
./build_framework.sh $PUBLISH_STEP elastic $FRAMEWORK_DIR $BUILD_DIR/executor.zip $BUILD_DIR/scheduler.zip


# capture anonymous metrics for reporting
curl https://mesosphere.com/wp-content/themes/mesosphere/library/images/assets/sdk/build-sh-finish.png >/dev/null 2>&1
