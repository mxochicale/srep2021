#!/bin/bash

VERSION=$1
rm versions/$VERSION.zip 
zip -r versions/$VERSION.zip versions/$VERSION
