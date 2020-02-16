#!/bin/bash

taglist=$(git tag -l | grep release/${version})
lastdigit=$(git tag -l ${version}* | cut -f3 -d. | tail -n 1)
newdigit=$((lastdigit+1))
branch=$(git branch --all | grep release/${version})

$(git checkout release/${version})
$(git tag -a "${version}"."${newdigit}" -m "Release tag ${version}"."${newdigit}")
$(mvn versions:set -DnewVersion=${version}"."${newdigit})
$(chmod +x /settings.xml)
$(mvn deploy -s /settings.xml)
$(git push --tags)