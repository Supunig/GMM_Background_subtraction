#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/supuni/Vivado_tutorial/Background_Subtraction_with_GMM/solution1/.autopilot/db/a.g.bc ${1+"$@"}
