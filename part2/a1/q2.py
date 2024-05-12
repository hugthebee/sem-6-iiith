import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import solve_ivp

def spring(t, y, m, k1, k2):
    dydt = [y[2],
            y[3],
            -(k2 + k1) / m * y[0] + k1 / m * (y[1] - y[0]),
            -(k1+ k2) / m * y[1] - k2 / m * (y[1] - y[0])]
    return dydt

m = 1
k1 = 1
k2 = 1
C = 70 + 1 
t = np.linspace(0, 10, 500)

initial_conditions = [C, -C, 0, 0]

# Solve ODEs
solution = solve_ivp(
    spring,
    [t[0], t[-1]],
    initial_conditions,
    args=(m, k1, k2),
    t_eval=t
)

plt.plot(solution.t, solution.y[0], label='Mass 1')
plt.plot(solution.t, solution.y[1], label='Mass 2')
plt.xlabel('Time (s)')
plt.ylabel('Displacement (cm)')
plt.title('Motion of Springs')
plt.legend()
plt.show()

initial_conditions = [-C, -C, 0, 0]

# Solve ODEs
solution = solve_ivp(
    spring,
    [t[0], t[-1]],
    initial_conditions,
    args=(m, k1, k2),
    t_eval=t
)

plt.plot(solution.t, solution.y[0], label='Mass 1')
plt.plot(solution.t, solution.y[1], label='Mass 2')
plt.xlabel('Time (s)')
plt.ylabel('Displacement (cm)')
plt.title('Motion of Springs')
plt.legend()
plt.show()

initial_conditions = [-0.5*C, -C, 0, 0]

# Solve ODEs
solution = solve_ivp(
    spring,
    [t[0], t[-1]],
    initial_conditions,
    args=(m, k1, k2),
    t_eval=t
)

plt.plot(solution.t, solution.y[0], label='Mass 1')
plt.plot(solution.t, solution.y[1], label='Mass 2')
plt.xlabel('Time (s)')
plt.ylabel('Displacement (cm)')
plt.title('Motion of Springs')
plt.legend()
plt.show()
