import numpy as np
import matplotlib.pyplot as plt
from scipy import stats  # Add this line for scipy.stats

def percolation(n, p):
    # Create an empty lattice
    lattice = np.zeros((n, n))

    for i in range(n):
        for j in range(n):
            if np.random.random() <= p:
                lattice[i, j] = 1

    def dfs(i, j):
        stack = [(i, j)]
        cluster = []
        while stack:
            x, y = stack.pop()
            if lattice[x, y] == 1:
                cluster.append((x, y))
                lattice[x, y] = 0  # Mark as visited
                for dx, dy in [(1, 0), (-1, 0), (0, 1), (0, -1)]:
                    nx, ny = x + dx, y + dy
                    if 0 <= nx < n and 0 <= ny < n:
                        stack.append((nx, ny))
        return cluster

    clusters = []
    for i in range(n):
        for j in range(n):
            if lattice[i, j] == 1:
                cluster = dfs(i, j)
                clusters.append(len(cluster))

    return clusters

# Parameters
Lsize = 300
pc = 0.5

# Probabilities to simulate
probabilities = [pc, 0.3, 0.4, 0.7]

# Plot
plt.figure()
for p in probabilities:
    clusters = percolation(Lsize, p)
    unique_sizes, counts = np.unique(clusters, return_counts=True)
    plt.scatter(unique_sizes, counts, label=f'p={p}', alpha=0.5)

    if p == pc:#unique_sizes, counts, bin_count=20
        bin_count = 20
        bins = np.logspace(np.log10(min(unique_sizes)), np.log10(max(unique_sizes)), bin_count)
        bin_means, bin_edges, _ = stats.binned_statistic(unique_sizes, counts, bins=bins, statistic='mean')
        bin_centers = (bin_edges[1:] + bin_edges[:-1]) / 2
        plt.plot(bin_centers, bin_means, linestyle='-', marker='o', markersize=5, label='Log Binned', alpha=0.8)

plt.xscale('log')
plt.yscale('log')
plt.xlabel('Cluster Size')
plt.ylabel('Frequency')
plt.title('Cluster Size Distribution')
plt.legend()
plt.grid(True)
plt.show()
