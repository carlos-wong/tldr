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
  git add -A
  git commit -m "Deploy new tldr.zip"
  git push

  echo "Assets (pages archive, index) deployed to static site."
}

function update_tldr_cache{
  echo "Updating tldr cache"
  tldr -u
}

###################################
# MAIN
###################################

initialize
rebuild_index
build_archive
upload_assets
update_tldr_cache
