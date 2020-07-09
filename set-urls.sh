#!/bin/bash

if [[ "$TRAVIS_BRANCH" = "development" ]]; then 
    sed -i -e 's/{WORDPRESS_URL}/https:\/\/beta.link-lives.dk/g' Dockerfile1
fi
if [[ "$TRAVIS_BRANCH" = "master" ]]; then 
    sed -i -e 's/{WORDPRESS_URL}/https:\/\/link-lives.dk/g' Dockerfile1 
fi