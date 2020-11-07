#!/usr/bin/env bash


##
# Submit a POST request over Tor
# @parameter {string} $1 - Download path
tests__features__post_request_data() {
    printf '# Started -> %s\n' "${FUNCNAME[0]}"

    local _download_path="${1:-/tmp/httpbin.org__post.json}"
    local _url='https://httpbin.org/post'
    local _data='key=value'
    local _grep_string='"key": "value"'

    [[ -f "${_download_path}" ]] && {
        printf >&2 '%s error -> file already exists: %s\n' "${FUNCNAME[0]}" "${_download_path}"
        return 1
    }

    _curl_options=(
        --silent
        --data "${_data}"
        --url "${_url}"
        -o "${_download_path}"
    )

    torrific-curl "${_curl_options[@]}"

    [[ -f "${_download_path}" ]] || {
        printf >&2 '%s error -> failed to download: %s\n' "${FUNCNAME[0]}" "${_download_path}"
        return 1
    }

    grep -q "${_grep_string}" "${_download_path}" || {
        printf >&2 '%s error -> failed to detect that Curl used Tor correctly\n' "${FUNCNAME[0]}"
        return 1
    }

    printf '# Finished -> %s\n' "${FUNCNAME[0]}"
}

