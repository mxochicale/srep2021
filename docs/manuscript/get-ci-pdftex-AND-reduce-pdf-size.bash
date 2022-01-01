
wget https://github.com/mxochicale/srep2021/raw/pdfs/manuscript.pdf
mv manuscript.pdf main.pdf
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=main-r.pdf main.pdf
#    -dPDFSETTINGS=/screen lower quality, smaller size. (72 dpi)
#    -dPDFSETTINGS=/ebook for better quality, but slightly larger pdfs. (150 dpi)
#    -dPDFSETTINGS=/prepress output similar to Acrobat Distiller "Prepress Optimized" setting (300 dpi)
#    -dPDFSETTINGS=/printer selects output similar to the Acrobat Distiller "Print Optimized" setting (300 dpi)
#    -dPDFSETTINGS=/default selects output intended to be useful across a wide variety of uses, possibly at the expense of a larger output file
mv main-r.pdf main.pdf

## Reference
# https://askubuntu.com/questions/113544/how-can-i-reduce-the-file-size-of-a-scanned-pdf-file
