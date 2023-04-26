#!/usr/bin/env python
# coding: utf-8

# # COURSE: Master statistics and machine learning: Intuition, Math, code
# ##### COURSE URL: udemy.com/course/statsml_x/?couponCode=202006 
# ## SECTION: Visualizing data
# ### VIDEO: Box-and-whisker plots
# #### TEACHER: Mike X Cohen, sincxpress.com
# 

# In[ ]:


# import libraries
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sns


# In[ ]:


## create data for the bar plot

# data sizes
m = 30 # rows
n =  6 # columns

# generate data
data = np.zeros((m,n))

for i in range(n):
    data[:,i] = 30*np.random.randn(m) * (2*i/(n-1)-1)**2 + (i+1)**2


# In[ ]:


# now for the boxplot

plt.boxplot(data)
plt.show()


# In[ ]:


# now with seaborn
sns.boxplot(data=data,orient='v')
plt.show()


# In[ ]:


# or as a pandas data frame
df = pd.DataFrame(data,columns=['zero','one','two','three','four','five'])
sns.boxplot(data=df,orient='h')
plt.show()

