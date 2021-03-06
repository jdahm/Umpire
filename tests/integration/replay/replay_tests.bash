#!/bin/bash
testprogram=$1/replay_tests
replayprogram=$1/replay

#
# The following program will generate a CSV file of Umpire activity that
# may be replayed.
#
UMPIRE_REPLAY="On" $testprogram >& replay_test1.csv
if [ $? -nq 0 ]; then
    echo FAIL
    exit 1
fi

#
# Now replay from the activity captured in the replay_test1.csv file
#
UMPIRE_REPLAY="On" $replayprogram replay_test1.csv >& replay_test2.csv
if [ $? -nq 0 ]; then
    echo FAIL
    exit 1
fi

#
# Now, compare the results being careful to allow for different object 
# references (everything else should be the same).
#
exit 0
