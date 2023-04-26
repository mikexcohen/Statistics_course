#!/usr/bin/env python
# coding: utf-8

# # COURSE: Master statistics and machine learning: Intuition, Math, code
# ##### COURSE URL: udemy.com/course/statsml_x/?couponCode=202304 
# ## SECTION: ANOVA
# ### VIDEO: Two-way mixed-effects ANOVA
# #### TEACHER: Mike X Cohen, sincxpress.com

# In[ ]:


# import libraries
import numpy as np
import matplotlib.pyplot as plt
import pingouin as pg
import pandas as pd
import seaborn as sns


# In[ ]:


## the data and group labels

data = np.loadtxt(open("TwoWayMixedANOVA_data.csv"),delimiter=",")

timepoint = ['1']*45 + ['2']*45 + ['3']*45
groups    = ['1']*15 + ['2']*15 + ['3']*15
s = []
for i in range(45):
    s += [str(i)]

# # convert to pandas
df = pd.DataFrame(data=np.matrix.flatten(data,'F'),columns=['TheData'])
df['Group'] = np.tile(groups,3)
df['TimePoint'] = timepoint
df['Subject'] = np.tile(s,3)

pd.set_option("display.max_rows", None, "display.max_columns", None)
df


# In[ ]:


pg.mixed_anova(data=df,dv='TheData',between='Group',within='TimePoint',subject='Subject')


# In[ ]:


sns.boxplot(data=df,hue="Group",y="TheData",x='TimePoint')

