L = 100;
%pv = [0.2 0.3 0.4 0.5 0.6 0.7];
pv = [ 0.4 0.4 0.5 0.5  0.55 0.55 0.62 0.62];
% load custom_color_10clusters.mat;
% x=CustomColormap_10clustre;
%clear al
load custom_color_10clusters.mat;
x=CustomColormap_10clustre;
%z = rand(L,L);
for i = 1:length(pv)
    z = rand(L,L);
p = pv(i);
m = z<p;
[lw,num] = bwlabel(m,4);
mat = lw;
img = label2rgb(lw,'jet','k','shuffle');
subplot(3,3,i)
tit=sprintf('p=%0.5g',p);

imagesc(img); 
%hold on;
 % colormap(x); 
 % colorbar
 % hold on;
% % 
%   colormap(x); 
%   colorbar
% % hold on;
% % A2=A;
% % exportgraphics(gcf,'sand_piles_BTW_step1animation.gif','Append',true);
 clim([0 10])

axis square;
title(tit);
axis off
end