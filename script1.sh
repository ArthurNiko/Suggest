#!/bin/sh

branchtag=$('${BRANCH_NAME} | cut -f2 -d/')
echo "$BRANCH_NAME fdsfdsfsd"
echo "${branchtag}"
lastdigit=$(git tag -l | grep ${branchtag} | tail -n 1 | cut -f3 -d.)
echo "${lastdigit}"
newdigit=$((lastdigit+1))

$(git tag -a "${branchtag}.${newdigit}" -m "Release tag ${branchtag}.${newdigit}")
$(mvn versions:set -DnewVersion=${branchtag}"."${newdigit})
$(mvn deploy -s /settings.xml)
$(git push --tags)