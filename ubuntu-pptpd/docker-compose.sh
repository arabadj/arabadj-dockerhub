#!/bin/sh

#========================================================================================================================

[ "$1" != "up" ] && [ "$1" != "down" ] && echo "Usage: $(basename $0) up|down " && exit 0

#========================================================================================================================

export COMPOSE_PROJECT_NAME="vpnp"
export PATH_SERVICE="$HOME/.local/opt/$COMPOSE_PROJECT_NAME"
export PATH_DOCKER="/usr/bin"
export PATH_COMPOSE="/usr/local/bin"

#========================================================================================================================

export service_name="$COMPOSE_PROJECT_NAME"
export service_dir="$PATH_SERVICE"

#------------------------------------------------------------------------------------------------------------------------

export ansible_user="$USER"
export password_vpn="$(aws ssm get-parameters --region eu-central-1 --name password_vpn \
    --query Parameters[*].{Value:Value} --output text)"

#========================================================================================================================

mkdir -p "$PATH_SERVICE"
j2 ./templates/docker-compose.yml.j2 -o $PATH_SERVICE/docker-compose.yml

#------------------------------------------------------------------------------------------------------------------------

mkdir -p "$PATH_SERVICE/etc/ppp/"
j2 ./templates/chap-secrets.j2 -o $PATH_SERVICE/etc/ppp/chap-secrets
chmod 600 $PATH_SERVICE/etc/ppp/chap-secrets

#========================================================================================================================

cd $PATH_SERVICE

[ "$1" == "up" ] && $PATH_COMPOSE/docker-compose up -d --remove-orphans
[ "$1" == "down" ] && $PATH_COMPOSE/docker-compose down --remove-orphans
[ "$1" == "down" ] && [ "$2" == "clean" ] && rm -rf $PATH_SERVICE

#========================================================================================================================
