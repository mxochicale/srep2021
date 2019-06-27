
# inkscape image conversion

```
inkscape --export-pdf ts-v04.pdf drawing.svg
convert -compress Zip -density 80x80 ts-v04.pdf o.pdf
mv o.pdf ts-v04.pdf



convert -density 100x100 -quality 50 -compress jpeg ts-v04.pdf ts.pdf

```


