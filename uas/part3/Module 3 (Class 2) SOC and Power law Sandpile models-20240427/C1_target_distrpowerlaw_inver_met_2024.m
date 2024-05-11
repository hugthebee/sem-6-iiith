 clear all;
% % %  %%%another choice %%%
%   A=106; C=1283; M=6075; I(1)=1;  rng_c=[]; 
%   iter=200000;
% I=zeros(1,iter);
 %k=2;
% for j=1:iter;
%     I(j+1)=mod((A*I(j)+C),M);
%     rng_c=[I; I/M];
% end

%rng_c=rand(1,iter);

%%% Poissonian Distribution %%
%y_poi=-(1/k)*(log(1-rng_c(2,:)));
% y_poi=-(1/k)*(log(1-rng_c(1,:))); %%FROM MATLAB rand rng_c=rand(1,iter);
% [a b]=hist(y_poi);
% figure; histogram(y_poi);
% figure;
% plot(b,a/iter,'-o'); hold on;
% %h =histogram(y_poi);
%  plot(b,k*exp(-b*k));
% set(gca,'YScale','log');



%%%%%%%%%Pareto Dsitribution %%%%%%
for alpha=3.5%:-0.5:1.5
for i=1%:-1:1
  iter=1000000*i; 
 p=1;
  rng_c=0.0+rand(1,iter)-0.000001; %avoid tan (pi/2)
% % %%%%
% %rng_c=rand(1,iter);
%y_cauchy=(tan(rng_c(1,:)*pi))*gamma;
xmin=2;
k_powerlaw=xmin*(1-(rng_c(1,:))).^(-1/(alpha-1));
%k_powerlawint=ceil(k_powerlaw);
%rng_c=rand(1,iter);
% %%
% % figure; 
 [a b]=hist(k_powerlaw,500);
  %[a b]=hist(k_powerlawint,5000);
zz=diff(b);
%plot(b,a/(sum(a)*zz(1)),'-o'); hold on;
%figure;
loglog(b,a/(sum(a)*zz(1)),'ob'); hold on;
 x=min(b):zz(1):max(b);
%loglog(x,p*x.^(-(gamma+1)),'r', 'linewidth',3);
% hold on;
%   set(findall(gcf,'-property','FontSize'),'FontName','Cambria',...
%        'FontSize',24,'linewidth',2.0,'fontweight','b');
%   xlabel('$x$');
%    xlabel('$P(x)$');
%  grid on;
%%
%figure;
%zz=k_powerlawint';
zz=k_powerlaw';
bins = exp(log(min(zz(:,1))-0.001):0.4:log(max(zz(:,1))+0.001));
 [Lob, Lob2] =histcounts(zz(:,1),bins);
% %[Loblin, Lob2lin] =hist(zz(:,1),10000);
 ds = diff(bins);
 sl = (bins(1:end-1)+bins(2:end))*0.5;
  nsl = Lob(1:end)./(sum(Lob)*ds);
loglog(sl,nsl,'.','MarkerSize',20);
hold on;
loglog(sl,p*1.5*sl.^(-(alpha)),'-r', 'linewidth',3);

  set(findall(gcf,'-property','FontSize'),'FontName','Cambria',...
       'FontSize',24,'linewidth',2.0,'fontweight','b');
   xlabel('$x$');
   ylabel('$P(x)$');
   hold on;
  %grid on;
k_powerlawint=[];
end
end
%set(gca,'YScale','log');
