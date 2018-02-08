#!/bin/bash

build_argument() {
  local value
    value=$(eval echo -n '$'$1)

    if [[ -n "${value/[ ]*\n/}" ]];then
        echo "--build-arg $1=\"$value\" "
    fi
}

args=()
for arg in PROJECT USER DESCRIPTION; do
    args+=$(build_argument $arg )
done

echo "${args[@]}"
