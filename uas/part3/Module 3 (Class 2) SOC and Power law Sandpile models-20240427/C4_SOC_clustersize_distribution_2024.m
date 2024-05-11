% Aimee Ross
% University of Massachusetts Dartmouth
%%BlairGemmer
%function Sand_pilemodel_2
%%%% Chittaranjan Hens BTW model
close all
clear all
%figure(1);
zz=[];
% load custom_color_matn.mat;
% x=CustomColormapn;
N=50;
zx=[];
%A=ceil(2*rand(N,N));
zzp=[];
for distu=9:10%12
    distu
    A=[];
A=distu*ones(N,N); %% Starting form unstable states
for j=1:2000
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
if A(xi,yi) >= 4
    
A(xi,yi)= A(xi,yi) - 4;
A(xi+1,yi)=A(xi+1,yi) + 1;
A(xi,yi+1)=A(xi,yi+1) + 1;
A(xi-1,yi)=A(xi-1,yi) + 1;
A(xi,yi-1)=A(xi,yi-1) + 1;
end
end

end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
%%%%%%%%%%%%% Local perturbation starts here %%%
%figure(2);

for m1=1:N
  %  m1
    for n1=1:N
xj=m1;
yj=n1;
A(xj,yj)=4;% A(xj,yj)+1;
for j=1:3000 
%%%%% Propagation and avalanche
% A3=A;
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
if A(xi,yi) >= 4    
A(xi,yi)= A(xi,yi) - 4;
A(xi+1,yi)=A(xi+1,yi) + 1;
A(xi,yi+1)=A(xi,yi+1) + 1;
A(xi-1,yi)=A(xi-1,yi) + 1;
A(xi,yi-1)=A(xi,yi-1) + 1;
zx=[zx; j, xi,yi];
end
end
end
end
%figure;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% p1=cell2mat(zzp(:,4));
% indp=find(abs(p1)>10^-10);
%zx=zx';
if length(zx)>3
    SS=[zx(:,2) zx(:,3)]';
[a b] = unique(SS','rows','first');
xyb = sortrows([a b],3)';
XX = xyb(1,:);
YY = xyb(2,:);
ZZ1=[XX;YY];

ll=length(ZZ1(1,:));
 else 
        ll=1;
end
zzp=[zzp; length(zx), distu, m1,n1,ll];
Q=[];ZZ1=[]; 
zx=[];
a=[];b=[]; ll=[];
    end
end
A=[];Astep2=[];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
bins = exp(log(min(zzp(:,5))+0.0001):0.5:log(max(zzp(:,5))+0.001));
[Lob, Lob2] =histcounts(zzp(:,5),bins);
ds = diff(bins);
sl = (bins(1:end-1)+bins(2:end))*0.5;
nsl = Lob(1:end)./(sum(Lob)*ds);
loglog(sl,nsl,'ok');
hold on;
loglog(sl,0.2*sl.^(-0.98),'-b');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%