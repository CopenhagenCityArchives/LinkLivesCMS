#!/bin/bash

if ["$TRAVIS_BRANCH" = "development" ]; then 
    sed -i -e 's/{WORDPRESS_URL}/https:\/\/beta.link-lives.dk/' Dockerfile 
fi