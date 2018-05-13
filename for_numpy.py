# -*- coding: utf-8 -*-

import numpy as np
# from pandas import Series
# from pandas import DataFrame
# import pandas as pd
# import matplotlib.pyplot as plt
# b=[4.9,4.7,4.7,4.6,4.5]
# a=np.array(b)
def gm11(x,n):
    x1 = x.cumsum()  
    z1 = (x1[:len(x1) - 1] + x1[1:])/2.0  
    z1 = z1.reshape((len(z1),1))  
    B = np.append(-z1,np.ones_like(z1),axis=1)  
    Y = x[1:].reshape((len(x) - 1,1))  
    [[a],[b]] = np.dot(np.dot(np.linalg.inv(np.dot(B.T, B)), B.T), Y)
    result = (x[0]-b/a)*np.exp(-a*(n-1))-(x[0]-b/a)*np.exp(-a*(n-2))
    
    yield round(result,1) 


