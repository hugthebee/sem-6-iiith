% Define parameters
%close all
clear all
% Parameters
zz=[];
for j=1:100
    lattice_size = 10002; %% Size of the lattice 
    %%% two more added for claculating cluster size
    % Generate the lattice
%     lattice = rand(lattice_size, 1) < 1;
%     figure;
%     plot(1:lattice_size, lattice, '-o', 'MarkerSize', 10)
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    p = 0.7; % Probability of each site being occupied
    % Generate the lattice
    lattice = rand(lattice_size, 1) < p;
      lattice(1) =0;
        lattice(end) =0;
    % Visualize the lattice
%     figure;
%     plot(1:lattice_size, lattice, 'bo', 'MarkerSize', 10);
%     xlabel('Site Index');
%     ylabel('Occupation');
%     title('1D Percolation');
    %%%%%%%%%%% Cluster size    %%%%%%%%%%%%%%
    j1=find(lattice==0);
    cluster_size_distr=diff(j1)-1;
     cluster_size_distr(cluster_size_distr==0)=[];
zz=[zz;   cluster_size_distr];
  cluster_size_distr=[]; lattice=[];
end
%hold on;
%%
bins = exp(log(min(zz(:,1))+0.0001):0.05:log(max(zz(:,1))+0.001));
[Lob, Lob2] =histcounts(zz(:,1),bins);
ds = diff(bins);
sl = (bins(1:end-1)+bins(2:end))*0.5;
nsl = Lob(1:end)./(sum(Lob)*ds);
loglog(sl,nsl,'or');
hold on;
loglog(sl,((1-p)^2).*exp(-sl.*(1-p)),'-r');
% loglog(sl,0.2*sl.^(-0.98),'-b');
 hold on;
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     % Check for percolation
%     connected = check_percolation(lattice);
% 
%     if connected
%         disp('Percolation occurred!');
%     else
%         disp('No percolation.');
%     end
% 
% %end

% function connected = check_percolation(lattice)
%     % Check for percolation
%     left_end = 1;
%     right_end = length(lattice);
%     
%     % If either end is occupied, there's percolation
%     connected = lattice(left_end) || lattice(right_end);
% end