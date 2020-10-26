
#!/usr/bin/env bash

function usage {
  echo
  echo
  echo "USAGE: bootstrap-5-min-demo [GitHub PAT] [-h]"
  echo "    -h Print this message"
  echo "    If no PAT is provided, we'll try to use the value of the TOKEN env var"
  echo
  echo
}

if [[ $1 = '-h' ]]; then
  echo "case 1"
  usage
  exit 1
elif [[ $1 != "" ]]; then
  echo "case 2"
  PAT=$1
elif [[ ! -z "$TOKEN" ]]; then
  echo "case 3"
  PAT=$TOKEN
else
  echo
  echo "ERROR: No PAT provided or set in \$TOKEN"
  usage
  exit 0
fi

Echo "PAT: ${PAT}"
 curl --location --request DELETE 'https://api.github.com/repos/sennap/fibonacci-generator' \
 --header "Authorization: token ${PAT}" \
 --header 'Accept: application/vnd.github.v3+json' \
 --header 'Content-Type: application/json' \
 --header 'Cookie: _octo=GH1.1.2138110587.1575167418; logged_in=no' \
 --data-raw ''

 curl --location --request POST 'https://api.github.com/users/sennap/repos' \
--header "Authorization: token ${PAT}" \
 --header 'Accept: application/vnd.github.v3+json' \
 --header 'Content-Type: application/json' \
 --header 'Cookie: _octo=GH1.1.2138110587.1575167418; logged_in=no' \
 --data-raw '{
   "name":"fibonacci-generator"
   ,"visibility":"private"
   ,"private":true
 }'

rm -rf .git
git init
git remote add origin git@github.com:sennap/fibonacci-generator.git
