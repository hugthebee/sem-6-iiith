%%%%%%%%%%  Probability of the large cluster %%%%

clear all
ZZ=[];Q=[];
for L = [ 50 100]% 512];% 50:50:200
    L
%pv = [0.2 0.3 0.4 0.5 0.6 0.7];
%pv = [0.5 0.5  0.65 0.65 0.68 0.68];

% load custom_color_10clusters.mat;
% x=CustomColormap_10clustre;
%z = rand(L,L);

realization=20;
pv=0.5:0.001:0.64;
for i = 1:length(pv)
    i
     ll=0;
    for j=1:realization
          p = pv(i);
     z = rand(L,L);
 
m = z<=p;
[lw,num] = bwlabel(m,4);
x=lw(1:end);
[GC,GR] = groupcounts(x'); 
GC1=GC;
ind= find (GR==0);
GC1(ind)=[];
ll=ll+ (max(GC1)/(L^2));
ZZ=[ZZ; L, j, p, max(GC1), max(GC1)/(L^2)];
x=[]; m=[]; GC1=[]; GC=[];z=[];
% mat = lw;
% img = label2rgb(lw,'jet','k','shuffle');
% subplot(2,3,i)
% tit=sprintf('p=%0.5g',p);
% image(img); 
    end
    Q=[Q; L,p,ll/realization];
    p=[]; ll=0;
   end
end
%%%
%%
indL=find(ZZ(:,1)==50);
figure; plot(ZZ(indL,3),ZZ(indL,5),'.b');
hold on;
indL1=find(Q(:,1)==100);
plot(Q(indL1,2),Q(indL1,3),'b', 'linewidth',3);
indL=[]; indL1=[];
%%
indL=find(ZZ(:,1)==256);
hold on;  
plot(ZZ(indL,3),ZZ(indL,5),'.k');hold on;
indL1=find(Q(:,1)==256);
plot(Q(indL1,2),Q(indL1,3),'r', 'linewidth',3);
indL=[]; indL1=[];
%%
hold on;
indL=find(ZZ(:,1)==2000);
hold on;  plot(ZZ(indL,3),ZZ(indL,5),'.r');hold on;
indL1=find(Q(:,1)==2000);
plot(Q(indL1,2),Q(indL1,3),'b', 'linewidth',3);
indL=[]; indL1=[];


%  save ZZ_L2000_R20_GCC.mat ZZ;
%   save Q_2000_20R_GCCmean.mat Q;
%%% Average Effect 