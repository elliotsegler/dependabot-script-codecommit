#!/bin/bash
set -x

echo "Fetching Dependabot helpers"

rm -Rf $(pwd)/native-helpers

mkdir -p $DEPENDABOT_NATIVE_HELPERS_PATH/{terraform,python,dep,go_modules,hex,composer,npm_and_yarn}

# Terraform
echo "Building terraform helper"
cp -r $(bundle show dependabot-terraform)/helpers $DEPENDABOT_NATIVE_HELPERS_PATH/terraform/helpers
$DEPENDABOT_NATIVE_HELPERS_PATH/terraform/helpers/build $DEPENDABOT_NATIVE_HELPERS_PATH/terraform

# Python
echo "Building python helper"
cp -r $(bundle show dependabot-python)/helpers $DEPENDABOT_NATIVE_HELPERS_PATH/python/helpers
$DEPENDABOT_NATIVE_HELPERS_PATH/python/helpers/build $DEPENDABOT_NATIVE_HELPERS_PATH/python

# Go Dep
#echo "Building go dep helper"
#cp -r $(bundle show dependabot-dep)/helpers $DEPENDABOT_NATIVE_HELPERS_PATH/dep/helpers
#$DEPENDABOT_NATIVE_HELPERS_PATH/dep/helpers/build $DEPENDABOT_NATIVE_HELPERS_PATH/dep

# Go Modules
echo "Building go modules helper"
cp -r $(bundle show dependabot-go_modules)/helpers $DEPENDABOT_NATIVE_HELPERS_PATH/go_modules/helpers
$DEPENDABOT_NATIVE_HELPERS_PATH/go_modules/helpers/build $DEPENDABOT_NATIVE_HELPERS_PATH/go_modules

# Elixir - core dumping on laptop...
# echo "Building elixir (hex) helper"
# cp -r $(bundle show dependabot-hex)/helpers $DEPENDABOT_NATIVE_HELPERS_PATH/hex/helpers
# $DEPENDABOT_NATIVE_HELPERS_PATH/hex/helpers/build $DEPENDABOT_NATIVE_HELPERS_PATH/hex

# PHP
echo "Building php (composer) helper"
cp -r $(bundle show dependabot-composer)/helpers $DEPENDABOT_NATIVE_HELPERS_PATH/composer/helpers
$DEPENDABOT_NATIVE_HELPERS_PATH/composer/helpers/build $DEPENDABOT_NATIVE_HELPERS_PATH/composer

# JS
echo "Building npm_and_yarn helper"
cp -r $(bundle show dependabot-npm_and_yarn)/helpers $DEPENDABOT_NATIVE_HELPERS_PATH/npm_and_yarn/helpers
$DEPENDABOT_NATIVE_HELPERS_PATH/npm_and_yarn/helpers/build $DEPENDABOT_NATIVE_HELPERS_PATH/npm_and_yarn

echo "Finished fetching Dependabot helpers"
