from math import ceil, floor


def probability(n, m=None):
    if m is None:
        m = sum(range(1, n + 1)) / n - 1
    if floor(float(m)) == 0:
        return 0

    if n % 2 == 0:
        v1 = sum(range(int(ceil(m)), n + 1)) / (n - floor(m)) - (sum(range(1, n + 1)) / n - m - 1)
        p1 = (n - floor(m)) / n
    else:
        v1 = sum(range(int(ceil(m)), n + 1)) / (n - floor(m) + 1) - (sum(range(1, n + 1)) / n - m - 1)
        p1 = (n - floor(m) + 1) / n

    val = ((p1 * v1) + (1 - p1) * probability(n, m - 1))

    print(n, m, val)

    return val


print(probability(50))
# print(probability(6))
