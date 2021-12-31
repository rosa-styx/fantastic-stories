#!/usr/bin/env bash

# debug
#set -x

if [[ -z "${SITE_PASSWORD}" ]]; then
    # Read Password from stdin
    echo -n "Password: " 
    read -r -s site_password
    echo
else
    site_password="${SITE_PASSWORD}"
fi

# failfast
set -eEuo pipefail

script_dir="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)"
build_dir="${script_dir}/dist"

mkdir -p "${build_dir}"
cp -r img "${build_dir}"
npx staticrypt "${script_dir}/index.html" "${site_password}" -o "${build_dir}/index.html"
