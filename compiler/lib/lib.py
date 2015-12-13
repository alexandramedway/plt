"""
  COMS4115: Python Standard Library

  Authors:
    - Alex Kalicki
    - Alexandra Medway
    - Daniel Echikson
    - Lilly Wang
"""
import math
import random
import matplotlib.pyplot as plt

INDEX_STEP = 1000
DIST_LENGTH = 10000
SAMPLE_STEP = 100

def make_dist(start, end, f):
    """Return a list generated from dist<min, max> | f"""
    step = (end - start) * 1.0 / INDEX_STEP
    indices = [ start + step * x for x in range(INDEX_STEP) ]

    cum_sum = 0.0
    cum_weights = []
    for x in indices:
        cum_sum += abs(f(x))
        cum_weights.append(cum_sum)
    rands = sorted([random.uniform(0, cum_sum) for x in range(DIST_LENGTH)])

    cum_i = 0
    rand_i = 0
    dist_list = []
    while rand_i < len(rands):
        if rands[rand_i] < cum_weights[cum_i]:
            dist_list.append(indices[cum_i])
            rand_i = rand_i + 1
        else:
            cum_i = cum_i + 1
    return dist_list

def add_dist(d1, d2):
    start1 = random.randint(0, 99)
    s1 = d1[start1::SAMPLE_STEP]
    start2 = random.randint(0, 99)
    s2 = d2[start2::SAMPLE_STEP]
    add = []
    for i in s1:
        for j in s2:
            add.append(i + j)
    return sorted(add)

def mult_dist(d1, d2):
    start1 = random.randint(0, 99)
    s1 = d1[start1::SAMPLE_STEP]
    start2 = random.randint(0, 99)
    s2 = d2[start2::SAMPLE_STEP]
    mult = []
    for i in s1:
        for j in s2:
            mult.append(i * j)
    return sorted(mult)

def shift_dist(d, n):
    return [x + n for x in d]

def stretch_dist(d, n):
    return [x * n for x in d]

def exp_dist(d, n):
    return [x ** n for x in d]

"""
END PYTHON STANDARD LIBRARY
BEGIN USER CODE
"""