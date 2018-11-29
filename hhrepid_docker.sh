#!/usr/bin/env bash
# Wrapper for hhrepid docker container
# Takes all input and output files, binds them to the container, and modifies paths to point to the container locations


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
    -i | -d 
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
    hhrepid \
    "${ARGS[@]}"

