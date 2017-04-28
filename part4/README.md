# Infographic - Data Visualization & Analysis of CUMTD
### Author: Hui Lyu of Group Athena
The published infographic can be found here: https://magic.piktochart.com/output/21910169-cumtd

The tool is Piktochart: https://piktochart.com/

## Overview of Datasets

* Period of Dates: 12/18/2016 to 05/13/2017
* 2496 Stops, 101 Routes, 21 Route Colors, 5498 Trips, 677 Shapes

Firstly, the sum of these attributes have been calculated and displayed on the infographic. Each icon is carefully selected to represent the attributes.

## Basic Prerequisites

There are multiple files in the given dataset: 

* stops, stop_times, trips, routes, shapes, agency, calendar, calendar_dates, fare_rules, fare_attributes

To better understand the relationships between the above attributes, several key prerequisites have been emphasized:

* A trip has multiple stops.
* A route can have multiple shapes. 
* A route can be shared with multiple trips.
* A shape can be shared with multiple trips.

Based on the existing figures in Part 1, several questions can be answered to make a brief analysis of the whole dataset.

## 1. How are stops located?

* Figure: Location of Bus Stops
* Figure: Location of Bus Stops on Google Map

The two figures accompanied with two circles are displayed to answer this question.

### Answer:
* Widely distributed in Champaign-Urbana
* Centralized in some specific areas

## 2. How many trips are there on each route?

* Figure: Distribution of Routes with Different Numbers of Trips
* Figure: Top 10 Routes with Most Number of Trips for Each Route

The two figures are demonstrated to answer this question.

### Answer:
* Trips are not evenly distributed on routes. (Routes of the same color may split up.)
* There is a route which does not have any trip. It is "BRONZE YANKEE RIDGE".

## 3. Does number of trips for each route correlate with stop density?

* Figure: Density of Bus Stops of CUMTD
* Figure: Shapes of Routes with Most/Least Number of Trips

The two figures are demonstrated to answer this question.

### Answer:
* Routes with most number of trips mainly go through campus area.
* Routes with only one trip go through campus area and other remote areas.
* High/low stop density does not mean more/less frequent trips of route there.

## 4. How do shapes of each route look like?

* Figure: Shapes in their Routes' Colors

The above figure is shown to answer this question.

### Answer:
* Most shapes are parallel with lines of longitude or latitude.
* Routes of different colors may share parts of shapes.
* A single color may represent a series of routes.

## 5. How quickly do buses go?

* Figure: Speed of Route Orange
* Figure: Average Speed of Each Shape
* Figure: Shapes in their Routes' Colors

The above three figures are shown to answer this question.

### Answer:
* The speed of a trip of Route ORANGE begins increasing after that bus stop.
* Buses go slowly at these areas: W University Ave, N Romine St & Beslin St & Fairview Ave, S Oak St & Hazelwood Dr & Gerty Dr
* Buses go slowly during parts of these routes: Orange, Grey, Yellow and Green Series

## 6. What is the fare of CUMTD?

### Answer:
There are two types of fare rules. 

1. Normal: price $1
2. iStop: price $0

I compose a chart in Piktochart to display the distribution of fare type among all the routes of CUMTD. 

56 routes (55.45%) are in normal fare rule. 45 routes (44.55%) are in iStop fare rule.

In addition, CUMTD is free for any UI student with an iCard.

## 7. Conclusion

CUMTD has:

* Wide Coverage
* Ample Lines
* Low Speed
* Low Fare
