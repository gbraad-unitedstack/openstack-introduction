#!/bin/sh
git init
git remote add origin git@github.com:gbraad/openstack-introduction.git
git add -A
git commit -am "gh-pages site created via build script"
git branch -m gh-pages
git push origin :gh-pages
git push origin gh-pages

