#!/usr/bin/env python
# coding: utf-8

# # COURSE: Master statistics and machine learning: Intuition, Math, code
# ##### COURSE URL: udemy.com/course/statsml_x/?couponCode=202006 
# ## SECTION: Visualizing data
# ### VIDEO: Pie charts
# #### TEACHER: Mike X Cohen, sincxpress.com
# 

# In[ ]:


# import libraries
import matplotlib.pyplot as plt
import numpy as np


# In[ ]:


## create data for the plot

nbins = 5
totalN = 100

rawdata = np.ceil(np.logspace(np.log10(1/2),np.log10(nbins-.01),totalN))


# prepare data for pie chart
uniquenums = np.unique(rawdata)
data4pie = np.zeros(len(uniquenums))

for i in range(len(uniquenums)):
    data4pie[i] = sum(rawdata==uniquenums[i])


# In[ ]:


# show the pie chart
plt.pie(data4pie,labels=100*data4pie/sum(data4pie))
plt.show()


# In[ ]:


# another option
plt.pie(data4pie,labels=['zero','one','two','three','four'],explode=[0,.1,0,.15,0])
plt.show()


# In[ ]:


## for continuous data

# generate log-normal distribution
data = np.exp( np.random.randn(1000)/10 )


# generate bins using histogram
histout = np.histogram(data,bins=6)

# and show that as a pie chart
plt.pie(histout[0])
plt.show()

