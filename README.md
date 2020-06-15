# Game Theory in Wireless communication Networks

# Social choice based computation to locate base stations

**Problem Statement** : This problem focuses on the challenges of social choice when there are n (=5 )alternatives, say {a, b, c, d, e}. Consider the following social choice function where (i) each individual provides a ranking of the alternatives and (ii) each alternative receives a number of votes for each first, second, third, fourth and fifth place ranking.


The number of votes for each alternative is calculated as follows:

Number of Votes = 10 × (# 1st Place Rankings) + 5 × (# 2nd Place Rankings) + 4 × (# 3rd Place Rankings)+ 3 × (# 4th Place Rankings)+ 1 × (# 5th Place Rankings) 

Now apply the concept above to a Base Station location  problem. Where  there are 5 alternative locations are there for each cell and there are 100 base station to be located. Operators use public voting to find the best location. Consider there are 10 lakh people reside in the city.

Write a suitable MATLAB code to solve the problem and find the selected location.

**Problem Solution Approach**

*Assumptions taken for simplifying the computation in absence of hard conditions and extra information have been stated below*

1. The region is divided into 100 hexagonal cells, Each cell will have one base station

2. 5 Random locations in a cell have been generated as alternatives

3. To ease the computation the population has been considered to be evenly distributed in the region. 10lakhs people are uniformly distributed in 100 cells, resulting in 10,000 people per cell

4. Using random permutation function in matlab, ranking has been allocated by 10,000 people living in the specific cells for 
alternatives among which the best one, i.e. one having maximum vote sum will be allocated location for base station

5. Weightage to the ranking has been provided as mentioned in the problem statement, final sum of votes has been taken considering with this data.


**To run the code**

* Requirements : Matlab 2020a (May work with previous versions too, not tested yet)

**Results**

* Final figure showing allocation of all 100 base stations in the city

* bstation_location.csv having the data and information of the location for all the cells

col 1 - serial number of the cell

col 2 - X coordinate of the base station

col 3 - Y coordinate of the base station




