# Data Visualization & Analysis of Distribution of IMLS Grants
### Authors: QI QI & Yuxiang Ling of Group Athena

This part of Data Visualization aims to generate a series of interactive figures to make analysis of distribution of Grants and its relationship with GDP by state. 

Grant Data sources can be found at https://data.imls.gov/Administrative-Data/Administrative-Discretionary-Grants-FY-1996-2014-/kf5m-pcwv.

The GDP Data by state can be found at https://commons.wikimedia.org/wiki/Data:Bea.gov/GDP_by_state.tab. 

## 1. Grants Program Type Contribution

### Figure: Grants Program Type Distribution
For this part of code, I refer to the previous assignment on defining a class in course LIS590DV, and then pass the csv dataset into it.

![Grants Program Type Distribution](https://github.com/huilyu2/project-spring2017/blob/master/part2/Output%20Images/Grants%20Program%20Type%20Distribution.png)

* Approach: 

  barplot (x-axis represents the type of Grants Progtam; y-axis represents the amount of each type)

* Explanation: 

 About the question of "What types of grants are supported by IMLS", I think this is an frequency amount distribution plot. At first, I tried to use histgram, but it can not define the specific x-asxis and y-axis. Histgram always records the repeating time of the number within data.
 
 After that, I used barplot, which can decide the x-axis and y axis. I used the xticks() function to replace the numeric number with the charactor, which is the type of grants program. I also sorted the data with the descending sequence, and show the exact number on the top of each bar.
 
 * Conclusion:
 
 From the plot, we can see each type of Grants Program and their exactly number. "IA" is the most popular Grants Program type.
 
 We can clearly see three clusters, the most popular part starts with "I", whcih included "IA, IC, IG, IL, IM, IS"; the second part starts with "L", which included "LE, LG, LI, LL, LT"; the third part starts with "M", which included "MA, MG, MH, ML, MN, MP"; the forth part starts with "N", which included "NC, ND, NE, NG, NL, NO, NP, NR", and the last two parts starts with "R" and "S", which is included "RE, SP, ST". 
 
 There shows the descending trend from the plot. And there is really big difference between the most and the least popular type. From program type starts with "I" and "M", there are two sharp decline gaps, which separate the whole plot into three part approximately (the most popular, middle, the least popular).


## 2. The grants distributed across the United States

### Figure: Distribution of the grants distributed across the United States

I used plotly to make a map to see the distribution and the cluster of the grants.

For this part of code, I refer the example code of plotly and the method of how to make the markers correspond with the color scale and text showing bug was discussed with Yingjun's team.

![Grants Program Type Distribution](https://github.com/huilyu2/project-spring2017/blob/master/part2/Output%20Images/Out%20put%20of%20Part3%20Q2)

* Approach: 

  Plotly scatter map (Total Amount Awarded and Disbursed)

* Explanation: 

  The size of the markers are based on the number of the total amount awarded and disbursed. I seperate the data into 5 groups allowed us to see the data of different amount by click the legend. The detail data can be showed by move the cursor on the markers including the latitude, lontitude, name of the program, Total Amount Awarded and Disbursed, and the sate. We could find that most program are located on the east part of USA main land. Most of the big brograms (have bigger amount awarded) are located on the east part of USA main land. There are few program have total amount awarded bigger than 1 million.
  
 In the first version of this part, I used the baground map of USA just like the example in the plotly offical guide. However, some of the data can not be showed on the map and the text box can not be showed neither. The reason for this bug is that some programs are not in the main land of USA which is out of the baground map. I chose not to delete the outliners but to use a bigger map, so I changed the baground map to north American map and it showed the data and text successfully. 
 
 * Conclusion: 
 
 The largest and the most dense part of the Total Amount Awarded acorss America is concentrate on the east part, like New York these kind of large-scale city. And also there is a cluster around Chicago, which is the largest city within the middle part of the US. This is reasonable. There are more people and more organizations in such vibrant region, which are more likely to get more awarded amount.
 
## 3. GDP Compared with the Grants Amount by state.

### Figure 1: GDP vs Grants Amount by state based on American map
To get an overview of the relationship between the economic factors in a zip code and the grants from IMLS, I make a plot based on the North America map with plotly.

![Grants Program Type Distribution](https://github.com/huilyu2/project-spring2017/blob/master/part2/Output%20Images/Interaction%20of%20GDP%20vs%20Grants%20Amount%20by%20State.png)

* Approach: 

  Interactive plot with plotly which is composed of data and layout.

* Explanation: 

 In this part, I think "the economic factors in a zip code" means the GDP of every state in America. So I collect GDP data by state within the scope of years and try to combine this data together with Grants Amount data.
 I used colorbar to show the amount of GDP, and when we point to each state, it will show the state name, the exact GDP and the Grants Amount. I chose 2005 year, and draw the plot.
 
 * Conclusion:
 
 American GDP is higher in west coast, like California; in east coast, like New York; and in Texas and Florida. In these area, Grants are likely to get higher total rewarded amount. We can see the exactly Grants Amount when we move the mouse to each state. 

### Figure 2: Relation between GDP and Grants Amount
To get an specific view of the relationship between the economic factors in a zip code and the grants from IMLS, I make a compared plot with the Bokeh framework.

![Grants Program Type Distribution](https://github.com/huilyu2/project-spring2017/blob/master/part2/Output%20Images/Relation%20between%20GDP%20and%20Grants%20Amounts.png)

* Approach: 

  Interactive plot with Bokeh framework which is composed of right and left figure with TOOLS.

* Explanation: 

 In this part, I think we should know the trend of the GDP and Grants Amount distributions and their relationship. So I take advantage of Bokeh, to set the GDP and Grants Amount as right and left fighure, which is easier to compare with.
 And we can use Bokeh to box select the specific points and see these data clearly. 
 
 But with Bokeh, the axes should be numeric, which can not shown as character type. So I just put the exact state name ordered by first capital letter, which is corresponding to the number 1~51. 
 
 Besides, I also want to add the "year" label to show the variace with time. So I tried to use box widgets to make a list to choose from. But I had some hard time to load in the data, and changed the data by the drop-down list. I wish I cound achieve this function in the future.
 
 * Conclusion:
 
 From the plot, we can select each state and see the corresponding GDP and total Grants Amount. Basiclly, there is a stable rule: A state with higher GDP, this state is more likely to have higher total Grants Amount. 

## Contributions of Members

* Qi Qi: 
  Part 1 and Part 3 in Jupyter Notebook using Python  

* Yuxiang Ling:
 Part 2 in Jupyter Notebook using Python
