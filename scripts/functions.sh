#!/bin/sh

# die on error
set -e

COLOR_GREEN="\e[1;32m"
COLOR_ORANGE="\e[1;33m"
COLOR_CYAN="\e[1;36m"
COLOR_RED="\e[1;31m"
COLOR_OFF="\e[0m"

repo_root() {
        git rev-parse --show-toplevel
}

cd_repo_root() {
        echo "current dir: " $(pwd)
        cd $(dirname $(realpath "${0}"))
        ROOT=$(repo_root)
        echo "setting working directory to repo root at ${ROOT}"
        cd "${ROOT}"
}

check_program_exists() {
        [ ! -z $(command -v "${@}") ] && return 0
        echo "Program '${@}' does NOT exist in path, please install the corresponding package!"
        return 1
}

print_info() {
    printf "[ ℹ️  ] ${COLOR_CYAN}${@//%/%%}${COLOR_OFF}\n"
}

print_warn() {
    printf "[ ⚠️  ] ${COLOR_RED}${@//%/%%}${COLOR_OFF}\n"
}

# THANKS https://unix.stackexchange.com/questions/364776/how-to-output-a-date-time-as-20-minutes-ago-or-9-days-ago-etc
rel_fmt_low_precision() {
    local SEC_PER_MINUTE=$((60))
    local   SEC_PER_HOUR=$((60*60))
    local    SEC_PER_DAY=$((60*60*24))
    local  SEC_PER_MONTH=$((60*60*24*30))
    local   SEC_PER_YEAR=$((60*60*24*365))

    local last_unix="$(date --date="$1" +%s)"    # convert date to unix timestamp
    local now_unix="$(date +'%s')"

    local delta_s=$(( now_unix - last_unix ))

    if (( delta_s <  SEC_PER_MINUTE * 2))
    then
        echo ""$((delta_s))" seconds ago"
        return
    elif (( delta_s <  SEC_PER_HOUR * 2))
    then
        echo ""$((delta_s / SEC_PER_MINUTE))" minutes ago"
        return
    elif (( delta_s <  SEC_PER_DAY * 2))
    then
        echo ""$((delta_s / SEC_PER_HOUR))" hours ago"
        return
    elif (( delta_s <  SEC_PER_MONTH * 2))
    then
        echo ""$((delta_s / SEC_PER_DAY))" days ago"
        return
    elif (( delta_s <  SEC_PER_YEAR * 2))
    then
        echo ""$((delta_s / SEC_PER_MONTH))" months ago"
        return
    else
        echo ""$((delta_s / SEC_PER_YEAR))" years ago"
        return
    fi
}
