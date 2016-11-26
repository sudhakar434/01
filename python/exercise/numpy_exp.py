import numpy as np
from scipy.ndimage import interpolation as inter


np.random.seed(21)

x = np.arange(-3, 10, 2)
# print(x)



m = np.random.random((4, 4)) * 10
# m = [[1, 1], [1, 1]]
# m = np.ones_like(m)
rm = inter.rotate(m, angle=10, reshape=False, order=0)
# print(rm)
hist = np.sum(rm, axis=1)
# hist = np.sum(rm, axis=None)
# print(hist)

angles = range(5)
scores = np.zeros_like(angles)
# print(scores)


s = np.random.random(5) * 10
print('===========')
print(s)
print(np.argpartition(-s, 2)[:2])


pix = np.empty((0, 0), dtype=np.uint8)
