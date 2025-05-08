import math
import matplotlib.pyplot as plt

# 1:
# n! = n * (n-1) * (n-2) ... * 1
def factorial(number):
    sum = 1

    for i in range(2, number + 1):
        sum *= i

    return sum


def approx_sin(x, limit):
    sum = 0

    for n in range(limit):
        sum += (-1)**n * (x**(2*n + 1)) / factorial(2*n + 1)

    return sum


def main():
    print('Aufgabe 1: Fakultät')
    print(f'1! = {factorial(1)}')
    print(f'3! = {factorial(3)}')
    print(f'10! = {factorial(10)}')

    print('------------------')

    print('Aufgabe 2')
    print(f'approx_sin(3.14, 10) = {approx_sin(3.14, 10)}')

    print('------------------')

    print('Aufgabe 3')
    print(f'math.sin(3.14) = {math.sin(3.14)}')

    print('------------------')

    print('Aufgabe 4: Unterschied eigene sin und math.sin')

    for i in range(10):
        own_sin = approx_sin(math.pi / 2, i)
        math_sin = math.sin(math.pi / 2)

        dif = abs(own_sin - math_sin)

        print(f'difference approx_sin to math.sin for limit: {i} is {dif}')

    print('------------------')

    print('Aufgabe 5')
    # kein step in float schritten möglich
    x = [i/10 for i in range(0, 101)]
    print(x)

    print('------------------')
    
    print('Aufgabe 6')
    y_5 = [approx_sin(i, 5) for i in x]
    y_10 = [approx_sin(i, 10) for i in x]
    y_20 = [approx_sin(i, 20) for i in x]
    y_math_sin = [math.sin(i) for i in x]

    print('------------------')

    print('Aufgabe 7')
    plt.plot(x)
    plt.plot(y_20)
    plt.show()

    print('------------------')

    print('Aufgabe 8')
    plt.plot(y_5, label='limit 5')
    plt.plot(y_10, label='limit 10')
    plt.plot(y_20, label='limit 20')
    plt.plot(y_math_sin, label='math.sin')
    plt.ylim(-10, 10)
    plt.legend()
    plt.show()

    print('------------------')

    print('Aufgabe 9')
    x_0_49 = x[0:len(x) // 2]
    x_5_99 = x[len(x) // 2:]

    sliced_y_10 = y_10[0:len(y_10) // 2]
    sliced_y_20 = y_20[len(y_20) // 2:]

    plt.plot(x_0_49, sliced_y_10, label='limit 10')
    plt.plot(x_5_99, sliced_y_20, label='limit 20')
    plt.legend()
    plt.show()
   


main()