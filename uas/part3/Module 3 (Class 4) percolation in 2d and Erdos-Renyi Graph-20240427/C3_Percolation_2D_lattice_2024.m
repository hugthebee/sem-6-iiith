% p = 0.25;
% z = rand(4,4);
% m = z<p;
% imagesc(m);
clear al
load custom_color_10clusters.mat;
x=CustomColormap_10clustre;


L = 10;
p = 0.5;
z = rand(L,L);
m = z<p;
imagesc(m);



[lw,num] = bwlabel(m,4);
%img=
figure;
imagesc(lw);
%img = label2rgb(lw,'jet','k','shuffle');
tit=sprintf('p=%0.5g',p); %image(img);
  colormap(x); 
  colorbar
% % hold on;
% % A2=A;
% % exportgraphics(gcf,'sand_piles_BTW_step1animation.gif','Append',true);
% clim([0 9])

axis square;
title(tit);
%axis off


x=lw(1:end);
[GC,GR] = groupcounts(x'); 
GC1=GC;
ind= find (GR==0);
GC1(ind)=[];
