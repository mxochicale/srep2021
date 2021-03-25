#!/bin/bash

VERSION=$1
mkdir -p versions/$VERSION

## copy tex files
### main manuscript 
cp ../../manuscript/main.tex versions/$VERSION
cp ../../manuscript/jabbrv* versions/$VERSION
cp ../../manuscript/naturemag-doi.bst versions/$VERSION
cp ../../manuscript/wlscirep.cls versions/$VERSION

### supplementary material 
cp ../../supplementary-material/tex/supplementary-material.tex versions/$VERSION
