% Aimee Ross
% University of Massachusetts Dartmouth
%%BlairGemmer
%function Sand_pilemodel_2
%%%% Chittaranjan Hens BTW model
close all
clear all
zz=[];
% xj=50; %N/2;
% yj=50; %N/2;
% A(xj,yj)= A(xj,yj)+1;
load custom_color_mat_jet.mat;
x=jet_controlled;


%%
%%%%%%%%%%%%% Local perturbation starts here %%%
%%
N=7;
A=zeros(N,N);
A(2,[2 4 6])=3;
A(2,5)=2;

A(2+1,[1 4]+1)=1;
A(2+1,2+1)=2;
A(2+1,3+1)=3;

A(3+1,[2 3 5]+1)=3;
A(3+1,4+1)=1;
A(3+1,1+1)=2;

A(4+1,1+1)=3;
A(4+1,2+1)=1;
A(4+1,4+1)=2;

A(5+1,[3 5]+1)=1;
A(5+1,2+1)=2;
A(5+1,4+1)=3;

%%
%figure(2);
zzp=[];
xj=4;%N/2;
yj=4;%N/2;
A(xj,yj)= 4;% A(xj,yj)+1;

for j=1:4
% xj=N/5;
% yj=N/5;
% A(xj,yj)= 7;% A(xj,yj)+1;

% xj=N/2;
% yj=N/2;
% A(xj,yj)= 7;% A(xj,yj)+1;

%%%%% Propagation and avalanche
A3=A;
for xi=2:N-1
for yi=2:N-1
    %%% Boundary Condition %%
     A(1,xi)=0;
     A(1,N)=0;
     A(N,1)=0;
     A(1,1)=0;
      A(N,N)=0;
     A(1,xi)=0;
      A(yi,1)=0;
       A(N,xi)=0;
        A(yi,N)=0;
      %%%%%%%%%%%%%%%%%%%%%%%%
if A(xi,yi) >= 4;
    
A(xi,yi)= A(xi,yi) - 4;
A(xi+1,yi)=A(xi+1,yi) + 1;
A(xi,yi+1)=A(xi,yi+1) + 1;
A(xi-1,yi)=A(xi-1,yi) + 1;
A(xi,yi-1)=A(xi,yi-1) + 1;
end
end
end
%%
%zzupd=[zzupd; {A}];
figure;
imagesc(A3);
set(gca, 'YDir','reverse');
% colormap(jet);
colormap(x); 
% hold on;
colorbar
%pause(10)

hold on;
%%
A4=A;
zzp=[zzp;j, {A4},  mean(mean(A4-A3))];
end


% image((grid+1)*128);
% title(sprintf('2D Ising model with %0.4g by %0.4g lattice',N,N));
% xlabel(sprintf('J=%0.2f, kT = %0.2f, M = %0.3f, E = %0.3f',J,kT,M,E));
% axis square; colormap bone; set(gca,'XTickLabel',[],'YTickLabel',[]);
% drawnow;