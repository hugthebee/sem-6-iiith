%%https://www.cs.purdue.edu/homes/dgleich/demos/erdos_renyi/generate.html
%%
addpath('C:\Users\chitt\OneDrive\Desktop\Chitta_Folder\chittapaper\Klaus _Project\VVI\eeg data\code');

%addpath('C:\Users\chitt\OneDrive\Desktop\Chitta_Folder\IIIThyd\Course\IIIIT_Course\Network_Dynamics_course\Course_Module Wise\code');
hold on;
for i=1:3
n = 1000;
% C1=rand(1,10)*10;
% C2=rand(1,10)*10;
%Q=log(n)/n;
%p = Q+0.001;
i1=1; ZZ=[];
for p=[10^-5 0.00001 0.00005 0.00008 0.00009 0.0001 0.00015 0.00018 0.0002 0.00025 0.00028 0.0003 0.0004 0.0005 0.0008 0.0009 0.00092 0.001 0.002 0.003 0.005 0.008 0.009 0.01 0.05 0.1]%0.0001:0.0001:1;
%for p=(1:2:n*0.001)/n %0.0001:0.0001:1;
%for p=[0.0.001 0.002 0.05 0.09 0.12 0.25 0.5 1]
    %%%%
%rand('seed',100); % reseed so you get a similar picture
GG11 = rand(n,n);
GG1=GG11< p;
GG = triu(GG1,1);
G = GG + GG';
%%%%
 [GC,gc_nodes]=giant_component(G);
%  cx=[];
% for S=-0.01:0.0013:0.99
%     y1=S;
%     y2=1-exp(-n*p*S);
% cx=[cx;S,abs(y1-y2)];
% end

% ind=find(cx(:,2)<0.01);
% ll=cx(ind,1);
% if isempty(ll)
%     ll = 0;
%   end
%ZZ=[ZZ; p, n*p,  length(GC)/n, ll(1) ];
ZZ=[ZZ; p, n*p,  length(GC)/n ];
 i1=i1+1;
 ind=[];
 G1=[];
end
%%
%figure(1)

semilogx(ZZ(1:end,2),ZZ(1:end,3),'-o','linewidth',2);
 hold on;
% plot(ZZ(1:17,2),ZZ(1:17,4),'-','linewidth',3);
%axis tight;%%% Linear

xlabel('c=np');
ylabel('GCC-relativesize')

set(findall(gcf,'-property','FontSize'),'FontName','Cambria',...
      'FontSize',24,'linewidth',2.0,'fontweight','b') ;
set(gca, 'xScale', 'log');
box on
end
%thres_giant = 1/(n-1);
%%%%%
%%
% sum_deg=sum(Degree)/n;
% sum_degth=n*p
% std_degth=sqrt(n*p*(1-p))
% std(Degree)

