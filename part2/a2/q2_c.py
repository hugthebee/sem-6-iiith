import numpy as np
import matplotlib.pyplot as plt

def mean(N, n):
    disp = []
    mean_disp = []
    for i in range(n):
        position = 0 # start at origin
        for j in range(N):
            step = np.random.choice([-1, 1])
            position += step
            disp.append(abs(position))

        temp = np.mean(disp)
        mean_disp.append(temp)
    return np.mean(mean_disp) # mean of all the mean displacements for a particular N 

N_values = list(range(1, 101))
mean_displacements = [mean(N, 1000) for N in N_values]

plt.plot(N_values, mean_displacements, marker='o', linestyle='-')
plt.title('Mean Displacement after N Steps')
plt.xlabel('Number of Steps (N)')
plt.ylabel('Mean Displacement')
plt.grid(True)
plt.show()
