#!/usr/bin/env bash

set -u

hash aws || ( echo "AWS cli missing" >&2; exit 1; )

die () { echo "$1" >&2; exit 1; }
