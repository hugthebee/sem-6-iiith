%%%%%%%%%%  Probability of the large cluster %%%%

clear all
ZZ=[];Q=[];
for L = 50:50:200
    L
%pv = [0.2 0.3 0.4 0.5 0.6 0.7];
%pv = [0.5 0.5  0.65 0.65 0.68 0.68];

% load custom_color_10clusters.mat;
% x=CustomColormap_10clustre;
%z = rand(L,L);
realization=100;
pv=0.4:0.02:1;
for i = 1:length(pv)
     ll=0;
    for j=1:realization
          p = pv(i);
  
    z = rand(L,L);
m = z<p;
[lw,num] = bwlabel(m,4);
x=lw(1:end);
[GC,GR] = groupcounts(x'); 
GC1=GC;
ind= find (GR==0);
GC1(ind)=[];
ll=ll+ max(GC1)/(L^2);
ZZ=[ZZ; L, j, p, max(GC1), max(GC1)/(L^2)];
x=[]; m=[]; GC1=[]; GC=[];
% mat = lw;
% img = label2rgb(lw,'jet','k','shuffle');
% subplot(2,3,i)
% tit=sprintf('p=%0.5g',p);
% image(img); 
    end
    Q=[Q; L,p,ll/realization];
    p=[];
   end
end
%%%
indL=find(ZZ(:,1)==50);
figure; plot(ZZ(indL,3),ZZ(indL,5),'.b');
hold on;
indL1=find(Q(:,1)==50);
plot(Q(indL1,2),Q(indL1,3),'b', 'linewidth',3);
indL=[]; indL1=[];

indL=find(ZZ(:,1)==100);
hold on;  
plot(ZZ(indL,3),ZZ(indL,5),'.k');hold on;
indL1=find(Q(:,1)==100);
plot(Q(indL1,2),Q(indL1,3),'k', 'linewidth',3);
indL=[]; indL1=[];

indL=find(ZZ(:,1)==200);
hold on;  plot(ZZ(indL,3),ZZ(indL,5),'.r');hold on;
indL1=find(Q(:,1)==200);
plot(Q(indL1,2),Q(indL1,3),'r', 'linewidth',3);
indL=[]; indL1=[];

%%% Average Effect 