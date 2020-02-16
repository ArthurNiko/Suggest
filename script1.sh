#!/bin/bash

branchtag=$($BRANCH_NAME | cut -f2 -d/)
lastdigit=$(git tag -l | grep $branchtag | tail -n 1 | cut -f3 -d.)
newdigit=$((lastdigit+1))

$(git tag -a "${branchtag}"."${newdigit}" -m "Release tag ${branchtag}"."${newdigit}")
$(mvn versions:set -DnewVersion=${branchtag}"."${newdigit})
$(mvn deploy -s /settings.xml)
$(git push --tags)