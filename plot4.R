#Purpose of plot4.R file:
## --defines function plot4 used to generate multiple graphs on the same plot as per Plot 4:
##  1) Line plot for Global Active Power vs DateTimestamp
##  2) Line plot for Voltage vs DateTimestamp
##  3) Line plot for Energy sub metering vs DateTimestamp with legends and annotations for different groups
##  4) Line plot Global Reactive Power vs DateTimestamp
# -----------------------------------------------------
#Function: plot4()
##Purpose:
### --function to generate multiple line graphs on the same plot as identified above
### --Plot generated on screen if no file name is provided
### --Provides the option to save the plot to a png file with dimensions 480x480 with grey background if a file name is provided
##Parameter List:
#### df : Data frame for which line plot is generated
#### file_var : Variable to set the file name of the output png file in case user chooses to save the plot. Default is null

plot4 <- function (df, file_var=NULL) {
  #Use the plot2 and plot3 functions defined in plot2.R and plot3.R to generate the multiple graphs on screen
  if (length(file_var)==0) {
    #Set the mfrow parameter to display 4 graphs on the same plot with 2 graphs in each line
    par(mfrow = c(2,2), mar=c(4,4,2,2))
    
    #Call to the plot2() and plot3() functions with appropriate parameters set to generate the graphs for Plot 4
    plot2(df = select(df,dt, Global_active_power), ylab_var = "Global Active Power")
    plot2(df = select(df,dt, Voltage), ylab_var = "Voltage", xlab_var = "datetime")
    plot3(df = select(df,dt, Sub_metering_1, Sub_metering_2, Sub_metering_3), ylab_var = "Energy sub metering", leg_col = c("black","red","blue"), leg_label = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    plot2(df = select(df,dt, Global_reactive_power), ylab_var = "Global_reactive_power", xlab_var = "datetime")
  }
  else {
    #Define the parameters for the png device-480x480 pixels and having background as "grey"
    png(file_var,  width = 480, height = 480, units = "px", bg="grey")
    
    #Set the mfrow parameter to display 4 graphs on the same plot with 2 graphs in each line
    par(mfrow = c(2,2), mar=c(4,4,2,2))
    
    #Call to the plot2() and plot3() functions with appropriate parameters set to generate the graphs for Plot 4
    plot2(df = select(df,dt, Global_active_power), ylab_var = "Global Active Power")
    plot2(df = select(df,dt, Voltage), ylab_var = "Voltage", xlab_var = "datetime")
    plot3(df = select(df,dt, Sub_metering_1, Sub_metering_2, Sub_metering_3), ylab_var = "Energy sub metering", leg_col = c("black","red","blue"), leg_label = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    plot2(df = select(df,dt, Global_reactive_power), ylab_var = "Global_reactive_power", xlab_var = "datetime")
    
    #Close the png graphic device
    dev.off()
  }
}


