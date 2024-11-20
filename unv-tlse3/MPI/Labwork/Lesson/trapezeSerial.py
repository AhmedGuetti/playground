# to run: python3 trapezeSerial.py 0.0 1.0 10000

import sys

#takes in command-line arguments [a,b,n]
a = float(sys.argv[1])
b = float(sys.argv[2])
n = int(sys.argv[3])

def f(x):
        return x*x

def integrateRange(a, b, n):
        '''Numerically integrate with the trapezoid rule on the interval from
        a to b with n trapezoids.
        '''
        integral = -(f(a) + f(b))/2.0
        # n+1 endpoints, but n trapazoids
        x = a
        h = (b-a)/n
        while (x<b):
                integral = integral + f(x)
                x = x + h
                
        integral = integral * (b-a)/n
        return integral

integral = integrateRange(a, b, n)
print ("With n =", n, "trapezoids, our estimate of the integral from", a, "to", b, "is", integral)

