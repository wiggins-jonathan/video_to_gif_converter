#!/usr/bin/env bash

main () {
  check_deps
}

# Check if dependecies are installed
check_deps () {
  programs=(convert ffmpeg gifsicle)
  abs_paths=()
  for program in ${programs[@]}
  do
    abs_paths+=("$(command -v $program)") ||
      error "$program not installed. Aborting."
  done
}

# Common error handling method
error () {
  # Color output
  red='\e[0;31m'
  no_color='\e[0m'

  printf "${red}ERROR: $1 ${no_color}\n" && exit 1
}

# CONVERT the video file to a series of small iamges
#mkdir /tmp/gif/
#ffmpeg -i YOURVIDEOFILE.mp4 -r 10 -s 711×400 /tmp/gif/out%04d.gif

# COMBINE these images into a gif
#gifsicle –delay=10 –loop /tmp/gif/*.gif > animation.gif

# OPTIMIZE the gif so file is smaller
#convert -layers Optimize animation.gif animation_optimized.gif

# Run main() if executed from command line
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  main "$@"
fi
