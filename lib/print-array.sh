#!/usr/bin/env bash


##
# Prints number of characters
# @parameter {number}          $1
# @parameter {number | string} $2
# @example
#   padding=$(pad_string '3' '-')
#
#   printf '%sSomthing\n' "${padding}"
#   #> ---Somthing
# @author S0AndS0
# @license AGPL-3.0
pad_string() {
    local _limit="${1}"
    local _character="${2:- }"
    local _result=''

    if (( _limit )); then
        local i
        for i in $(seq 0 "${_limit}"); do
            _result+="${_character}"
        done
    fi

    printf '%s' "${_result}"
}


##
# Prints array name and content, with optional quotes sorounding elements
# @parameter {ArrayReferance} $1
# @parameter {number}         $2
# @example
#   list=( --flag --stringy 'words with spaces' )
#
#   print_array 'list' 0
#   #> ${list[*]} -> ( --flag --stringy 'words with spaces' )
# @author S0AndS0
# @license AGPL-3.0
print_array() {
    local -n _array_referance="${1}"
    local _array_referance_name="${1}"
    local _padding="$(pad_string "${2:-2}")"
    local _array_contence=''
    local _array_value=''
    local i
    for i in "${!_array_referance[@]}"; do
        if [[ "${_array_referance[$i]}" =~ ([[:space:]]|\'|\") ]]; then
            _array_value="${_array_referance[${i}]@Q}"
        else
            _array_value="${_array_referance[${i}]}"
        fi

        if (("${#_array_contence}")); then
            _array_contence+=" ${_array_value}"
        else
            _array_contence+="${_array_value}"
        fi
    done

    printf '%s${%s[*]} -> ( %s )\n' "${_padding}" "${_array_referance_name}" "${_array_contence}"
}

