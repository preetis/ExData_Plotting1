#Purpose of plot2.R file:
## --defines function- plot2() used to generate line plot for Global active power vs datetimestamp as per Plot 2
# -----------------------------------------------------
#Function: plot2()
##Purpose:
### --generate line plot for a data frame with 2 columns where x-axis=1st col, y-axis=2nd col. Plot generated on screen if no file name is provided
### --provides the option to save the plot to a png file with dimensions 480x480 with grey background if a file name is provided
##Parameter List:
#### df : Data frame for which line plot is generated. x-axis=1st col of data frame, y-axis=2nd col of data frame
#### xlab_var : Variable to set the label for the x-axis. Default is empty string
#### ylab_var : Variable to set the label for the y-axis. Default is empty string
#### ylab_var : Variable to set the label for the y-axis. Default is empty string
#### color_var : Variable to set the color of line/point to be plotted. Default is black
#### main_var : Variable to set the title for the plot. Defailt is empty string
#### type_var : Variable to set the type of plot. Default is line plot
#### file_var : Variable to set the file name of the output png file in case user chooses to save the plot. Default is null

plot2 <- function (df, xlab_var="", ylab_var="", color_var="black", main_var = "", type_var="l", file_var=NULL) {
  #Check if file name is provided
 if (length(file_var)==0) { #No file name provided, hence display the graph on screen
   #Plot the line plot based on the parameters supplied to the function
   plot(df[c(1,2)], xlab=xlab_var, ylab=ylab_var, type=type_var, main = main_var)
 }
 else { #File name provided, hence graph output will be sent to customized png device
   #Define the parameters for the png device-480x480 pixels and having background as "grey"
   png(file_var,  width = 480, height = 480, units = "px", bg="grey")
   
   #Plot the line plot based on the parameters supplied to the function
   plot(df[c(1,2)], xlab=xlab_var, ylab=ylab_var, type=type_var, main = main_var)
   
   #Close the png graphic device
   dev.off()
 }
}
