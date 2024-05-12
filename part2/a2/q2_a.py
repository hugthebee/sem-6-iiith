import numpy as np
import matplotlib.pyplot as plt

def probability(N, n):
    count = 0

    for i in range(n): # number of simulations
        position = -3 #initial position
        for j in range(N):
            step = np.random.choice([-1, 1])
            position += step

        if position == 0:
            count += 1

    return count / n

N_values = list(range(1, 101))
probabilities = [probability(N, 1000) for N in N_values]

plt.plot(N_values, probabilities, marker='o', linestyle='-')
plt.title('Probability of Returning to Origin')
plt.xlabel('Number of Steps (N)')
plt.ylabel('Probability')
plt.grid(True)
plt.show()



