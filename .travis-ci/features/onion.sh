#!/usr/bin/env bash


##
# Download index from Tor Onion home page
# @parameter {string} $1
tests__features__onion() {
    local _download_path="${1:-/tmp/expyuzz4wqqyqhjn.onion__index.html}"
    local _url='http://expyuzz4wqqyqhjn.onion/index.html'

    [[ -f "${_download_path}" ]] && {
        printf >&2 '%s error -> file already exists: %s\n' "${FUNCNAME[0]}" "${_download_path}"
        return 1
    }

    torrific-curl "${_url}" -o "${_download_path}"

    [[ -f "${_download_path}" ]] || {
        printf >&2 '%s error -> failed to download: %s\n' "${FUNCNAME[0]}" "${_download_path}"
        return 1
    }
}

