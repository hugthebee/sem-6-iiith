% the number of nodes and the probability of attachment, n, p

 NN=[10 20 200 500 ]; %network size
 p=0.1; zz=[];
 figure();
 for ii=1:length(NN)
     N=NN(ii);
adj=zeros(N,N);
for i=1:N
            for j=i+1:N
                if rand<=p; adj(i,j)=1; adj(j,i)=1; end
            end
end
deg=sum(adj);
edges = 0.0:2:max(deg);
zz=[zz;N,p, mean(deg), std(deg), N*p, N*p*(1-p)];
%
G=graph(adj);

subplot(2,2,ii); plot(G) 
axis tight;%%% Linear
 set(findall(gcf,'-property','FontSize'),'FontName','Cambria',...
      'FontSize',24,'linewidth',2.0,'fontweight','b') ;
% set(gca, "Xscale", "log")
% set(gca, "YScale", "log")
% xlabel('k');
% ylabel('P(k)');
% title('linbin,N',N);
N=[]; deg=[];
end