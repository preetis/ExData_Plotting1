## Introduction

This assignment uses data from
the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>, a popular repository for machine learning
datasets. In particular, we will be using the "Individual household
electric power consumption Data Set" which I have made available on
the course web site:


* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb]

* <b>Description</b>: Measurements of electric power consumption in
one household with a one-minute sampling rate over a period of almost
4 years. Different electrical quantities and some sub-metering values
are available.


The following descriptions of the 9 variables in the dataset are taken
from
the <a href="https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption">UCI
web site</a>:

<ol>
<li><b>Date</b>: Date in format dd/mm/yyyy </li>
<li><b>Time</b>: time in format hh:mm:ss </li>
<li><b>Global_active_power</b>: household global minute-averaged active power (in kilowatt) </li>
<li><b>Global_reactive_power</b>: household global minute-averaged reactive power (in kilowatt) </li>
<li><b>Voltage</b>: minute-averaged voltage (in volt) </li>
<li><b>Global_intensity</b>: household global minute-averaged current intensity (in ampere) </li>
<li><b>Sub_metering_1</b>: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). </li>
<li><b>Sub_metering_2</b>: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. </li>
<li><b>Sub_metering_3</b>: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.</li>
</ol>

## Loading the data
When loading the dataset into R, please consider the following:

* The dataset has 2,075,259 rows and 9 columns. First
calculate a rough estimate of how much memory the dataset will require
in memory before reading into R. Make sure your computer has enough
memory (most modern computers should be fine).

* We will only be using data from the dates 2007-02-01 and
2007-02-02. One alternative is to read the data from just those dates
rather than reading in the entire dataset and subsetting to those
dates.

* You may find it useful to convert the Date and Time variables to
Date/Time classes in R using the `strptime()` and `as.Date()`
functions.

* Note that in this dataset missing values are coded as `?`.

## Making Plots

Our overall goal here is simply to examine how household energy usage
varies over a 2-day period in February, 2007. Your task is to
reconstruct the following plots below, all of which were constructed
using the base plotting system.

First you will need to fork and clone the following GitHub repository:
[https://github.com/rdpeng/ExData_Plotting1](https://github.com/rdpeng/ExData_Plotting1)


For each plot you should

* Construct the plot and save it to a PNG file with a width of 480
pixels and a height of 480 pixels.

* Name each of the plot files as `plot1.png`, `plot2.png`, etc.

* Create a separate R code file (`plot1.R`, `plot2.R`, etc.) that
constructs the corresponding plot, i.e. code in `plot1.R` constructs
the `plot1.png` plot. Your code file **should include code for reading
the data** so that the plot can be fully reproduced. You should also
include the code that creates the PNG file.

* Add the PNG file and R code file to your git repository

When you are finished with the assignment, push your git repository to
GitHub so that the GitHub version of your repository is up to
date. There should be four PNG files and four R code files.


The four plots that you will need to construct are shown below. 


### Plot 1


![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 


### Plot 2

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 


### Plot 3

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4.png) 


### Plot 4

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png) 

# #################################################################################################################
<b>EXPLORATORY ANALYSIS FOR DATASET- "Individual household electric power consumption Data Set" FROM UCI </b>
<b>Assumption:</b>
  * All the R files and data files are in the working directory
  * The code does not use dev.copy() as the result of this function may not be identical to the original as mentioned in the coursework
  * Based on initial analysis of data: 
      * all distinct month and date values in the Date column in the file, it was observed that single digit month/date value are not padded with extra 0. Hence, the logic to filter the records based on date uses the date value- '1/2/2007' and '2/2/2007' 
      * No null values identified in the data for the date range specified and hence no specific missing value handling has been done

<b>
<ol>
<li>Source the R script file- prepData.R:
    * The script file sets the working directory where all the data and R files are present
    * Load the data file using the sqldf function and read only those records into a data frame-"df" where date is either '1 Feb 2007' and '2 Feb 2007'
    * Adds a new column- "dt" to the dataframe which is the datetimestamp value computed based on concatenation of Date and Time column
    * Once all required columns are computed, the function plotMenu() is called by passing the data frame- "df" to the function
</li>
<li> Function plotMenu in file- plotMenu.R:
    * Provides a user driven menu to generate the required graph on screen and also provides option to save the graph as png
    * User needs to select one out of the 5 options displayed on the screen to generate the :
        <ol>
        <li> Plot 1 : Generates Plot 1</li>
        <li> Plot 2 : Generates Plot 2</li>
        <li> Plot 3 : Generates Plot 3 </li>
        <li> Plot 4 : Generates Plot 4 </li>
        <li> Exit : Exits from the interactive menu </li>
        </ol>   
    * The option to save the graph as png is provided once the plot is generated on screen. 
</li>
<li> Based on the plot selected by the user to be generated, different plotting functions are called:
        * plot1 function to plot the graph shown in Plot 1 : Detailed description present in plot1.R
        * plot2 function to plot the graph shown in Plot 2 : Detailed description present in plot2.R
        * plot3 function to plot the graph shown in Plot 3 : Detailed description present in plot3.R
        * plot4 function to plot the graph shown in Plot 4 : Detailed description present in plot4.R
    * Any png file saved will be present in the working directory and with the name "plot<#>.png" with width 480 and height 480 pixel and a grey background as shown in the sample graphs
</li>
</ol>

