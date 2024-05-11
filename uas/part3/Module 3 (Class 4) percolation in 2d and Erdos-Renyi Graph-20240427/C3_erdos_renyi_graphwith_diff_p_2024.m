 %%https://www.cs.purdue.edu/homes/dgleich/demos/erdos_renyi/generate.html
%%
% addpath('C:\Users\hp\Desktop\chittapaper\Klaus _Project\VVI\eeg data\code');
% hold on;
addpath('C:\Users\chitt\OneDrive\Desktop\Chitta_Folder\chittapaper\Klaus _Project\VVI\eeg data\code');
hold on;
n = 20;
GG11 = rand(n,n);
%Q=log(n)/n;
%p = Q+0.001;
i1=1;
for p=[0.05 0.09 0.1 0.12 0.16 0.3]/2%0.0001:0.0001:1;
%%%%
%rand('seed',100); % reseed so you get a similar picture
%GG11 = rand(n,n);
GG1=GG11< p;
GG = triu(GG1,1);
G = GG + GG';
%%%%
 G1=graph(G);
 subplot(3,2,i1); plot(G1);
 p1=plot(G1,'MarkerSize',10);
p1.NodeFontSize=0.3;
p1.NodeFontWeight='b';
 p1.EdgeColor='k';
 p1.LineWidth=3;
 avg_deg=sum(sum(G))/n;
 %str = sprintf('p=%d\t, avg_degree=%d' p,avg_deg);
str =sprintf('p=%2f\n avg_{degree}=%2f',p,avg_deg);
title(str)
%title(' p= %d \t avg_degree=%d\t', p,avg_deg);
  %layout(p,'force3')%,'UseGravity',true)
    layout(p1,'circle')%,'UseGravity',true)
 % p.XData= C1;% 5*p.XData+35*rand(1,length(p.YData));
 % p.YData=  C2;%5*p.YData+35*rand(1,length(p.YData));
 i1=i1+1;
end

thres_giant = 1/(n-1);
%%%%%
%%
% sum_deg=sum(Degree)/n;
% sum_degth=n*p
% std_degth=sqrt(n*p*(1-p))
% std(Degree)

