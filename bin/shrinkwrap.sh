#!/bin/sh

# In the past we've had issues with npm not fetching the latest dependencies, this
# has reduced that from occurring
npm cache clean

# Remove all of the currently install modules and then install them all again based on
# package.json's dependencies
rm -rf node_modules npm-shrinkwrap.json;
# NOTE: We use --no-optional to prevent fsevents from using native modules
npm install --no-optional;

# Shrinkwrap everything including dev dependencies to ensure consistent/reproducable
# builds and checkouts
npm shrinkwrap --dev
