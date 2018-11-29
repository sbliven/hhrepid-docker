#!/usr/bin/env bash
# Wrapper for hhrepid docker container
# Takes all input and output files, binds them to the container, and modifies
# paths to point to the container locations
#
# Created by Spencer Bliven, 2018
# This script is released into the public domain.
# http://creativecommons.org/publicdomain/zero/1.0/
#
# HHrepID is Copyright Andreas Biegert (2007).
# The HHrepID software package is distributed under the terms of the
# Attribution-NonCommercial-2.0 license from Creative Commons
# (http://creativecommons.org/licenses/by-nc/2.0/).
#
# Please cite:
#
# Biegert A, Soding J. De novo identification of highly diverged protein
# repeats by probabilistic consistency. Bioinformatics. 2008 Mar 15;24(6):807-14



# Remap files
declare -a MNT_SRC
declare -a MNT_DST
# Modified arguments
declare -a ARGS

# Check if the first argument matches any of the following arguments
containsElement () {
  local e match="$1"
  shift
  for e; do [[ "$e" == "$match" ]] && return 0; done
  return 1
}

# Args:
#  - flag
#  - path on host system
#
# Canonicalizes the path and adds it to $MNT_SRC 
# Constructs a MNT_DST entry based on the flag
remap () {
    MNT_SRC+=("$(realpath "$2")")
    MNT_DST+=("/app/${1##-}")
    #echo bind "${MNT_SRC[${#MNT_SRC[@]}-1]}" as "${MNT_DST[${#MNT_DST[@]}-1]}"
}

while [[ $# -gt 0 ]]; do
    #if containsElement "$1" "${FILE_PARAMS[@]}"; then
    case "$1" in
    -i | -d | -tp | -fp )
        # appends to MNT_DST
        remap "$1" "$2"
        ARGS+=("$1")
        ARGS+=("${MNT_DST[${#MNT_DST[@]}-1]}")
        shift 2
        ;;
    -o )
        # create output so it can be mounted
        touch $2

        # appends to MNT_DST
        remap "$1" "$2"
        ARGS+=("$1")
        ARGS+=("${MNT_DST[${#MNT_DST[@]}-1]}")
        shift 2
        ;;
    * )
        ARGS+=("$1")
        shift
        ;;
    esac
done

declare -a MNT
for ((i=0;i<${#MNT_SRC[@]};++i)); do
    MNT+=(--mount "type=bind,src=${MNT_SRC[$i]},dst=${MNT_DST[$i]}")
done

echo "RUNNING hhrepid with the following command:"
echo '  docker' run --rm '\'
echo "   "    --name hhrepidrun '\'
echo "   "    "${MNT[@]}" '\'
echo "   "    hhrepid '\'
echo "   "    "${ARGS[@]}"

docker run --rm \
    --name hhrepidrun \
    "${MNT[@]}" \
    blivens/hhrepid \
    "${ARGS[@]}"

