#!/usr/bin/env bash

# debug
#set -x

# failfast
set -eEuo pipefail

script_dir="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)"
build_dir="${script_dir}/dist"

# Read Password
echo -n "Password: " 
read -r -s site_password
echo

mkdir -p "${build_dir}"
cp -r img "${build_dir}"
npx staticrypt "${script_dir}/index.html" "${site_password}" -o "${build_dir}/index.html"
