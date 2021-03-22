### cp image files, renaame them and convert to pdf in arxiv path
PATH_VERSION=versions/v05

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

