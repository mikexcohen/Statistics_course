#!/usr/bin/env python
# coding: utf-8

# # COURSE: Master statistics and machine learning: Intuition, Math, code
# ##### COURSE URL: udemy.com/course/statsml_x/?couponCode=202304 
# ## SECTION: Correlation
# ### VIDEO: The subgroups correlation paradox
# #### TEACHER: Mike X Cohen, sincxpress.com
# 
# ##### note: official called "Simpson's paradox"

# In[ ]:


# import libraries
import matplotlib.pyplot as plt
import numpy as np
from scipy.stats import pearsonr


# In[ ]:


# initializations
n = 20 # sample points per group
offsets = [2, 3.5, 5] # mean offsets

allx = np.array([])
ally = np.array([])

c = 'rbk' # dot colors

# generate and plot data
for datai in range(3):
    
    # generate data
    x = np.linspace(offsets[datai]-1,offsets[datai]+1,n)
    y = np.mean(x) + np.random.randn(n)/2
    
    # subgroup correlation
    r,p = pearsonr(x,y)
    
    # plot
    plt.plot(x,y,'o',color=c[datai],label=f'r={r:.3f}, p={p:.3f}')
    
    # gather the data into one array
    allx = np.append(allx,x)
    ally = np.append(ally,y)
    


# % now correlate the groups
[r,p] = pearsonr(allx,ally)
plt.title(f'r={r:.4f}, p={p:.4f}')

plt.xlabel('X')
plt.ylabel('Y')
plt.legend()
plt.show()


# In[ ]:




