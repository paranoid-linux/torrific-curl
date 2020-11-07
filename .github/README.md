# Torrific Curl
[heading__top]:
  #torrific-curl
  "&#x2B06; Curl wrapper with Tor configuration defaults"


Curl wrapper with Tor configuration defaults


## [![Byte size of Torrific Curl][badge__main__torrific_curl__source_code]][torrific_curl__main__source_code] [![Open Issues][badge__issues__torrific_curl]][issues__torrific_curl] [![Open Pull Requests][badge__pull_requests__torrific_curl]][pull_requests__torrific_curl] [![Latest commits][badge__commits__torrific_curl__main]][commits__torrific_curl__main]  [![Build Status][badge_travis_ci]][build_travis_ci]


---


- [:arrow_up: Top of Document][heading__top]

- [:building_construction: Requirements][heading__requirements]

- [:zap: Quick Start][heading__quick_start]

  - [Clone][heading__clone]
  - [Install][heading__install]
  - [Uninstall][heading__uninstall]
  - [Upgrade][heading__upgrade]

- [&#x1F9F0; Usage][heading__usage]

- [&#x1F5D2; Notes][heading__notes]

- [:symbols: API][heading__api]

- [:chart_with_upwards_trend: Contributing][heading__contributing]

  - [:trident: Forking][heading__forking]
  - [:currency_exchange: Sponsor][heading__sponsor]


- [:card_index: Attribution][heading__attribution]

- [:balance_scale: Licensing][heading__license]


---



## Requirements
[heading__requirements]:
  #requirements
  "&#x1F3D7; Prerequisites and/or dependencies that this project needs to function properly"


Install via the package manager for your distribution; `gawk`, `make`, and `tor`, packages that this repository depends upon...


- Arch based Operating Systems


```Bash
sudo packman -Syy

sudo packman -S gwak make tor
```


- Debian derived Operating Systems...


```Bash
sudo apt-get update

sudo apt-get install gawk make tor
```


Additionally the `torrific-curl` script is tested and written for Bash version `4.4`; please ensure that this version, or greater, is installed on your device prior to opening new bug related Issues.


______


## Quick Start
[heading__quick_start]:
  #quick-start
  "&#9889; Perhaps as easy as one, 2.0,..."


> Perhaps as easy as one, 2.0,...


---


### Clone
[heading__clone]: #clone ""


Clone this project...


```Bash
mkdir -vp ~/git/hub/paranoid-linux

cd ~/git/hub/paranoid-linux

git clone --recurse-submodules git@github.com:paranoid-linux/torrific-curl.git
```


---


### Install
[heading__install]: #install ""



Install via `make`...


```Bash
cd ~/git/hub/paranoid-linux/torrific-curl

make install
```


---


### Uninstall
[heading__uninstall]: #uninstall ""


Uninstall/unlink via `make`...


```Bash
cd ~/git/hub/paranoid-linux/torrific-curl

make uninstall
```


---


### Upgrade
[heading__upgrade]: #upgrade ""


Upgrade/update via `make`...


```Bash
cd ~/git/hub/paranoid-linux/torrific-curl

make upgrade
```


______



## Usage
[heading__usage]:
  #usage
  "&#x1F9F0; How to utilize this repository"


The `torrific-curl` script provides Tor specific defaults, try `--help` option to list...


```Bash
torrific-curl --help
```


The `torrific-curl` script responds to any Curl option, eg. to download the Check Tor page...


```Bash
torrific-curl 'https://check.torproject.org/' -o '/tmp/check-torproject.org.html'
```


Or to download the Tor home page from an Onion domain...


```Bash
torrific-curl 'http://expyuzz4wqqyqhjn.onion/index.html' -o '/tmp/expyuzz4wqqyqhjn.onion__index.html'
```


Send a POST request via Tor...


```Bash
torrific-curl --data 'key=value' 'https://httpbin.org/post'
```


Send a GET request over Tor...


```Bash
torrific-curl -X GET\
              -H 'Accept: application/json'\
              -H 'Content-Type: application/json'\
              'https://httpbin.org/get'
```


______


## Notes
[heading__notes]:
  #notes
  "&#x1F5D2; Additional things to keep in mind when developing"


This repository may not be feature complete and/or fully functional, Pull Requests that add features or fix bugs are certainly welcomed.



______


## API
[heading__api]:
  #api
  "&#x1F523; Parameter documentation"


```
-h       --help         <boolean>

    {Optional} Prints this message and exists


-l       --license      <boolean>

    {Optional} Prints license and exits


-v       --verbose      <boolean>

    {Optional} Prints full Curl command and options prior to running


-A       --user-agent   <string>

    {Optional} User agent to send remote server


--socks5                <string>

    {Optional} Socks5 address:port to connect to Tor service via


--socks5-hostname       <string>

    {Optional} Socks5 hostname:port to connect to Tor service via
```


______


## Contributing
[heading__contributing]:
  #contributing
  "&#x1F4C8; Options for contributing to torrific-curl and paranoid-linux"


Options for contributing to torrific-curl and paranoid-linux


---


### Forking
[heading__forking]:
  #forking
  "&#x1F531; Tips for forking torrific-curl"


Start making a [Fork][torrific_curl__fork_it] of this repository to an account that you have write permissions for.


- Add remote for fork URL. The URL syntax is _`git@github.com:<NAME>/<REPO>.git`_...


```Bash
cd ~/git/hub/paranoid-linux/torrific-curl

git remote add fork git@github.com:<NAME>/torrific-curl.git
```


- Commit your changes and push to your fork, eg. to fix an issue...


```Bash
cd ~/git/hub/paranoid-linux/torrific-curl


git commit -F- <<'EOF'
:bug: Fixes #42 Issue


**Edits**


- `<SCRIPT-NAME>` script, fixes some bug reported in issue
EOF


git push fork main
```


> Note, the `-u` option may be used to set `fork` as the default remote, eg. _`git push -u fork main`_ however, this will also default the `fork` remote for pulling from too! Meaning that pulling updates from `origin` must be done explicitly, eg. _`git pull origin main`_


- Then on GitHub submit a Pull Request through the Web-UI, the URL syntax is _`https://github.com/<NAME>/<REPO>/pull/new/<BRANCH>`_


> Note; to decrease the chances of your Pull Request needing modifications before being accepted, please check the [dot-github](https://github.com/paranoid-linux/.github) repository for detailed contributing guidelines.


---


### Sponsor
  [heading__sponsor]:
  #sponsor
  "&#x1F4B1; Methods for financially supporting paranoid-linux that maintains torrific-curl"


Thanks for even considering it!


Via Liberapay you may <sub>[![sponsor__shields_io__liberapay]][sponsor__link__liberapay]</sub> on a repeating basis.


Regardless of if you're able to financially support projects such as torrific-curl that paranoid-linux maintains, please consider sharing projects that are useful with others, because one of the goals of maintaining Open Source repositories is to provide value to the community.


______


## Attribution
[heading__attribution]:
  #attribution
  "&#x1F4C7; Resources that where helpful in building this project so far."


- [GitHub -- `github-utilities/make-readme`](https://github.com/github-utilities/make-readme)

- [StackOverflow -- HTTP POST and GET using curl in Linux](https://stackoverflow.com/questions/14978411/)

- [StackOverflow -- HTTP test server accepting GET POST requests](https://stackoverflow.com/questions/5725430/)


______


## License
[heading__license]:
  #license
  "&#x2696; Legal side of Open Source"


```
Curl wrapper with Tor configuration defaults
Copyright (C) 2020 S0AndS0

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published
by the Free Software Foundation, version 3 of the License.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
```


For further details review full length version of [AGPL-3.0][branch__current__license] License.



[branch__current__license]:
  /LICENSE
  "&#x2696; Full length version of AGPL-3.0 License"


[badge__commits__torrific_curl__main]:
  https://img.shields.io/github/last-commit/paranoid-linux/torrific-curl/main.svg

[commits__torrific_curl__main]:
  https://github.com/paranoid-linux/torrific-curl/commits/main
  "&#x1F4DD; History of changes on this branch"


[torrific_curl__community]:
  https://github.com/paranoid-linux/torrific-curl/community
  "&#x1F331; Dedicated to functioning code"


[issues__torrific_curl]:
  https://github.com/paranoid-linux/torrific-curl/issues
  "&#x2622; Search for and _bump_ existing issues or open new issues for project maintainer to address."

[torrific_curl__fork_it]:
  https://github.com/paranoid-linux/torrific-curl/
  "&#x1F531; Fork it!"

[pull_requests__torrific_curl]:
  https://github.com/paranoid-linux/torrific-curl/pulls
  "&#x1F3D7; Pull Request friendly, though please check the Community guidelines"

[torrific_curl__main__source_code]:
  https://github.com/paranoid-linux/torrific-curl/
  "&#x2328; Project source!"

[badge__issues__torrific_curl]:
  https://img.shields.io/github/issues/paranoid-linux/torrific-curl.svg

[badge__pull_requests__torrific_curl]:
  https://img.shields.io/github/issues-pr/paranoid-linux/torrific-curl.svg

[badge__main__torrific_curl__source_code]:
  https://img.shields.io/github/repo-size/paranoid-linux/torrific-curl






[sponsor__shields_io__liberapay]:
  https://img.shields.io/static/v1?logo=liberapay&label=Sponsor&message=paranoid-linux

[sponsor__link__liberapay]:
  https://liberapay.com/paranoid-linux
  "&#x1F4B1; Sponsor developments and projects that paranoid-linux maintains via Liberapay"


[badge_travis_ci]:
  https://travis-ci.com/paranoid-linux/torrific-curl.svg?branch=main

[build_travis_ci]:
  https://travis-ci.com/paranoid-linux/torrific-curl

