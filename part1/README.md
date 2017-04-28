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

* Approach: 

  binning in 2D (longitude and latitude as axes, with a color bar, add two ellipses)

* Explanation: 

  Firstly,


## 2. Routes with Different Numbers of Trips

* Why you took the approach you did
* Strengths of your approach
* Weaknesses of your approach
* What you wished you had been able to do (if anything)

## 3. Shapes of Routes

* Why you took the approach you did
* Strengths of your approach
* Weaknesses of your approach
* What you wished you had been able to do (if anything)

## 4. Bus Speeds for Shapes and Routes

* Why you took the approach you did
* Strengths of your approach
* Weaknesses of your approach
* What you wished you had been able to do (if anything)


## Contributions of Members
* Hui Lyu: 

* Yuwei Chen:
1. SQL for data cleaning and preprocessing
