import numpy as np
import matplotlib.pyplot as plt

def probability(N, n):
    count = 0
    for i in range(n):
        pos1 = -3
        pos2 = 14

        for j in range(N):
            step = np.random.choice([-1, 1])
            pos1 += step

        for j in range(N):
            step = np.random.choice([-1, 1])
            pos2 += step  
        
        if pos1 == pos2:
            count += 1
    return count / n

N_values = list(range(100, 1001, 50))
print(N_values)
probabilities = [probability(N,1000) for N in N_values]

plt.plot(N_values, probabilities, marker='o', linestyle='-')
plt.title('Probability of Meeting Again')
plt.xlabel('Number of Steps (N)')
plt.ylabel('Probability')
plt.grid(True)
plt.show()
