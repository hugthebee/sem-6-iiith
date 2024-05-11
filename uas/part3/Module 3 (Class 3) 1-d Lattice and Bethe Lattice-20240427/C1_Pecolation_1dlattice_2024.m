% Define parameters
close all
clear all
% Parameters
    lattice_size = 12; %% Size of the lattice 
    %%% two more added for claculating cluster size
    % Generate the lattice
    lattice = rand(lattice_size, 1) < 1;
    figure;
    plot(1:lattice_size, lattice, '-o', 'MarkerSize', 10)
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    p = 0.7; % Probability of each site being occupied
    % Generate the lattice
    lattice = rand(lattice_size, 1) < p;
      lattice(1) =0;
        lattice(end) =0;
    % Visualize the lattice
    figure;
    plot(1:lattice_size, lattice, 'bo', 'MarkerSize', 10);
    xlabel('Site Index');
    ylabel('Occupation');
    title('1D Percolation');
    %%%%%%%%%%% Cluster size    %%%%%%%%%%%%%%
    j1=find(lattice==0);
    clustre_size_distr=diff(j1)-1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Check for percolation
    connected = check_percolation(lattice);

    if connected
        disp('Percolation occurred!');
    else
        disp('No percolation.');
    end

%end

function connected = check_percolation(lattice)
    % Check for percolation
    left_end = 1;
    right_end = length(lattice);
    
    % If either end is occupied, there's percolation
    connected = lattice(left_end) || lattice(right_end);
end