import numpy as np
import matplotlib.pyplot as plt

#constants
n = 6.1e-10
kb = 1.380649e-23
me = 9.109e-31
c = 299792458
Q = 2.18e-18

T = np.linspace(1, 10000, 500)
S = (np.exp(Q / (kb * T)))
S *= np.power(((kb * T) / (me * c * c)), 3/2)
S *= n
X = (-1 + np.sqrt(1 + 4 * S)) / (2 * S)

plt.plot(T, X)
plt.xlabel('Temperature (K)')
plt.ylabel('X')
plt.title('X vs T')
plt.show()