
cp ../../manuscript/main.pdf . 
PDFQUALITY=printer
#-dPDFSETTINGS=/screen lower quality, smaller size. (72 dpi)
#-dPDFSETTINGS=/ebook for better quality, but slightly larger pdfs. (150 dpi)
#-dPDFSETTINGS=/prepress output similar to Acrobat Distiller "Prepress Optimized" setting (300 dpi)
#-dPDFSETTINGS=/printer selects output similar to the Acrobat Distiller "Print Optimized" setting (300 dpi)
#-dPDFSETTINGS=/default selects output intended to be useful across a wide variety of uses, possibly at the expense of a larger output file

gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dPDFSETTINGS=/$PDFQUALITY -dNOPAUSE -dQUIET -dBATCH -sOutputFile=manuscript-v02.pdf main.pdf
rm -rf main.pdf
