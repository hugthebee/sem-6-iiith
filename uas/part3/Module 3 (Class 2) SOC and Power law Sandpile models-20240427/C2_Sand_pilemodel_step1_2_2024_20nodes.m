 % Aimee Ross
% University of Massachusetts Dartmouth
%%BlairGemmer
%function Sand_pilemodel_2
%%%% Chittaranjan Hens BTW model
close all
clear all
figure(1);
zz=[];
% xj=50; %N/2;
% yj=50; %N/2;
% A(xj,yj)= A(xj,yj)+1;
% load custom_color_mat.mat;
% x=CustomColormap;
load custom_color_mat_jet.mat;
x=jet_controlled;

N=20;
A=4*ones(N,N); %% Starting form unstable states
%A=ceil(2*rand(N,N));
for j=1:70
% xj=N/5;
% yj=N/5;
% A(xj,yj)= 7;% A(xj,yj)+1;

%xj=N/2;
%yj=N/2;
%A(xj,yj)= 7;% A(xj,yj)+1;

%%%%% stablization of all nodes which are unstable
A1=A;
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
%zzupd=[zzupd; {A}];
 imagesc(A1)
set(gca, 'YDir','reverse');
% colormap(jet);
colormap(x); 
hold on;
colorbar
pause(0.1)

A2=A;
zz=[zz;j,  mean(mean(A2-A1))];
end
%end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
%%%%%%%%%%%%% Local perturbation starts here %%%


figure(2);
zzp=[];
xj=N/2;
yj=N/2;
A(xj,yj)= 4;% A(xj,yj)+1;

for j=1:40
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
 imagesc(A3)
set(gca, 'YDir','reverse');
% colormap(jet);
colormap(x); 
hold on;
colorbar
pause(1)
hold on;
A4=A;
zzp=[zzp;j, {A4},  mean(mean(A4-A3))];
end


% image((grid+1)*128);
% title(sprintf('2D Ising model with %0.4g by %0.4g lattice',N,N));
% xlabel(sprintf('J=%0.2f, kT = %0.2f, M = %0.3f, E = %0.3f',J,kT,M,E));
% axis square; colormap bone; set(gca,'XTickLabel',[],'YTickLabel',[]);
% drawnow;