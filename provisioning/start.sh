#!/bin/sh -e

if [ "$CONTAINER_TEST" = true ]; then
    ansible-playbook run.yml --tags "deploy" && \
    ansible-playbook run.yml --tags "test"
else
    ansible-playbook run.yml --tags "deploy" && \
    supervisord -n -c /etc/supervisord.conf
fi
