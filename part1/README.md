# Data Visualization & Analysis of Champaign-Urbana Mass Transit District (CUMTD)
### Authors: Hui Lyu & Yuwei Chen of Group Athena

This part of Data Visualization aims to generate a series of static figures to make analysis of routes in CUMTD. 
Data sources can be found at http://developer.cumtd.com/ . 
In particular, we check the GTFS data feed to better understand the several files.

## 1. Location and Density of Bus Stops

### Figure 1: Location of Bus Stops
For this part of code, I refer to the previous assignment on defining a class in course LIS590DV, and then pass the stops.csv dataset into it.
* Approach: 

  scatterplot (longitude and latitude as axes, alpha=0.4, dotted grid line)

* Explanation: 

  Scatter plot adopts dot to represent each bus stop, similar in real life. I use longitude as x-axis and latitude as y-axis to represent the geographic location of bus stops. I lower down the value of alpha to reflect how many bus stops are located in an area. In this way, we can distinguish which areas have more or less bus stops. Besides, adding dotted grid lines can help to locate the exact positions of the stops. 
  
  While, it is not quite easy to distinguish how dense the stops are in specific areas since all the stops are in the same color. I wish I could differentiate the points of stops in multiple colors which represent different densities in a small area. Apart from that, I suppose I could also set different colors for stops belonging to different routes, from which some patterns may be found.

### Figure 2: Density of Bus Stops of CUMTD
The main approach to calculate density is binning. The binning function codes are referenced from Professor Matthew Turk's lecture notes of LIS590DV course.

* Approach: 

  binning in 2D (longitude and latitude as axes, with a color bar, add two ellipses)

* Explanation: 

  Firstly, I divide the whole figure into 16 × 16 small bins. For each bin, I calculate how many points (bus stops) are located in that bin. The limits of the axes of the figure are decided by the smallest and largest values in the data itself. Accompanied with a colormap, it can be distinguished that which bins have more or less stops than others.
  
  In addition, I add two ellipses on the figure to circle two areas which have the most bus stops among all. It is more intuitive to find in which areas more bus stops are located.
  
  While, the exact number of stops for each bin cannot be shown in the figure. Besides, the location of the bins cannot be clearly identified correlated with a geographic map. 
  
### Figure 3: Location of Bus Stops on Google Map
To better locate the bus stops on a geographical map, I choose to use Google Map as the base map. So I install a new module called "gmaps".

This is the reference document. http://jupyter-gmaps.readthedocs.io/en/latest/gmaps.html#markers-and-symbols

* Approach: 

  There are several ways to add different kinds of layers on Google Map. For the purpose of locating the stops, I choose the symbol_layer to plot dots on map. Each dot represents a single bus stop.

* Explanation: 

  In this way, the general location of some bus tops can be intuitively found on a real map. While, there is no parameter like "alpha" to change the attribute of those points on Google Map. The single color issue still remains to be solved.

## 2. Routes with Different Numbers of Trips

### Figure 4: Distribution of Routes with Different Numbers of Trips
Each route may correspond to multiple trips. To get a basic understanding of how many trips (buses) are there for each route. I plot a histogram to see the distribution.

* Approach: 

  histogram (number of trips for each route as x-axis, count of routes as y-axis, "Purples" colormap, dashed grid line on y-axis)

* Explanation: 

  Histogram is one of the best ways to demonstrate the distribution. The result shows that it is an obvious right-skewed distribution. I set the colormap to intuitively see the tendency of the data based on the depth of the color. Besides, I only turn on the grid line on y-axis since the edges of each bar can defintely represent the exact value of x-axis.
  
  It can be found that for section "150-200", there is no value. I suppose it should be a key feature.

### Figure 5: Top 10 Routes with Most Number of Trips for Each Route
After plotting the histogram of distribution of routes with different number of trips, I choose the top 10 routes to reflect in details.

* Approach: 

  Horizontal bar plot (number of trips as x-axis, route_id as y-axis, bars in their routes' colors, dotted grid line on x-axis)

* Explanation: 

  Since the names of route_id are sort of long, I use horizontal bar plot to let them on the left side. I set the bars colors to be their corresponding routes' colors because we can clearly find some duplicate colors and it is easy to make comparisons with other figures. Exact numbers of trips of each route are also displayed right after the bars, making it more readable. Grid lines on x-axis are added to better show the relative position.

### Figure 6: Shapes of Routes with Most/Least Number of Trips
To find if there exists any relationship between density of stops and number of trips for each route, I plot the shape lines of routes with most and least number of trips.

* Approach: 

  line plot group by shape_id, combined with several rectangles in previous figure (two legends, two ellipses, grid on)
  (The "groupby" method is referenced from Group Whale.)

* Explanation: 

  I set the shapes of top 10 routes to be color black, and set the shapes of routes with single trip to be color lightgray. In this way, we can intuitively distinguish the two groups. In addition, I add several rectangles of the highest density of stops from previous figure, which can help to correlate with the two figures, and to find if high/low density means more/less trips of that route.

## 3. Shapes of Routes

### Figure 7: Shapes in their Routes' Colors
To get an overview of how shapes look like for each route, I make a line plot of all shapes in their routes' colors. This figure can be used to make comparisons with previous figures.

* Approach: 

  line plot group by shape_id (legend of route colors, grid on)

* Explanation: 

  One shape corresponds to one route, and a route can have multiple shapes. My first preprocessing work is to find the correlation between shape_id and route_color, by virtue of several datasets. To display the legend, I manually set the names of each color, since several routes share the same color. I turn on the grid lines to help better locate the positions.

## 4. Bus Speeds for Shapes and Routes

### Figure 8:

* Approach: 

  ...

* Explanation: 

  ...

### Figure 9:

* Approach: 

  ...

* Explanation: 

  ...

## Contributions of Members

* Hui Lyu: 
  The first seven figures in Jupyter Notebook using Python  

* Yuwei Chen:
 SQL for data cleaning and preprocessing
 ...
