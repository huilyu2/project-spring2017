# System for Receiving New Data
### Authors: Yuxiang Ling & Yuwei Chen of Group Athena
This part of Data Visualization aims to build a function to visualize the overview of the data.

The test data is designed by ourselves.

Packages be used: folium, vincent, pandas, numpy, randomcolor

The ideal visualiztion is to show all the graph on one image or window.

![alt text](https://github.com/huilyu2/project-spring2017/blob/master/part3/Screenshot.png)
## 1. The distribution of quantative data across the world

### Map : main map of quantative data
For this part of code, I used folium package to make the main map.
* Approach: 

  Scatter map (number of 3 quantitive data,html click popup with main information of the data)

* Explanation: 

  The Scatter map shows the location and 3 quatitive data on the world map. 
  
  The size of scatter is based on the number of the quantitive data. The data from different quatitive columns have different shapes of markers. The data from different qautitive column are put in different layers and a layer contral box can be found on the top right of the map. The users can use the layer contral box to chose which quatitive data to be showed on the map. 
  
  The map can be zoom out and in to show the data of specific area. 
  
  Different color is given to the data based on their categories.
  
  
* Strengths: 

  All the quatitive data from different columns can be showed on one map and we can compare the quatitive data base on the size of the markers.
  
* Work for the future: 

  Still need a legend to show the marker color of different categories

## 2. Detail informatin of the data 
### HTML popup: detail informatin of the data 
The main goal of this part is to show the detail information of each marker on the main map.

* Approach: 

  HTML popup(main information of the data, including the name, quatitive data and category)

* Explanation: 
  
  I made a html to store the main information of each marker and use the IFrame from folium package to put it in the popup.
  
  Click the marker, the main information, including the name, quatitive data and category, was showed in a html popup for this marker.
  
    
  
## 3. The categories of the data
### Bar chart popup: The quantitive data of different categories
This part aim to compare the different quantitive data of different categories on the main map.  

* Approach: 

  Bar chart popup(sum of 3 different quatitive data as y-axis, categories as x-axis)

* Explanation: 

  To put the chart in the popup, I used Vincent package to make vega chart and put it in the folium popup on the second layer.
  
  When we click the markers on the second layer, the chart can be showed in the popup that we can compare the different categories.
  
* Work for the future: 

  Add the quatitive data of each markers on the popup

## 4. The trend of the data
### Line chart popup: the quantitive data of different datetime
This part aim to see the trend of the quantitive data through the time.  

* Approach: 

  Line chart (Sum of the quatitive data as y-axis, datetime as x-axis)

* Explanation: 

  I used Vincent pakage to make the vega chart for this part and I put it on the third layer allowed us to see the trend of the data by click the markers.
  
## 5. Transform to general function
Based on above functions, first I extracted each of them into a independent function, then use a function to call them. For general data visualization purpose, add the user interactive input and modify the variable. Since we do not know how many categories will be in the categorical data and this will influence the icon coloring, so here I get the list of categories and assign each group color randomly. The subcomponent functions will receive the color list from parameters called by the main function "user_input()".

When I recreate the function for general purpose data visualization, I adopted Composite design pattern. Analyzed the original code and create its tree structure of simple and composite subfunctions. By creating multiple functions instead of mergin all functions into one making the code clean and easy to understand.


## Contributions of Members

* Yuxiang Ling: 
  Make the map and 3 popup  

* Yuwei Chen:
  1. Develop differentiating category coloring
  2. Develop function for general data visualization

## References
* Web Mapping Tutorial with Python and Folium
  http://pythonhow.com/web-mapping-with-python-and-folium
* Quickstart of Vincent
  http://vincent.readthedocs.io/en/latest/quickstart.html
* How to create Popups
  http://nbviewer.jupyter.org/github/bibmartin/folium/blob/issue288/examples/Popups.ipynb
* Visualizing Indego bike geoson data in Python using Folium
  http://www.kobakhit.com/beginner/2016/03/06/visualizing-indego-bike-geoson-data-in-python-using-folium.html
* Folium Map Tiles
  https://deparkes.co.uk/2016/06/10/folium-map-tiles/
