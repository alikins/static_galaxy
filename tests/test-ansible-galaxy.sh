#!/bin/bash

ANSIBLE_CONFIG=${TEST_ANSIBLE_CONFIG:-../conf/ansible.cfg}

TEMPDIR=$(mktemp -d -t --suffix _test_static_galaxy test_galaxy_static_tmp.XXXXXXXXXXXXX) || {
    echo "$PROGNAME: unable to create temporary directory" >&2
    echo "Aborting..." >&2
    exit 1
}
trap 'rm -rf "$TEMPDIR"' EXIT


ANSIBLE_CONFIG="${ANSIBLE_CONFIG}" ANSIBLE_COLLECTIONS_PATHS="${TEMPDIR}" ansible-galaxy collection install -vvv --requirements-file requirements.yml
