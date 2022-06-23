import numpy as np
import matplotlib.pyplot as plt

# the RHS of the ODEs
def chem(t, x):
    
    # reaction rates    

    K1=0.1
    K2=0.1
    K3=2.0

    f= np.array([0.0, 0.0,  0.0])

    f[0]= -K1*x[0]*x[1] + K2*x[2]
    f[1]= -K1*x[0]*x[1] + K2*x[2] - K3*x[1]*x[2]
    f[2]=  K1*x[0]*x[1] - K2*x[2] - K3*x[1]*x[2]

    return f

# Euler's method
def RK1(f, y0, t):
    N = len(t)
    h = t[1]-t[0]

    y = np.zeros((N, len(y0)))
    y[0,:] = y0
    for n in range(N-1):
        y[n+1,:] = y[n,:] + h * f(t[n], y[n,:])
    


    return y

t = np.linspace(0, 80, 1001)

y0 = np.array([1, 1, 0.0])

Y = RK1(chem, y0, t)

plt.plot(t, Y[:, 0], 'b')
plt.plot(t, Y[:, 1], 'g')
plt.plot(t, Y[:, 2], 'k')


plt.show()