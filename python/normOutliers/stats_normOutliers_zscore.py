#!/usr/bin/env python
# coding: utf-8

# # COURSE: Master statistics and machine learning: Intuition, Math, code
# ##### COURSE URL: udemy.com/course/statsml_x/?couponCode=202304 
# ## SECTION: Data normalizations and outliers
# ### VIDEO: Z-score
# #### TEACHER: Mike X Cohen, sincxpress.com

# In[ ]:


# import libraries
import matplotlib.pyplot as plt
import numpy as np
from scipy import stats


# In[ ]:


## create data

data = np.random.poisson(3,1000)**2

## compute the mean and std
datamean = np.mean(data)
datastd  = np.std(data,ddof=1)

# the previous two lines are equivalent to the following two lines
#datamean = data.mean()
#datastd  = data.std(ddof=1)



plt.plot(data,'s',markersize=3)
plt.xlabel('Data index')
plt.ylabel('Data value')
plt.title(f'Mean = {np.round(datamean,2)}; std = {np.round(datastd,2)}')

plt.show()


# In[ ]:


## now for z-scoring

# z-score is data minus mean divided by stdev
dataz = (data-datamean) / datastd

# can also use Python function
dataz = stats.zscore(data)

# compute the mean and std
dataZmean = np.mean(dataz)
dataZstd  = np.std(dataz,ddof=1)

plt.plot(dataz,'s',markersize=3)
plt.xlabel('Data index')
plt.ylabel('Data value')
plt.title(f'Mean = {np.round(dataZmean,2)}; std = {np.round(dataZstd,2)}')

plt.show()


# In[ ]:


## show that the relative values are preserved

plt.plot(data,dataz,'s')
plt.xlabel('Original')
plt.ylabel('Z-transformed')
plt.title('Correlation r = %g'%np.corrcoef(data,dataz)[0,0])
plt.show()

