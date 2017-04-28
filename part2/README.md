# Data Visualization & Analysis of Distribution of IMLS Grants
### Authors: QI QI & Yuxiang Ling of Group Athena

This part of Data Visualization aims to generate a series of interactive figures to make analysis of distribution of Grants and its relationship with GDP by state. 
Grant Data sources can be found at https://data.imls.gov/Administrative-Data/Administrative-Discretionary-Grants-FY-1996-2014-/kf5m-pcwv.
The GDP Data by state can be found at https://commons.wikimedia.org/wiki/Data:Bea.gov/GDP_by_state.tab. 

## 1. Grants' Type Contribution

### Figure: Grants Program Type Distribution
For this part of code, I refer to the previous assignment on defining a class in course LIS590DV, and then pass the csv dataset into it.
* Approach: 

  barplot (x-axis represents the type of Grants Progtam; y-axis represents the amount of each type)

* Explanation: 

 About the question of "What types of grants are supported by IMLS", I think this is an frequency amount distribution plot. At first, I tried to use histgram, but it can not define the specific x-asxis and y-axis. However, histgram always records the repeating time of the number within data.
 
 After that, I used barplot, which can decide the x-axis and y axis. I use the xticks() function to replace the numeric number with the charactor, which is the type of grants program. I also sorted the data with the descending sequence, and show the exact number on the top of each bar.


## 2. Routes with Different Numbers of Trips

### Figure: Distribution of Routes with Different Numbers of Trips
Each route may correspond to multiple trips. To get a basic understanding of how many trips (buses) are there for each route. I plot a histogram to see the distribution.

* Approach: 

  histogram (number of trips for each route as x-axis, count of routes as y-axis, "Purples" colormap, dashed grid line on y-axis)

* Explanation: 

  Histogram is one of the best ways to demonstrate the distribution. The result shows that it is an obvious right-skewed distribution. I set the colormap to intuitively see the tendency of the data based on the depth of the color. Besides, I only turn on the grid line on y-axis since the edges of each bar can defintely represent the exact value of x-axis.
  
  It can be found that for section "150-200", there is no value. I suppose it should be a key feature.

## 3. GDP Compared with the Grants Amount by state.

### Figure 1: GDP vs Grants Amount by state based on American map
To get an overview of the relationship between the economic factors in a zip code and the grants from IMLS, I make a plot based on the North America map with plotly.

* Approach: 

  Interactive plot with plotly which is composed of data and layout.

* Explanation: 

 In this part, I think "the economic factors in a zip code" means the GDP of every state in America. So I collect GDP data by state within the scope of years and try to combine this data together with Grants Amount data.
 I used colorbar to show the amount of GDP, and when we point to each state, it will show the state name, the exact GDP and the Grants Amount. I chose 2005 year, and draw the plot.

### Figure 2: Relation between GDP and Grants Amount
To get an specific view of the relationship between the economic factors in a zip code and the grants from IMLS, I make a compared plot with the Bokeh framework.

* Approach: 

  Interactive plot with Bokeh framework which is composed of right and left figure with TOOLS.

* Explanation: 

 In this part, I think we should know the trend of the GDP and Grants Amount distributions and their relationship. So I take advantage of Bokeh, to set the GDP and Grants Amount as right and left fighure, which is easier to compare with.
 And we can use Bokeh to box select the specific points and see these data clearly. 
 
 But with Bokeh, the axes should be numeric, which can not shown as character type. So I just put the exact state name ordered by first capital letter, which is corresponding to the number 1~51. 
 
 Besides, I also want to add the "year" label to show the variace with time. So I tried to use box widgets to make a list to choose from. But I had some hard time to load in the data, and changed the data by the drop-down list. I wish I cound achieve this function in the future.

## Contributions of Members

* Qi Qi: 
  Part 1 and Part 3 in Jupyter Notebook using Python  

* Yuxiang Ling:
 SQL for data cleaning and preprocessing
 ...
