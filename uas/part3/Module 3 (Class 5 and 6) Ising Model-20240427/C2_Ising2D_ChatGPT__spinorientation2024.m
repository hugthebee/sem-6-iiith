% Parameters
N = 50;         % Number of lattice sites in each direction
J = 1;          % Coupling constant
T = 0.2;        % Temperature
nsteps = 10000; % Number of Monte Carlo steps

% Initialize lattice with random spins (+1 or -1)
spins = sign(randn(N,N));

% Calculate initial energy
energy = -J * sum(sum(spins .* (circshift(spins,[0,1]) + circshift(spins,[0,-1]) + circshift(spins,[1,0]) + circshift(spins,[-1,0]))));
for i=1:4
% Monte Carlo simulation
for step = 1:nsteps
    % Pick a random spin
    i = randi(N);
    j = randi(N);
    
    % Calculate energy change if this spin is flipped
    deltaE = 2 * J * spins(i,j) * (spins(mod(i,N)+1,j) + spins(mod(i-2,N)+1,j) + spins(i,mod(j,N)+1) + spins(i,mod(j-2,N)+1));
    
    % Metropolis algorithm: accept or reject the spin flip
    if deltaE <= 0 || rand < exp(-deltaE / T)
        spins(i,j) = -spins(i,j);
        energy = energy + deltaE;
    end
    
    % Display progress
    if mod(step,100) == 0
        fprintf('Step %d/%d\n', step, nsteps);
    end
end

% Visualize spins
figure;
imagesc(spins);
colormap([1 1 1; 0 0 0]);
axis square;
title('Final Spin Configuration');

end