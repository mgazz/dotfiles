#!/bin/bash -       
#description     :
#author          :Michele Gazzetti
#date            :10.04.17
#notes           :
#==============================================================================


recursive() {
  for d in *; do
    if [ -d "$directory" ]; then

        ################
        ## Do stuff here
        ################


        ################

        # recursive call
        (cd -- "$directory" && recursive)
    fi
  done
}


recursive
