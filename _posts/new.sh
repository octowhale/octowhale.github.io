#!/bin/bash
#


cd $(dirname $0)

function __new(){
    local title=${1}
    local year=$(date +%Y)
    local datef=$(date +%F)

    mkdir -p ${year}
    cp template.md ${year}/${datef}-${title}.md
}


[ -z $1 ] || __new $1


