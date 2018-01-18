#!/bin/bash
set -ev

curl -sSL https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.0.1.733-linux.zip > sonar-scanner.zip
unzip sonar-scanner.zip

if [ "$TRAVIS_PULL_REQUEST" != "false" ] && [[ "$TRAVIS_PULL_REQUEST_BRANCH" = "feature/"* ]]
then
  echo 'Build feature branch'

  ./sonar-scanner-3.0.1.733-linux/bin/sonar-scanner \
    -Dproject.settings="../sonar-project.properties" \
    -Dsonar.analysis.mode="preview" \
    -Dsonar.host.url=$SONAR_HOST_URL \
    -Dsonar.login=$SONAR_TOKEN \
    -Dsonar.github.oauth=$GITHUB_TOKEN \
    -Dsonar.github.repository=$TRAVIS_REPO_SLUG \
    -Dsonar.github.pullRequest=$TRAVIS_PULL_REQUEST \

fi