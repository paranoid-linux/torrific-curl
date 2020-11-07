#!/usr/bin/env bash


##
# Submit a POST request over Tor
# @parameter {string} $1 - Download path
tests__features__get_request() {
    local _download_path="${1:-/tmp/httpbin.org__get.json}"
    local _url='https://httpbin.org/get'
    local _grep_string='HTTP/2 200'

    local -a _curl_options=(
        --include
        -H 'Accept: application/json'
        -H 'Content-Type: application/json'
        -X GET
        --url "${_url}"
        -o "${_download_path}"
    )

    [[ -f "${_download_path}" ]] && {
        printf >&2 '%s error -> file already exists: %s\n' "${FUNCNAME[0]}" "${_download_path}"
        return 1
    }

    torrific-curl "${_curl_options[@]}"

    [[ -f "${_download_path}" ]] || {
        printf >&2 '%s error -> failed to download: %s\n' "${FUNCNAME[0]}" "${_download_path}"
        return 1
    }

    grep -q "${_grep_string}" "${_download_path}" || {
        printf >&2 '%s error -> failed to detect that Curl used Tor correctly\n' "${FUNCNAME[0]}"
        return 1
    }
}


