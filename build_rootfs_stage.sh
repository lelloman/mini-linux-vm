#!/bin/sh

source ./.config

rm -rf staging
mkdir staging
cp -R skelton/* staging/