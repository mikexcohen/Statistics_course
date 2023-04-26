#!/usr/bin/env python
# coding: utf-8

# # COURSE: Master statistics and machine learning: Intuition, Math, code
# ##### COURSE URL: udemy.com/course/statsml_x/?couponCode=202304 
# ## SECTION: Descriptive statistics
# ### VIDEO: QQ plots
# #### TEACHER: Mike X Cohen, sincxpress.com

# In[ ]:


# import libraries
import matplotlib.pyplot as plt
import numpy as np
import scipy.stats as stats


# In[ ]:


## generate data

n    = 1000
data = np.random.randn(n)
# data = np.exp( np.random.randn(n)*.8 ) # log-norm distribution

# theoretical normal distribution given N
x = np.linspace(-4,4,10001)
theonorm = stats.norm.pdf(x)
theonorm = theonorm/max(theonorm)

# plot histograms on top of each other
yy,xx = np.histogram(data,40)
yy = yy/max(yy)
xx = (xx[:-1]+xx[1:])/2

plt.plot(xx,yy,label='Empirical')
plt.plot(x,theonorm,label='Theoretical')
plt.legend()
plt.show()


# In[ ]:


## create a QQ plot

zSortData  = np.sort(stats.zscore(data))
sortNormal = stats.norm.ppf(np.linspace(0,1,n))

# QQ plot is theory vs reality
plt.plot(sortNormal,zSortData,'o')

# set axes to be equal
xL,xR = plt.xlim()
yL,yR = plt.ylim()
lims  = [ np.min([xL,xR,yL,yR]),np.max([xL,xR,yL,yR]) ]
plt.xlim(lims)
plt.ylim(lims)

# draw red comparison line
plt.plot(lims,lims)

plt.xlabel('Theoretical normal')
plt.ylabel('Observed data')
plt.title('QQ plot')
plt.axis('square')
plt.show()


# In[ ]:


## Python solution

x = stats.probplot(data,plot=plt)

