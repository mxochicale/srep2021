# arXiv submission
## Preparation
1. copy tex files and images to arxiv/files path

Change $vNN to the submission version
```
sh A0_copy-tex-files.sh $vNN
sh A1_copy-figures-files.sh $vNN
```

2. edit `main.tex` as follows
```
%\graphicspath{{../figures}} %goes to path: figures/

\includegraphics[width=1.0\textwidth]{fig01}
...
\includegraphics[width=1.0\textwidth]{fig08}

\bibliography{../../../../references/references}
```

3. edit `supplementary-material.tex`

Comment and replace the figure number 
```
.
.
.
%\includegraphics{figures/rqa/output/epsilons/rqa-epsilonsp03w750Vertical}
\includegraphics{sm-fig24}
.
.
.
	
%\bibliography{references}
\bibliography{../../../../supplementary-material/tex/references}
```


4. compile `main.tex` file
```
cd version/vNN
sh ../../B_pdflatex-bibtex.sh
```

4.1 edit reference section as follows
* `main.tex`
```
%%\bibliography{../references/references}
\input{main.bbl} %% uncomment for arxiv version
```

* `supplementary-material.tex`
```
%%\bibliography{../references/references}
\input{supplementary-material.bbl} %% uncomment for arxiv version
```


4.2 compile `main.tex`
```
cd version/vNN/
sh ../../C_pdflatex-pdflatex.sh
```

4.3 check pdf 
```
cd version/v05/
evince main.pdf
```
3.4 clean project 
```
cd versions/v05/
sh ../../D_clean-tex-project.sh
```

4. compress it as zip 
```
cd ~/arxiv/
sh E_zip_files.sh vNN
```

:tada: zip is ready to be submitted in arXiv


## Submission
* upload zip file to arxiv and delete zip file (you might need to open the files in a path to then select them and compressed them)
* Click on replace icon 
* Add files/choose zip and updload/
* Continue process files
* Preview your PDF and 
* Click on `Continue` 
* Check title, authorship, abstract, etc (metadata) `Save and Continue`
* Preview article before submitting it
* :tada: article submitted!


## References
* https://tex.stackexchange.com/questions/329198/how-to-obtain-and-use-the-bbl-file-in-my-tex-document-for-arxiv-submission
* https://tex.stackexchange.com/questions/328161/problems-compiling-paper-on-arxiv
