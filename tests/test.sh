#!/usr/bin/env bash

set -e

get_script_dir () {
     SOURCE="${BASH_SOURCE[0]}"

     while [ -h "$SOURCE" ]; do
          DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
          SOURCE="$( readlink "$SOURCE" )"
          [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
     done
     cd -P "$( dirname "$SOURCE" )"
     pwd
}

cd "$(get_script_dir)"

if [[ $NO_SUDO || -n "$CIRCLECI" ]]; then
  DOCKER_COMPOSE="docker-compose"
elif groups $USER | grep &>/dev/null '\bdocker\b'; then
  DOCKER_COMPOSE="docker-compose"
else
  DOCKER_COMPOSE="sudo docker-compose"
fi

$DOCKER_COMPOSE up -d --remove-orphans meta_db
$DOCKER_COMPOSE run wait_dbs

echo
echo "Test initial database migration"
$DOCKER_COMPOSE run meta_db_setup
$DOCKER_COMPOSE run meta_db_check

echo
echo "Test idempotence"
$DOCKER_COMPOSE run meta_db_setup
if [ $CIRCLECI ]; then
  $DOCKER_COMPOSE run meta_db_check_ci
else
  $DOCKER_COMPOSE run meta_db_check
fi

# Cleanup
echo
$DOCKER_COMPOSE stop
$DOCKER_COMPOSE rm -f > /dev/null 2> /dev/null
