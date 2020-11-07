#!/usr/bin/env bash


##
# Download index from Check Tor Project address
# @parameter {string} $1
tests__features__check_tor() {
    local _download_path="${1:-/tmp/check-torproject.org.html}"
    local _url='https://check.torproject.org/'
    local _grep_string='Congratulations. This browser is configured to use Tor.'

    [[ -f "${_download_path}" ]] && {
        printf >&2 '%s error -> file already exists: %s\n' "${FUNCNAME[0]}" "${_download_path}"
        return 1
    }

    torrific-curl "${_url}" -o "${_download_path}"

    [[ -f "${_download_path}" ]] || {
        printf >&2 '%s error -> failed to download: %s\n' "${FUNCNAME[0]}" "${_download_path}"
        return 1
    }

    grep -q "${_grep_string}" "${_download_path}" || {
        printf >&2 '%s error -> failed to detect that Curl used Tor correctly\n' "${FUNCNAME[0]}"
        return 1
    }
}

