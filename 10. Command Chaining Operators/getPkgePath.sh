#!/bin/bash
pkgName=${1}
command -v ${pkgName} 1>/dev/null 2>/dev/null && echo "The path of ${pkgName} is $(command -v ${pkgName} )" || echo "Package ${pkgName} is Not Found"