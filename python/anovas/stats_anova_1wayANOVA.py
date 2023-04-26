#!/usr/bin/env python
# coding: utf-8

# # COURSE: Master statistics and machine learning: Intuition, Math, code
# ##### COURSE URL: udemy.com/course/statsml_x/?couponCode=202304 
# ## SECTION: ANOVA
# ### VIDEO: One-way ANOVA (independent samples)
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

# samples per group
N1 = 30
N2 = 35
N3 = 29

# standard deviation (assume common across groups)
stdev = 2


# In[ ]:


## now to simulate the data
data1 = mean1 + np.random.randn(N1)*stdev
data2 = mean2 + np.random.randn(N2)*stdev
data3 = mean3 + np.random.randn(N3)*stdev

datacolumn = np.hstack((data1,data2,data3))

# group labels
groups = ['1']*N1 + ['2']*N2 + ['3']*N3

# convert to a pandas dataframe
df = pd.DataFrame({'TheData':datacolumn,'Group':groups})
df


# In[ ]:


pg.anova(data=df,dv='TheData',between='Group')


# In[ ]:


pg.pairwise_tukey(data=df,dv='TheData',between='Group')


# In[ ]:


df.boxplot('TheData',by='Group');

