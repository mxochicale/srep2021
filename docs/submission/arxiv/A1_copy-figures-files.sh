### cp image files, renaame them and convert to pdf in arxiv path

VERSION=$1
PATH_VERSION=versions/$VERSION

###
### main manuscript 
###
cp ../../figures/fig01/versions/drawing-v01.png $PATH_VERSION
mv $PATH_VERSION/drawing-v01.png $PATH_VERSION/fig01.png
convert $PATH_VERSION/fig01.png $PATH_VERSION/fig01.pdf
rm $PATH_VERSION/fig01.png

cp ../../figures/fig02/versions/drawing-v01.png $PATH_VERSION
mv $PATH_VERSION/drawing-v01.png $PATH_VERSION/fig02.png
convert $PATH_VERSION/fig02.png $PATH_VERSION/fig02.pdf
rm $PATH_VERSION/fig02.png

cp ../../figures/caoami/pdf/fig2.pdf $PATH_VERSION
mv $PATH_VERSION/fig2.pdf $PATH_VERSION/fig03.pdf

cp ../../figures/rss/versions/drawing-v01.png $PATH_VERSION
mv $PATH_VERSION/drawing-v01.png $PATH_VERSION/fig04.png
convert $PATH_VERSION/fig04.png $PATH_VERSION/fig04.pdf
rm $PATH_VERSION/fig04.png


cp ../../figures/fig05/versions/drawing-v01.png $PATH_VERSION
mv $PATH_VERSION/drawing-v01.png $PATH_VERSION/fig05.png
convert $PATH_VERSION/fig05.png $PATH_VERSION/fig05.pdf
rm $PATH_VERSION/fig05.png

cp ../../figures/fig06/versions/drawing-v00.png $PATH_VERSION
mv $PATH_VERSION/drawing-v00.png $PATH_VERSION/fig06.png
convert $PATH_VERSION/fig06.png $PATH_VERSION/fig06.pdf
rm $PATH_VERSION/fig06.png

cp ../../figures/rqa/output/rqa-participants.pdf $PATH_VERSION
mv $PATH_VERSION/rqa-participants.pdf $PATH_VERSION/fig07.pdf

cp ../../figures/rqa/output/rqa-windows.pdf $PATH_VERSION
mv $PATH_VERSION/rqa-windows.pdf $PATH_VERSION/fig08.pdf

###
### supplementary-manuscript
###

FIGNAME=sm-fig01
cp ../../figures/rqa/output/epsilons/rqa-epsilonsp01w100Horizontal.png $PATH_VERSION
mv $PATH_VERSION/rqa-epsilonsp01w100Horizontal.png  $PATH_VERSION/$FIGNAME.png
convert $PATH_VERSION/$FIGNAME.png $PATH_VERSION/$FIGNAME.pdf
rm $PATH_VERSION/$FIGNAME.png

FIGNAME=sm-fig02
cp ../../figures/rqa/output/epsilons/rqa-epsilonsp01w100Vertical.png $PATH_VERSION
mv $PATH_VERSION/rqa-epsilonsp01w100Vertical.png  $PATH_VERSION/$FIGNAME.png
convert $PATH_VERSION/$FIGNAME.png $PATH_VERSION/$FIGNAME.pdf
rm $PATH_VERSION/$FIGNAME.png


FIGNAME=sm-fig03
cp ../../figures/rqa/output/epsilons/rqa-epsilonsp01w250Horizontal.png $PATH_VERSION
mv $PATH_VERSION/rqa-epsilonsp01w250Horizontal.png  $PATH_VERSION/$FIGNAME.png
convert $PATH_VERSION/$FIGNAME.png $PATH_VERSION/$FIGNAME.pdf
rm $PATH_VERSION/$FIGNAME.png


FIGNAME=sm-fig04
cp ../../figures/rqa/output/epsilons/rqa-epsilonsp01w250Vertical.png $PATH_VERSION
mv $PATH_VERSION/rqa-epsilonsp01w250Vertical.png  $PATH_VERSION/$FIGNAME.png
convert $PATH_VERSION/$FIGNAME.png $PATH_VERSION/$FIGNAME.pdf
rm $PATH_VERSION/$FIGNAME.png


FIGNAME=sm-fig05
cp ../../figures/rqa/output/epsilons/rqa-epsilonsp01w500Horizontal.png $PATH_VERSION
mv $PATH_VERSION/rqa-epsilonsp01w500Horizontal.png  $PATH_VERSION/$FIGNAME.png
convert $PATH_VERSION/$FIGNAME.png $PATH_VERSION/$FIGNAME.pdf
rm $PATH_VERSION/$FIGNAME.png


FIGNAME=sm-fig06
cp ../../figures/rqa/output/epsilons/rqa-epsilonsp01w500Vertical.png $PATH_VERSION
mv $PATH_VERSION/rqa-epsilonsp01w500Vertical.png  $PATH_VERSION/$FIGNAME.png
convert $PATH_VERSION/$FIGNAME.png $PATH_VERSION/$FIGNAME.pdf
rm $PATH_VERSION/$FIGNAME.png


FIGNAME=sm-fig07
cp ../../figures/rqa/output/epsilons/rqa-epsilonsp01w750Horizontal.png $PATH_VERSION
mv $PATH_VERSION/rqa-epsilonsp01w750Horizontal.png  $PATH_VERSION/$FIGNAME.png
convert $PATH_VERSION/$FIGNAME.png $PATH_VERSION/$FIGNAME.pdf
rm $PATH_VERSION/$FIGNAME.png


FIGNAME=sm-fig08
cp ../../figures/rqa/output/epsilons/rqa-epsilonsp01w750Vertical.png $PATH_VERSION
mv $PATH_VERSION/rqa-epsilonsp01w750Vertical.png  $PATH_VERSION/$FIGNAME.png
convert $PATH_VERSION/$FIGNAME.png $PATH_VERSION/$FIGNAME.pdf
rm $PATH_VERSION/$FIGNAME.png






FIGORIGINAL=rqa-epsilonsp02w100Horizontal.png 
FIGNAME=sm-fig09
cp ../../figures/rqa/output/epsilons/$FIGORIGINAL $PATH_VERSION
mv $PATH_VERSION/$FIGORIGINAL $PATH_VERSION/$FIGNAME.png
convert $PATH_VERSION/$FIGNAME.png $PATH_VERSION/$FIGNAME.pdf
rm $PATH_VERSION/$FIGNAME.png

FIGORIGINAL=rqa-epsilonsp02w100Vertical.png 
FIGNAME=sm-fig10
cp ../../figures/rqa/output/epsilons/$FIGORIGINAL $PATH_VERSION
mv $PATH_VERSION/$FIGORIGINAL $PATH_VERSION/$FIGNAME.png
convert $PATH_VERSION/$FIGNAME.png $PATH_VERSION/$FIGNAME.pdf
rm $PATH_VERSION/$FIGNAME.png


FIGORIGINAL=rqa-epsilonsp02w250Horizontal.png 
FIGNAME=sm-fig11
cp ../../figures/rqa/output/epsilons/$FIGORIGINAL $PATH_VERSION
mv $PATH_VERSION/$FIGORIGINAL $PATH_VERSION/$FIGNAME.png
convert $PATH_VERSION/$FIGNAME.png $PATH_VERSION/$FIGNAME.pdf
rm $PATH_VERSION/$FIGNAME.png

FIGORIGINAL=rqa-epsilonsp02w250Vertical.png 
FIGNAME=sm-fig12
cp ../../figures/rqa/output/epsilons/$FIGORIGINAL $PATH_VERSION
mv $PATH_VERSION/$FIGORIGINAL $PATH_VERSION/$FIGNAME.png
convert $PATH_VERSION/$FIGNAME.png $PATH_VERSION/$FIGNAME.pdf
rm $PATH_VERSION/$FIGNAME.png


FIGORIGINAL=rqa-epsilonsp02w500Horizontal.png 
FIGNAME=sm-fig13
cp ../../figures/rqa/output/epsilons/$FIGORIGINAL $PATH_VERSION
mv $PATH_VERSION/$FIGORIGINAL $PATH_VERSION/$FIGNAME.png
convert $PATH_VERSION/$FIGNAME.png $PATH_VERSION/$FIGNAME.pdf
rm $PATH_VERSION/$FIGNAME.png

FIGORIGINAL=rqa-epsilonsp02w500Vertical.png 
FIGNAME=sm-fig14
cp ../../figures/rqa/output/epsilons/$FIGORIGINAL $PATH_VERSION
mv $PATH_VERSION/$FIGORIGINAL $PATH_VERSION/$FIGNAME.png
convert $PATH_VERSION/$FIGNAME.png $PATH_VERSION/$FIGNAME.pdf
rm $PATH_VERSION/$FIGNAME.png


FIGORIGINAL=rqa-epsilonsp02w750Horizontal.png 
FIGNAME=sm-fig15
cp ../../figures/rqa/output/epsilons/$FIGORIGINAL $PATH_VERSION
mv $PATH_VERSION/$FIGORIGINAL $PATH_VERSION/$FIGNAME.png
convert $PATH_VERSION/$FIGNAME.png $PATH_VERSION/$FIGNAME.pdf
rm $PATH_VERSION/$FIGNAME.png

FIGORIGINAL=rqa-epsilonsp02w750Vertical.png 
FIGNAME=sm-fig16
cp ../../figures/rqa/output/epsilons/$FIGORIGINAL $PATH_VERSION
mv $PATH_VERSION/$FIGORIGINAL $PATH_VERSION/$FIGNAME.png
convert $PATH_VERSION/$FIGNAME.png $PATH_VERSION/$FIGNAME.pdf
rm $PATH_VERSION/$FIGNAME.png



FIGORIGINAL=rqa-epsilonsp03w100Horizontal.png 
FIGNAME=sm-fig17
cp ../../figures/rqa/output/epsilons/$FIGORIGINAL $PATH_VERSION
mv $PATH_VERSION/$FIGORIGINAL $PATH_VERSION/$FIGNAME.png
convert $PATH_VERSION/$FIGNAME.png $PATH_VERSION/$FIGNAME.pdf
rm $PATH_VERSION/$FIGNAME.png

FIGORIGINAL=rqa-epsilonsp03w100Vertical.png 
FIGNAME=sm-fig18
cp ../../figures/rqa/output/epsilons/$FIGORIGINAL $PATH_VERSION
mv $PATH_VERSION/$FIGORIGINAL $PATH_VERSION/$FIGNAME.png
convert $PATH_VERSION/$FIGNAME.png $PATH_VERSION/$FIGNAME.pdf
rm $PATH_VERSION/$FIGNAME.png


FIGORIGINAL=rqa-epsilonsp03w250Horizontal.png 
FIGNAME=sm-fig19
cp ../../figures/rqa/output/epsilons/$FIGORIGINAL $PATH_VERSION
mv $PATH_VERSION/$FIGORIGINAL $PATH_VERSION/$FIGNAME.png
convert $PATH_VERSION/$FIGNAME.png $PATH_VERSION/$FIGNAME.pdf
rm $PATH_VERSION/$FIGNAME.png

FIGORIGINAL=rqa-epsilonsp03w250Vertical.png 
FIGNAME=sm-fig20
cp ../../figures/rqa/output/epsilons/$FIGORIGINAL $PATH_VERSION
mv $PATH_VERSION/$FIGORIGINAL $PATH_VERSION/$FIGNAME.png
convert $PATH_VERSION/$FIGNAME.png $PATH_VERSION/$FIGNAME.pdf
rm $PATH_VERSION/$FIGNAME.png


FIGORIGINAL=rqa-epsilonsp03w500Horizontal.png 
FIGNAME=sm-fig21
cp ../../figures/rqa/output/epsilons/$FIGORIGINAL $PATH_VERSION
mv $PATH_VERSION/$FIGORIGINAL $PATH_VERSION/$FIGNAME.png
convert $PATH_VERSION/$FIGNAME.png $PATH_VERSION/$FIGNAME.pdf
rm $PATH_VERSION/$FIGNAME.png

FIGORIGINAL=rqa-epsilonsp03w500Vertical.png 
FIGNAME=sm-fig22
cp ../../figures/rqa/output/epsilons/$FIGORIGINAL $PATH_VERSION
mv $PATH_VERSION/$FIGORIGINAL $PATH_VERSION/$FIGNAME.png
convert $PATH_VERSION/$FIGNAME.png $PATH_VERSION/$FIGNAME.pdf
rm $PATH_VERSION/$FIGNAME.png


FIGORIGINAL=rqa-epsilonsp03w750Horizontal.png 
FIGNAME=sm-fig23
cp ../../figures/rqa/output/epsilons/$FIGORIGINAL $PATH_VERSION
mv $PATH_VERSION/$FIGORIGINAL $PATH_VERSION/$FIGNAME.png
convert $PATH_VERSION/$FIGNAME.png $PATH_VERSION/$FIGNAME.pdf
rm $PATH_VERSION/$FIGNAME.png

FIGORIGINAL=rqa-epsilonsp03w750Vertical.png 
FIGNAME=sm-fig24
cp ../../figures/rqa/output/epsilons/$FIGORIGINAL $PATH_VERSION
mv $PATH_VERSION/$FIGORIGINAL $PATH_VERSION/$FIGNAME.png
convert $PATH_VERSION/$FIGNAME.png $PATH_VERSION/$FIGNAME.pdf
rm $PATH_VERSION/$FIGNAME.png



