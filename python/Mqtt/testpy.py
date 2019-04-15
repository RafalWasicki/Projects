import numpy as np

a = 6
print(a)

b = 'napis'
print(b)

c = True
print(c)

z = None
print(z)
print(z is None)
print(b is None)

d = [1, 2, 3, 4, 5.7]
print(d)

d.append(12)
print(d)
print(d[2])

e = {1: 'a', 2: '4', 'napis': 12}
print(e)
e[3] = '123'
print(e)
print(e['napis'])

f = ([4, 2, 5], 'slowo', 4.6)
print(f)
print(f[0])
print(f[1])

A = np.array([[5], [2]])
B = np.array([[1, 2], [3, 4]])
C = np.array([[0, 1], [1, 1]])
print(A)
print(B)
print(C)

D = C.astype(bool)
print(D)
E = np.array([[True, True], [False, True]])
print(E)
print(~D)
print(D & E)
print(D | E)


print(B+C)
print(B@C)
print(B.dot(C))
print(B@A)
print(A.transpose()@A)
print(B[0])
print(B[0, 1])
print(B[1, :])
print(B[:, 0])

Z = np.zeros(shape=(3, 4))
O = np.ones(shape=(e, 7))
I = np.eye(4)
R = np.random.rand(3, 2)
