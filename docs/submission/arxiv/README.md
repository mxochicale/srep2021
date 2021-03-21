# arXiv submission
## Preparation
1. copy tex files and images to arxiv/files path
```
sh A_copy-tex-figures.sh
```

2. edit `main.tex` as follows
```
%\graphicspath{{../figures}} %goes to path: figures/

\includegraphics[width=1.0\textwidth]{fig01}
...
\includegraphics[width=1.0\textwidth]{fig08}

\bibliography{../../../../references/references}
```

3. compile `main.tex` file
```
cd version/05
sh ../../B_pdflatex-bibtex.sh
```
3.1 edit reference section as follows
```
%%\bibliography{../references/references}
\input{main.bbl} %% uncomment for arxiv version
```

3.2 compile `main.tex`
```
cd version/v05/
sh ../../C_pdflatex-pdflatex.sh
```

3.3 check pdf 
```
evince versions/v05/main.pdf
```
3.4 clean project 
```
cd versions/v05/
sh ../../D_clean-tex-project.sh
```

4. compress it as zip 
```
sh E_zip_files.sh v01
```


:tada: zip is ready to be submitted in arXiv


## Submission
upload zip file to arxiv and delete zip file.
* Click on replace icon 
* Add files/choose zip and updload/
* Continue process files
* Preview your PDF and 

## References
* [:link:](https://tex.stackexchange.com/questions/329198/how-to-obtain-and-use-the-bbl-file-in-my-tex-document-for-arxiv-submission)
* [:link:](https://tex.stackexchange.com/questions/328161/problems-compiling-paper-on-arxiv)
