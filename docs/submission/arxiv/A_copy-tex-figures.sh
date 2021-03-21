## copy tex file
mkdir -p versions/v05
cp ../../manuscript/main.tex versions/v05
cp ../../manuscript/jabbrv* versions/v05
cp ../../manuscript/naturemag-doi.bst versions/v05
cp ../../manuscript/wlscirep.cls versions/v05


### cp image files to arxiv path
cp ../../figures/fig01/versions/drawing-v01.png versions/v05
mv versions/v05/drawing-v01.png versions/v05/fig01.png

cp ../../figures/fig02/versions/drawing-v01.png versions/v05
mv versions/v05/drawing-v01.png versions/v05/fig02.png

cp ../../figures/caoami/pdf/fig2.pdf versions/v05
mv versions/v05/fig2.pdf versions/v05/fig03.pdf

cp ../../figures/rss/versions/drawing-v01.png versions/v05
mv versions/v05/drawing-v01.png versions/v05/fig04.png

cp ../../figures/fig05/versions/drawing-v01.png versions/v05
mv versions/v05/drawing-v01.png versions/v05/fig05.png

cp ../../figures/fig06/versions/drawing-v00.png versions/v05
mv versions/v05/drawing-v00.png versions/v05/fig06.png

cp ../../figures/rqa/output/rqa-participants.pdf versions/v05
mv versions/v05/rqa-participants.pdf versions/v05/fig07.pdf

cp ../../figures/rqa/output/rqa-windows.pdf versions/v05
mv versions/v05/rqa-windows.pdf versions/v05/fig08.pdf

