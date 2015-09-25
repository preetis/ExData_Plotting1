#Purpose of prepData.R file:
## --Load the required data for- "Individual household electric power consumption Data Set" into R for exploratory analysis
## --Prepare the data elements required for plotting the graph
## --Call function plotMenu() to provide users with interactive option to generate/save the required graphs

#Set working directory to location where the file is set
setwd("~/OneDrive/Coursera/ExpDataAnalysis/Wk1/Project/ExData_Plotting1")

#Load package- sqldf to pick relevant rows from data based on the date field
library(sqldf,logical.return = TRUE)
#Load package- dplyr to allow data frame manipulations
library(dplyr, logical.return = TRUE)

#Create file object to point to the file containing the data for the project
file1<-file("household_power_consumption.txt")

#Extract rows from the file where the Date is either '01 Feb 2007' or '02 Feb 2007' 
df<-sqldf("Select * from file1 where Date in ('1/2/2007','2/2/2007')",file.format = list(header = TRUE, sep=";"))
#Close the SQL connection
closeAllConnections()

#Create a new column-"dt" containing the date timestamp based on the Date and Time field in the original dataset
df$dt <- strptime(paste(df$Date,df$Time),format="%d/%m/%Y %H:%M:%S")

#Source all the code files required for plotting the graph
source('plot1.R')
source('plot2.R')
source('plot3.R')
source('plot4.R')
source('plotMenu.R')

#Generate required plots
plotMenu(df)