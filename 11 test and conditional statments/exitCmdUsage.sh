#!/bin/bash

command -v nginx || exit 1
nginx -version