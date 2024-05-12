import numpy as np
from scipy.stats import norm

# Parameters
p = 0.25
n = 1000
sim = 10000

dis = np.random.binomial(n, p, sim)
probability = np.sum(dis >= 240)
probability /= sim

print("Probability of observing at least 240 A's:", probability)

# Calculate mean and variance of binomial distribution
mean = n * p
variance = n * p * (1 - p)
phi = (240 - mean) / np.sqrt(variance)
print(phi)
normal_approx = 1 - norm.cdf(phi)

print("Normal approximation:", normal_approx)
