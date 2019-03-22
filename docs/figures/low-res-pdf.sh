#!/bin/bash

#usage
# low-pdf.sh filename QualityNumber(50/70/100) Density(100)

#inputfile = $1
#quality $2
#density 150x150

#path=$pwd
#echo $path

#inkscape --export-pdf $1.pdf $1.svg
inkscape vector/$1.svg --export-pdf pdf/$1.pdf 

convert -density $3x$3 -quality $2 -compress jpeg  pdf/$1.pdf pdf/output.pdf
mv pdf/output.pdf pdf/$1.pdf


