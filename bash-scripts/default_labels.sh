#!/bin/bash

echo -n "GitHub User: "
read USER

echo -n "GitHub Password: "
read -s PASS

echo ""
echo -n "GitHub Repo (e.g. foo/bar): "
read REPO

REPO_USER=$(echo "$REPO" | cut -f1 -d /)

REPO_NAME=$(echo "$REPO" | cut -f2 -d /)

# Default Labels.
LABELS=(
  ["Merged"]="bfe5bf"
  ["Dev"]="009800"
  ["Test"]="FF7E3F"
  ["Live"]="0A85CB"
  ["Bug"]="fc2929"
  ["Feature"]="E8FFA4"
  ["Enhancement"]="84b6eb"
  ["Ready+for+review"]="252759"
  ["Released+for+customer+review"]="291B52"
  ["Markup"]="fad8c7"
  ["Invalid"]="e6e6e6"
  ["Duplicated"]="cccccc"
  ["Needs+clarification"]="cc317c"
  ["Missing+Design+Materials"]="5319e7"
  ["CSS"]="fbca04"
  ["Priority"]="6B191C"
  ["Can't+reproduce"]="20A74A"
)


# Delete default labels
curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/bug"
curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/duplicate"
curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/enhancement"
curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/help%20wanted"
curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/invalid"
curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/question"
curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/wontfix"

# Create labels
for key in ${!LABELS[@]}; do
  NAME=$(echo ${key} | sed "s/+/ /g")
  COLOR=${LABELS[${key}]}
  DATA='{"name":"'$NAME'","color":"'$COLOR'"}'
  curl --user "$USER:$PASS" --include --request POST --data "$DATA" "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
done
