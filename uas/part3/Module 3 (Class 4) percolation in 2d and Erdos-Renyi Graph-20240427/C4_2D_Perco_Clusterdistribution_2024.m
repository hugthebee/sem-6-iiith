%%%%%%%%%% Cluster distribution %%%%
ZZ=[];zz=[];
for L =100
    L

%pv=0.55:-0.05:0.45;%0.4:0.02:1;
pv=0.6;%0.59274;
reali=500;
for i = 1:length(pv)
for j=1:reali
    %  j
z=[];
    z = rand(L,L);
p = pv(i);
m = z<p;
[lw,num] = bwlabel(m,4);
x=lw(1:end);
[GC,GR] = groupcounts(x'); 
GC1=GC;
ind= find (GR==0);
GC1(ind)=[];
zz=[zz;GC1];

%ZZ=[ZZ; L, j, p,{}];
x=[]; p=[];m=[]; GC1=[]; GC=[];
end
%%
% % %%%%%%% Sub critical %%%%%%
% [a b]=hist(zz(:,1),20);
% semilogy(b,(a)/sum(a),'.','MarkerSize',18);
% hold on;
% xlabel('$S$','Interpreter','LaTeX','FontSize',30);
% ylabel('$n_S$','Interpreter','LaTeX','FontSize',30);
%  title('Cluster distribution (subcritical: $p<p_c$)');
% set(gcf, 'PaperPositionMode', 'auto','position', [0, 0, 700, 700]);
% set(legend,'color','none');
% set(legend, 'Box', 'on');
% hold on;  
% %  
%    xlim([-40 4000])
%    ylim([ 10^-6 2])
% %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
% %%%%%%%%  Critical %%%%%%%%%
%%%%^^^^log binning^^^^%%%%%
bins = 10.^(0.001:0.2:6);
[Lob, Lob2] =histcounts(zz(:,1),bins);
[Loblin, Lob2lin] =hist(zz(:,1),10000);
ds = diff(bins);
sl = (bins(1:end-1)+bins(2:end))*0.5;
%nsl = Lob(1:end)./(j*L^2*ds);

nsl = Lob(1:end)./(sum(Lob)*ds);
%%
loglog(sl,nsl,'ok');
hold on;
  loglog(Lob2lin(1:end),Loblin(1:end)/sum(Loblin),'g.','MarkerSize',20); %%% Linear binning
%%
  %%%%%^^^^^^^^^^^^^^^^^%%%%%%%
%[a b]=hist(zz(:,1),20);
% semilogx(b,(a)/sum(a),'.');
% hold on;
%loglog(b,b.^(-181/97),'.');
hold on;
%  loglog(Lob2(1:end-1),Lob(1:end)/sum(Lob),'g.','MarkerSize',30);
%loglog(Lob2(1:end-1),Lob(1:end)/sum(Lob),'g.','MarkerSize',30);
%  hold on;
  set(findall(gcf,'-property','FontSize'),'FontName','Cambria',...
       'FontSize',24,'linewidth',2.0,'fontweight','b');
  grid on;
 tau=187/91; 
% %tau=2.2;
% %  hold on;
    loglog(sl,5*sl.^(-tau),'-','linewidth',3);
%     hold on;
%   loglog(Lob2(1:end),10^7*Lob2(1:end).^(-1.0),'-','linewidth',3);
a=[]; b=[]; zz=[];
end
end




