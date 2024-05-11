
%%%http://www.physics.usyd.edu.au/~sflammia/Courses/StatMech2020/advanced/4/a4.html
% Choose kT, N (linear lattice size), and J (strength of the coupling)
clear all
%2/log(1+sqrt(2));
N =16;
J = 1; % change sign for antiferromagnetic coupling
 zzr=[];
% kB = 1;
% T = 8; % Temperature
% beta = 1/( kB*T );
zz=[];
% Generate a random initial configuration. 
% Comment out to keep sampling with the previous configuration.
%p=.4; % average proportion of initial +1 spins
%grid = sign(p-rand(N)); % random initial configuration
% clear all
% Run the Wolff or Metropolis algorithm and return a matrix of spin values.
t =100*N^2;% choose t update steps (use big multiple of N^2 for Metropolis)
%grid = metropolis(N,kT,J,t,grid);
%%
for ii=1:10
    ii
adj = neighbors(1:N^2,N);
%  grid = sign(randn(N,N));
  p=.5; % average proportion of initial +1 spins
grid = sign(p-rand(N));
for T = 1.57:0.1:5;
 % grid=grido;
  %   T = 0:0.1:4;
    %% continuos orocess, adaptive ic
kT =  1*T;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% precompute the indicies adjacent to each spin index
% Pick a sequence of random spins (with a linear index)
%spin = randi(N^2,t,1);
%%
% Evolve the system for a fixed number of steps
for i=1:t
    s=randi(N^2);
    % location of ith spin
   % s = spin(i);
    % Calculate the change in energy of flipping s
    dE = 2*J*grid(s)*sum(grid(adj(s,:)));
    % Calculate the transition probability
    p = exp(-dE/kT);
    % Decide if a transition will occur
    if dE<=0 || rand <= p, 
        grid(s) = -1*grid(s); 
    end

 %if deltaE <= 0 || rand < exp(-deltaE / T)
  %          spins(i,j) = -spins(i,j);
   %     end

    % Refresh display of current spin configuration every N^2 trials
%     if mod(i,N^2)==0,
%         % Sum up our variables of interest and plot
%         M = sum(sum(grid))/numel(grid);
%      %   E = isingenergy(grid,J);
%     %  isingplot(grid,N,J,kT,M,E);
%      % 
%     end
%     E = isingenergy(grid,J);
%     isingplot(grid,N,J,kT,M,E);
% M1 = sum(sum(grid))/numel(grid);
% zzr=[zzr;i,M1];
end
% M = abs(sum(sum(grid))/numel(grid));
 % magnetization(idx) 
 M= abs(sum(sum(grid)))/ (N*N);
%  grid=[];
% E= -sum(sum(dE))/2; 
E = isingenergy(grid,J);
 %C=std(E); Heat capacity
%x(1:length(grid))=T;
% plot(T,(M),'-o')
 %   hold on;
 zz=[zz; ii, T, M,E];
    M=[];
end

end
%end
%%
plot(zz(:,2),zz(:,3),'o', 'markersize', 6)
hold on
%plot(zz(:,2),zz(:,4),'x', 'markersize', 6)
% TT=unique(zz(:,2));
% DD=[];
% for l=1:length(TT);
%     p1=TT(l);
%     ind=find(zz(:,2)==p1);
%     std_E=var(zz(ind,4));
%     DD=[DD;p1,std_E/T];
% end
%save zz_64node_4april_ising.mat zz;
%figure ; plot( DD(:,1), DD(:,2),'-x', 'markersize', 6)