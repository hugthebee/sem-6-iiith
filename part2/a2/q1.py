import numpy as np
import matplotlib.pyplot as plt

samples = [10, 100, 1000, 10000]

#PART A
# Calculate integration value for different sample sizes
a = -3
b = 3
result = []
print("PART A:\n")
for N in samples:
    # random values uniformly distributed between a and b
    x_values = np.random.uniform(a, b, N)
    
    y_values = np.exp(x_values) 
    
    # Monte Carlo
    MC = np.mean(y_values) * (b - a)
    result.append(MC)

    # Print the results
    print(f"N = {N}   MC estimate = {MC:.3f}")

true_value = np.exp(b) - np.exp(a)
# Plotting
plt.figure()
plt.plot(samples, result, marker='o')
plt.xscale('log')
plt.axhline(y=true_value, color='r', linestyle='--', label='True Integral')
plt.xlabel('Number of Samples')
plt.ylabel('Integration Value')
plt.title('Monte Carlo Integration of (a) e^x')
plt.legend()
plt.grid(True)
plt.show()


#part b
print("PART B:\n")
a = -1
b = 1
result = []
for N in samples:
    # random values uniformly distributed between a and b
    x_values = np.random.uniform(a, b, N)
    
    y_values = np.exp(x_values)*np.cos(x_values)
    
    # Monte Carlo
    MC = np.mean(y_values) * (b - a)
    result.append(MC)

    # Print the results
    print(f"N = {N}   MC estimate = {MC:.3f}")

true_value = ((np.exp(b) * (np.cos(b) + np.sin(b))) - (np.exp(a) * (np.cos(a) + np.sin(a)))) / 2
# Plotting
plt.figure()
plt.plot(samples, result, marker='o')
plt.xscale('log')
plt.axhline(y=true_value, color='r', linestyle='--', label='True Integral')
plt.xlabel('Number of Samples')
plt.ylabel('Integration Value')
plt.title('Monte Carlo Integration of (b) e^xcos(x)')
plt.legend()
plt.grid(True)
plt.show()
