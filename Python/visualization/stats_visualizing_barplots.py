#!/usr/bin/env python
# coding: utf-8

# # COURSE: Master statistics and machine learning: Intuition, Math, code
# ##### COURSE URL: udemy.com/course/statsml_x/?couponCode=202006 
# ## SECTION: Visualizing data
# ### VIDEO: Bar plots
# #### TEACHER: Mike X Cohen, sincxpress.com
# 

# In[ ]:


# import libraries
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd


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


# show the bars!

fig,ax = plt.subplots(1,3,figsize=(8,2))

# 'naked' bars
ax[0].bar(range(n),np.mean(data,axis=0))
ax[0].set_title('Bar plot')

# just the error bars
ax[1].errorbar(range(n),np.mean(data,axis=0),np.std(data,axis=0,ddof=1),marker='s',linestyle='')
ax[1].set_title('Errorbar plot')

# both
ax[2].bar(range(n),np.mean(data,axis=0))
ax[2].errorbar(range(n),np.mean(data,axis=0),np.std(data,axis=0,ddof=1),marker='.',linestyle='',color='k')
ax[2].set_title('Error+bar plot')

plt.show()


# In[ ]:


## manually specify x-axis coordinates

xcrossings = [ 1, 2, 4, 5, 6, 9 ]

plt.bar(xcrossings,np.mean(data,axis=0))
plt.errorbar(xcrossings,np.mean(data,axis=0),np.std(data,axis=0,ddof=1),marker='.',linestyle='',color='k')
plt.title('Bar+error plot')

plt.show()


# In[ ]:


## note about bars from matrices

# data are groups (rows) X property (columns)
m = [ [2,5,4,3], [1,1,8,6] ]

fig,ax = plt.subplots(nrows=2,ncols=2,figsize=(8,8))

# conceptualizing the data as <row> groups of <columns>
ax[0,0].imshow(m)

# using pandas dataframe
df = pd.DataFrame(m,columns=['prop 0','prop 1','prop 2','prop 3'])
df.plot(ax=ax[1,0],kind='bar')
ax[1,0].set_title('Grouping by rows')


# now other orientation (property X group)
ax[0,1].imshow(np.array(m).T)
df.T.plot(ax=ax[1,1],kind='bar')
ax[1,1].set_title('Grouping by columns')

plt.show()

