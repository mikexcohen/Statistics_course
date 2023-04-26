#!/usr/bin/env python
# coding: utf-8

# # COURSE: Master statistics and machine learning: Intuition, Math, code
# ##### COURSE URL: udemy.com/course/statsml_x/?couponCode=202304 
# ## SECTION: Data normalizations and outliers
# ### VIDEO: Min-max scaling
# #### TEACHER: Mike X Cohen, sincxpress.com

# In[ ]:


# import libraries
import matplotlib.pyplot as plt
import numpy as np


# In[ ]:


## create some data

N = 42
data = np.log(np.random.rand(N))*234 + 934

# get min and max
dataMin = min(data)
dataMax = max(data)

# now min-max scale
dataS = (data-dataMin) / (dataMax-dataMin)


# now plot
fig,ax = plt.subplots(1,2,figsize=(8,4))
ax[0].plot(1+np.random.randn(N)/20,data,'ks')
ax[0].set_xlim([0,2])
ax[0].set_xticks([])
ax[0].set_ylabel('Original data scale')
ax[0].set_title('Original data')

ax[1].plot(1+np.random.randn(N)/20,dataS,'ks')
ax[1].set_xlim([0,2])
ax[1].set_xticks([])
ax[1].set_ylabel('Unity-normed data scale')
ax[1].set_title('Scaled data')

plt.show()


# In[ ]:


## show that scaling doesn't affect the relative values

plt.plot(data,dataS,'ks')
plt.xlabel('Original')
plt.ylabel('Scaled')
plt.show()


# In[ ]:


## any abitrary data range

# step 1 is to [0,1] normalize as above

# step 2:
newMin = 4
newMax = 8.7

dataSS = dataS*(newMax-newMin) + newMin

# test it!
print([min(dataSS), max(dataSS)])

