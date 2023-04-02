#!/bin/bash
#{ ls ; date ; pwd ; }
command -v nginx && { echo "nginx is installed" ; nginx -version ; }