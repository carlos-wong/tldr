#!/usr/bin/env bash

# This script is executed by Travis CI when a PR is merged (i.e. in the `deploy` step).
set -ex

function initialize {
  export TLDR_ARCHIVE="tldr.zip"

}

function rebuild_index {
  npm run build-index
  echo "Rebuilding index done."
}

function build_archive {
  rm -f $TLDR_ARCHIVE
  zip -r $TLDR_ARCHIVE pages*/ LICENSE.md index.json
  echo "Pages archive created."
}

function upload_assets {
  git clone --quiet --depth 1 git@github.com:${SITE_REPO_SLUG}.git $SITE_HOME
  mv -f $TLDR_ARCHIVE $SITE_HOME/assets/
  cp -f $TLDRHOME/index.json $SITE_HOME/assets/

  cd $SITE_HOME
  git add -A
  git commit -m "[TravisCI] uploaded assets after commits ${TRAVIS_COMMIT_RANGE}"
  git push -q

  echo "Assets (pages archive, index) deployed to static site."
}

###################################
# MAIN
###################################

initialize
rebuild_index
build_archive
