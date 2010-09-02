#!/usr/bin/env sh
security -q find-generic-password -gs $1 2>&1 | grep password | sed -e "s/password: \"//" -e "s/\"//"
