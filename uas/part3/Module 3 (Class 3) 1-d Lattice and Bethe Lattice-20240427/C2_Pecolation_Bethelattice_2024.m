% Define parameters
close all
clear all
N =100;           % Number of nodes
p = 0.51;            % Probability of site occupancy

% Generate Bethe lattice adjacency matrix
adjacency_matrix = zeros(N);
for i = 2:N
    parent = floor((i-2)/2) + 1;
    adjacency_matrix(i,parent) = 1;
    adjacency_matrix(parent,i) = 1;
end
G=graph(adjacency_matrix);
figure; plot(G);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Randomly occupy sites with probability p
occupancy = rand(1, N) < p;

% Create a new adjacency matrix with occupied sites
adjacency_matrix_new = adjacency_matrix .* (occupancy' * occupancy);

G=graph(adjacency_matrix_new);
figure; plot(G);
% Calculate the size of the largest connected component
%connected_components =conncomp(sparse(adjacency_matrix));
connected_components =conncomp(G);

% Calculate the size of the largest connected component
%%%connected_components = graphconncomp(sparse(adjacency_matrix_new));
component_sizes = histcounts(connected_components, 1:max(connected_components)+1);
largest_component_size = max(component_sizes);

% Display results
disp(['Probability of percolation: ', num2str(largest_component_size / N)]);
disp(['Size of largest connected component: ', num2str(largest_component_size)]);