%%%%%%%%%%  Probability of the large cluster %%%%
%%
clear all
zx=[];Q=[];pc=0.592746;
for L =100%:400:500% 400:-50:100
    L
    % L=L/4;
realization=100;
pv=0.4:0.002:0.8;
zz1=[];
for i = 1:length(pv)
    i
     ll=0;
    for j=1:realization
          p = pv(i);
 
    z = rand(L,L);
m = z<p;
[lw,numC] = bwlabel(m,4);
x=lw(1:end);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % number of occupied sites in each cluster   
%    nC = zeros(numC,1);  
%    for c = 1 : numC %%% numC is number of clusters
%      nC(c) = length(lw(lw == c));  
%    end
% % s   counter from 1 to max number of occupied sites in a cluster  
%     s = 1:max(nC);
% % nS  cluster size distribution 
%     nS = zeros(max(nC),1);
%   for c = s
%    nS(c) = length(nC(nC == c));
%   end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


[GC,GR] = groupcounts(x');



GC1=GC;
ind= find (GR==0);
GC1(ind)=[];
%zz=[zz;GC1];

%if x(1)~=0
zz1=[zz1; L, j,  p, x(1), {GC1}];
%end

x=[];  GC1=[]; GC=[];m=[]; z=[];
end

    %%
   zz=cell2mat(zz1(:,5));
%   bins = 10.^(0.001:0.2:6);
bins = exp(log(min(zz(:,1))+0.0001):0.6:log(max(zz(:,1))+0.001));
% [Lob, bins] =histcounts(zz(:,5),20);
%   ds = diff(bins);
%   sl = (bins(1:end-1)+bins(2:end))*0.5;
% % ws=(Lob.*sl)./(sum(Lob.*sl));
% % S=sum(ws.*sl);
% ns=Lob./(L^2 *ds(1));
% 
% %bins = 10.^(0.001:0.2:6);
% mean(zz)
% std(zz)
 [Lob, Lob2] =histcounts(zz(:,1),bins);
% %[Loblin, Lob2lin] =hist(zz(:,1),10000);
 ds = diff(bins);
 sl = (bins(1:end-1)+bins(2:end))*0.5;
% %nsl = Lob(1:end)./(j*L^2*ds);
% 
 nsl = Lob(1:end)./(sum(Lob)*ds);
% 
% loglog(sl,nsl,'ok');
%  hold on;
% 
% 
% 

 S1=sl.*nsl;
 S=(sum(S1.*sl))/sum(S1);
%  sum(S1)
%  sum(S1.*sl)
 Lob=[]; Lob2=[];ds=[]; S1=[];sl=[];
% 
 if p>pc
     ll=(p-pc).^(-43/18);
 else ll=0;
 end
 zx=[zx; L, p, S, ll]; 
   zz1=[];zz=[];
  p=[];
   S=[];nsl=[]; bins=[];
   end
end

%%%save zx_100_500_900_1pt3kn.mat zx;
%%
figure;
indL=find(zx(:,1)==1300);
%plot(zx(indL,2),zx(indL,4)/(L^2),'-');
hold on;
plot(zx(indL,2),zx(indL,3),'-b')

indL=find(zx(:,1)==900);
% plot(zx(indL,2),zx(indL,4)/(L^2),'-');
% hold on;
plot(zx(indL,2),zx(indL,3),'dr')


indL=find(zx(:,1)==500);
plot(zx(indL,2),zx(indL,3),'gs')

indL=find(zx(:,1)==150);
plot(zx(indL,2),zx(indL,3),'rd')

indL=find(zx(:,1)==100);
plot(zx(indL,2),zx(indL,3),'ko')
% 
%%
%  indL=find(ZZ(:,1)==1000);
% % hold on;  plot(ZZ(indL,3),ZZ(indL,5),'.b');hold on;
% % indL1=find(Q(:,1)==500);
% % %plot(Q(indL1,2),Q(indL1,3),'r', 'linewidth',3);
% % %indL=[]; indL1=[];

%%
% % figure;
% % plot(ZZ(indL,3),ZZ(indL,5),'.b');hold on;
% % plot((Q(:,2)),Q(:,3),'-o');
% % hold on;
% % plot(Q(:,2),Q(:,5),'k');
% % %% Average Effect 