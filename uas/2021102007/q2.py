import numpy as np
import matplotlib.pyplot as plt

def generate_matrix(p_values):
    for p in p_values:
        lattice = np.random.rand(L, L) < p
        labels = np.zeros_like(lattice, dtype=int)
            
        cluster_label = 1

        for i in range(L):
            for j in range(L):
                if lattice[i, j]:
                    #  label clusters 
                    top = labels[i-1, j] if i > 0 else 0
                    left = labels[i, j-1] if j > 0 else 0

                    if top == 0 and left == 0:
                        labels[i, j] = cluster_label
                        cluster_label += 1

                    elif top == 0:
                        labels[i, j] = left

                    elif left == 0:
                        labels[i, j] = top

                    elif top != left:
                        min_label = min(top, left)
                        max_label = max(top, left)
                        labels[labels == max_label] = min_label
                        labels[i, j] = min_label
                    else:
                        labels[i, j] = top

        unique_labels, label_counts = np.unique(labels, return_counts=True)
        label_counts = label_counts[1:]
        largest_cluster_size = label_counts.max()
        largest_cluster_sizes.append(largest_cluster_size)
    
    return largest_cluster_sizes
            

p_critical = 0.5 
p_values = np.linspace(0.2, 0.9, 40)
L_values = [300, 600] 

plt.figure()

for L in L_values:
    largest_cluster_sizes = []
    largest_cluster_sizes = generate_matrix(p_values)
    plt.plot(p_values, largest_cluster_sizes, label=f'{L}x{L}', marker='o')
    
plt.xlabel('Occupation Probability (p)')
plt.ylabel('Size of Largest Cluster')
plt.title('Size of Largest Clusters as a Function of Occupation Probability')
plt.legend()
plt.grid(True)
plt.show()
