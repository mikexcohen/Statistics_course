#!/usr/bin/env python
# coding: utf-8

# # COURSE: Master statistics and machine learning: intuition, math, code
# ##### COURSE URL: udemy.com/course/statsml_x/?couponCode=202006 
# ## SECTION: What are (is?) data?
# ### VIDEO: Code: Representing types of data on computers
# #### TEACHER: Mike X Cohen, sincxpress.com
# 

# In[ ]:


## create variables of different types (classes)

# data numerical (here as a list)
numdata = [ 1, 7, 17, 1717 ]

# character / string
chardata = 'xyz'

# double-quotes also fine
strdata = "x"

# boolean (aka logical)
logitdata = True # notice capitalization!

# a list can be used like a MATLAB cell
listdata = [ [3, 4, 34] , 'hello' , 4 ]

# dict (kindof similar to MATLAB structure)
dictdata = dict()
dictdata['name'] = 'Mike'
dictdata['age'] = 25
dictdata['occupation'] = 'Nerdoscientist'


# In[ ]:


# let's see what the workspace looks like
get_ipython().run_line_magic('whos', '')


# In[ ]:


# clear the Python workspace
get_ipython().run_line_magic('reset', '-sf')


# In[ ]:




