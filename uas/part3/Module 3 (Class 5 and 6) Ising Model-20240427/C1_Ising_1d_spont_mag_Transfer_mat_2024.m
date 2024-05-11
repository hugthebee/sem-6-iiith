T=0.5;kb=1;
beta=1/(kb*T); zz=[]; J=2;
for h=-2:0.1:2
M=sinh(beta*h)/(sqrt(sinh(beta*h)^2+exp(-4*beta*J)));
zz=[zz; h,M];
end
plot(zz(:,1),zz(:,2),'or')
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%
T=2;kb=1;
beta=1/(kb*T); zz=[];
for h=-2:0.1:2
M=sinh(beta*h)/(sqrt(sinh(beta*h)^2+exp(-4*beta*J)));
zz=[zz; h,M];
end
plot(zz(:,1),zz(:,2),'b')
grid on;
%%%%%%%%%%%%%%%%%%%%%%%%%%
T=0.1;kb=1;
beta=1/(kb*T); zz=[];
for h=-2:0.1:2
M=sinh(beta*h)/(sqrt(sinh(beta*h)^2+exp(-4*beta*J)));
zz=[zz; h,M];
end
plot(zz(:,1),zz(:,2),'g')
grid on;