#!/usr/bin/env python
# coding: utf-8

# # COURSE: Master statistics and machine learning: Intuition, Math, code
# ##### COURSE URL: udemy.com/course/statsml_x/?couponCode=202006 
# ## SECTION: Signal detection theory
# ### VIDEO: Response bias
# #### TEACHER: Mike X Cohen, sincxpress.com

# In[ ]:


import numpy as np
import matplotlib.pyplot as plt
import scipy.stats as stats


# In[ ]:


## example from the slides

# step 1
hitP = 22/30
faP  =  3/30

# step 2
hitZ = stats.norm.ppf(hitP)
faZ  = stats.norm.ppf(faP)

# step 3
respBias = -(hitZ+faZ)/2

print(respBias)


# In[ ]:


## 2D bias space

# response probabilities
x  = np.arange(.01,1,.01)

# generate the space using tile expansion
rb = -( np.tile(stats.norm.ppf(x),(99,1)).T + np.tile(stats.norm.ppf(x),(99,1)) )/2


# show the 2D response bias space
plt.imshow(rb,extent=[x[0],x[-1],x[0],x[-1]],origin='lower')
plt.xlabel('False alarm rate')
plt.ylabel('Hit rate')
plt.title('Response bias')
plt.colorbar()
plt.show()

