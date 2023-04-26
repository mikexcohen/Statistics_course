#!/usr/bin/env python
# coding: utf-8

# # COURSE: Master statistics and machine learning: Intuition, Math, code
# ##### COURSE URL: udemy.com/course/statsml_x/?couponCode=202304 
# ## SECTION: ANOVA
# ### VIDEO: One-way repeated-measures ANOVA
# #### TEACHER: Mike X Cohen, sincxpress.com

# In[ ]:


# import libraries
import numpy as np
import matplotlib.pyplot as plt
import pingouin as pg
import pandas as pd


# In[ ]:


## data parameters

# group means
mean1 = 4
mean2 = 3.8
mean3 = 7

# samples (same across group)
N = 30

# standard deviation (assume common across groups)
stdev = 2


# In[ ]:


## now to simulate the data
data1 = mean1 + np.random.randn(N)*stdev
data2 = mean2 + np.random.randn(N)*stdev
data3 = mean3 + np.random.randn(N)*stdev

datamat = np.vstack((data1,data2,data3)).T

# convert to a pandas dataframe
df = pd.DataFrame(data=datamat,columns=['d1','d2','d3'])
df


# In[ ]:


pg.rm_anova(data=df,detailed=True)


# In[ ]:


df.boxplot();


# In[ ]:


## example from SPSS website

# https://www.spss-tutorials.com/repeated-measures-anova/

data = [
    [8, 7, 6, 7],
    [5, 8, 5, 6],
    [6, 5, 3, 4],
    [6, 6, 7, 3],
    [8, 10, 8, 6],
    [6, 5, 6, 3],
    [6, 5, 2, 3],
    [9, 9, 9, 6],
    [5, 4, 3, 7],
    [7, 6, 6, 5]]


df = pd.DataFrame(data=data,columns=['1','2','3','4'])

pg.rm_anova(data=df,detailed=True)

