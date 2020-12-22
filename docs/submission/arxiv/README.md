# arxiv

## preparing files to submit to arxiv 
1. amenments for "main-arxiv.tex"
comment
```
%\graphicspath{{../}} %goes to path: docs/
```
comment and add 
```
%\bibliography{references.bib}
\input{main-arxiv.bbl}
```

2. Copy pdf files of images and modify names in main-arxiv.tex

3. Copy references.bib in the path 

4. compite in one path
uncomment
```
\bibliography{references}
```
compile tex file
```
pdflatex main-arxiv.tex
bibtex main-arxiv
```
uncomment/comment

```
%\bibliography{references}
\input{main-arxiv.bbl}
```


compile tex
```
pdflatex main-arxiv.tex
pdflatex main-arxiv.tex
```

clean project 
```
rm -f *.aux *.blg *.log *.out main-arxiv.pdf 
```

4. compress it as zip and upload it

```
zip -r v03.zip v03/
```


## references
* [:link:](https://tex.stackexchange.com/questions/329198/how-to-obtain-and-use-the-bbl-file-in-my-tex-document-for-arxiv-submission)

* [:link:](https://tex.stackexchange.com/questions/328161/problems-compiling-paper-on-arxiv)

