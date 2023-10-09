#!/bin/bash  -xu

script_dir=$(dirname  "$0")
vagrant_dir="${script_dir}/../vagrant"
pushd  "${vagrant_dir}"

time  vagrant  destroy -f
time  vagrant  up ; echo 0

popd
