#!/usr/bin/env python
# coding: utf-8

# # COURSE: Master statistics and machine learning: Intuition, Math, code
# ##### COURSE URL: udemy.com/course/statsml_x/?couponCode=202304 
# ## SECTION: Correlation
# ### VIDEO: Simulate data with specified correlation
# #### TEACHER: Mike X Cohen, sincxpress.com

# In[ ]:


# import libraries
import matplotlib.pyplot as plt
import numpy as np


# In[ ]:


## simulate data

# data simulation parameters
N = 100  # number of samples
r = .6   # desired correlation coefficient

# start with random numbers
x = np.random.randn(N)
y = np.random.randn(N)

# impose the correlation on y
y = x*r + y*np.sqrt(1-r**2)

# plot the data
plt.plot(x,y,'kp',markerfacecolor='b',markersize=12)
plt.xlabel('Variable X')
plt.ylabel('Variable Y')
plt.xticks([])
plt.yticks([])
plt.show()


# In[ ]:


## compute the empirical correlation

empR = np.corrcoef(x,y)

print('Desired r=%g, empirical r=%g'%(r,empR[0,1]))


# In[ ]:


## Test the errors as a function of N

# range of sample sizes
Ns = np.round( np.linspace(5,400,123) ).astype(int)

# theoretical correlation coefficient (fixed)
r = .6

# initialize
corrs = np.zeros(len(Ns))

# run the experiment!
for ni in range(len(Ns)):
    x = np.random.randn(Ns[ni])
    y = x*r + np.random.randn(Ns[ni])*np.sqrt(1-r**2)
    corrs[ni] = (r-np.corrcoef(x,y)[0,1])**2
    

plt.stem(Ns,corrs,'ko-')
plt.xlabel('Sample size')
plt.ylabel('Squared divergence')
plt.show()

