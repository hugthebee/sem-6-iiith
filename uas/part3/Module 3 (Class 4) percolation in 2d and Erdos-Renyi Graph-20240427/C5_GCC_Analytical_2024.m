% S=0:0.01:1;
% for lambda=0.5:0.5:2.5;
% y=S;
% X=1-exp(-lambda*S);
% plot(S,y,'r','LineWidth',3); hold on
% plot(S,X,'b','LineWidth',3);
% xlabel('S');
% ylabel('S,1-e^{-cs}');
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure; 
 m=0.0:0.01:1;
for p=0.3:0.2:1;
plot(m,m.^2+0.5); %%%% Seq Chain
ylim([0 1]);
hold on;
end 


figure; 
m=0.0:0.01:1;
for p=0.0:0.2:1;

F_star=m.^2+(2*m.*(1-m)).*((1+p)/2)+ (1-m).^2*((1+p^2)/2);
plot(m,F_star); %%%% Seq star
ylim([0 1])
F_star=[];
hold on;
end