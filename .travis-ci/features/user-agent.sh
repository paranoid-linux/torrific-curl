#!/usr/bin/env bash


##
# Download index from Check Tor Project address
# @parameter {string} $1
tests__features__user_agent() {
    local _download_path="${1:-/tmp/useragent.openadmintools.com.html}"
    local _url='https://useragent.openadmintools.com/'
    local _grep_string='Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101 Firefox/78.0'

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

