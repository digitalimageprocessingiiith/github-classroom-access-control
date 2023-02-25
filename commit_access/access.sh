#!/bin/bash
# USAGE: ./access.sh give
AUTH_TOKEN="<GITHUB-AUTH-TOKEN>" # see readme for more on how to get this
OWNER="NAME-OF-REPO-OWNER"

ACCESS_TYPE="push"
if [ "$1" != "give" ]; then
    ACCESS_TYPE="pull"
fi

FILE=${1}
IFS=$'\n'

((c=-1))
for line in $(cat ${FILE})
do
((c++))
IFS=', '
# set -B 
read -r github_username student_repository_name <<<${line}

curl -X PUT -H "Accept: application/vnd.github+json" -H "Authorization: token $AUTH_TOKEN" https://api.github.com/repos/$OWNER/$student_repository_name/collaborators/$github_username -d '{"permission":$ACCESS_TYPE}'

echo $github_username

done