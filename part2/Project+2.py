
# coding: utf-8

# In[16]:

import plotly.plotly as py


# In[17]:

import pandas as pd


# In[18]:

df = pd.read_csv('/Users/yiling10/Downloads/Administrative_Discretionary_Grants_Dataset.csv')


# In[19]:

df.head()


# In[70]:

import math
df['text'] = df['Program'] +'<br>Total Amount Awarded and Disbursed ' + (df['Total Amount Awarded and Disbursed']/1e3).astype(str)
limits = [(0,10),(11,20),(21,50),(51,100),(101,1000)]
colors = ["rgb(0,116,217)","rgb(255,65,54)","rgb(133,20,75)","rgb(255,133,27)","lightgrey"]
Programs = []
scale = 500


# In[71]:

for i in range(len(limits)):
    lim = limits[i]
    df_sub = df[lim[0]:lim[1]]
    program = dict(
        type = 'scattergeo',
        locationmode = 'USA-states',
        lon = df_sub['LNG'],
        lat = df_sub['LAT'],
        text = df_sub['text'],
        marker = dict(
            size = df_sub['Total Amount Awarded and Disbursed']/scale,
            color = colors[i],
            line = dict(width=0.5, color='rgb(40,40,40)'),
            sizemode = 'area'
        ),
        name = '{0} - {1}'.format(lim[0],lim[1]) )
    Programs.append(program)

layout = dict(
        title = 'Administrative Discretionary Grants<br>(Click legend to toggle traces)',
        showlegend = True,
        geo = dict(
            scope='usa',
            projection=dict( type='albers usa' ),
            showland = True,
            landcolor = 'rgb(217, 217, 217)',
            subunitwidth=1,
            countrywidth=1,
            subunitcolor="rgb(255, 255, 255)",
            countrycolor="rgb(255, 255, 255)"
        ),
    )


# In[72]:

fig = dict( data=Programs, layout=layout )
py.iplot( fig, validate=False, filename='d3-bubble-map-populations' )


# In[4]:




# In[5]:




# In[6]:




# In[7]:




# In[8]:




# In[ ]:



