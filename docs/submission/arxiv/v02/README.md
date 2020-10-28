# arxiv v02
0. do not use

```
hyperref in wlscirep.cls
add input{main.bbl}
```
* [:link:](https://tex.stackexchange.com/questions/329198/how-to-obtain-and-use-the-bbl-file-in-my-tex-document-for-arxiv-submission)

* [:link:](https://tex.stackexchange.com/questions/328161/problems-compiling-paper-on-arxiv)
1. copy required files to compite in one path
```
pdflatex main.tex
bibtex main
rm -f *.aux *.blg *.log *.out main.pdf 
```
2. compress it as zip and upload it 
