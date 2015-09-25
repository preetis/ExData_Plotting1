#Purpose of plot3.R file:
## --defines function- plot3() used to generate line plot for energy sub-metering (No. 1, 2, 3) in 3 different colors vs datetimestamp as per Plot 3
# -----------------------------------------------------
#Function: plot3()
##Purpose:
### --uses function plot_graph() defined in this file to generate line plot for a data frame with 4 columns where x-axis=1st col, y-axis=2nd col, 3rd col, 4th col of data frame of which need to annotated in the graph with different colors
### --Plot generated on screen if no file name is provided
### --Provides the option to save the plot to a png file with dimensions 480x480 with grey background if a file name is provided
### --Generates a legend based on the annotation used to represent the different groups in the data 
##Parameter List:
#### df : Data frame for which line plot is generated. x-axis=1st col of data frame, y-axis=2nd col, 3rd col, 4th col  of which need to annotated in the graph with different colors
#### xlab_var : Variable to set the label for the x-axis. Default is empty string
#### ylab_var : Variable to set the label for the y-axis. Default is empty string
#### ylab_var : Variable to set the label for the y-axis. Default is empty string
#### color_var : Variable to set the color of line/point to be plotted. Default is black
#### main_var : Variable to set the title for the plot. Defailt is empty string
#### type_var : Variable to set the type of plot. Default is line plot
#### leg_col : Character vector specifying the 3 different colors to be used for annotating the different groups of data points
#### leg_label : Character vector specifying the 3 different labels to be used for annotating the different groups of data points in the legend
#### file_var : Variable to set the file name of the output png file in case user chooses to save the plot. Default is null

plot3 <- function (df, xlab_var="", ylab_var="", color_var="black", main_var = "", type_var="l", leg_col=NULL, leg_label=NULL, file_var=NULL) {
  if (length(file_var)==0) {#No file name provided, hence display the graph on screen
    #Use the plot_graph function defined in this file to plot the required graph on screen with the legends
   plot_graph(df, xlab_var, ylab_var, color_var, main_var, type_var, leg_col, leg_label)
  }
  else { #File name provided, hence graph output will be sent to customized png device
    #Define the parameters for the png device-480x480 pixels and having background as "grey"
    png(file_var,  width = 480, height = 480, units = "px", bg="grey")
    #Use the plot_graph function defined in this file to plot the required graph with the legends
    plot_graph(df, xlab_var, ylab_var, color_var, main_var, type_var, leg_col, leg_label)
    #Close the png graphic device
    dev.off()
  }
}


#Function: plot_graph()
##Purpose:
### --function to generate line plot for a data frame with 4 columns where x-axis=1st col, y-axis=2nd col, 3rd col, 4th col of data frame of which need to annotated in the graph with different colors
### --Generates a legend based on the annotation used to represent the different groups in the data 
##Parameter List:
#### df : Data frame for which line plot is generated. x-axis=1st col of data frame, y-axis=2nd col, 3rd col, 4th col  of which need to annotated in the graph with different colors
#### xlab_var : Variable to set the label for the x-axis
#### ylab_var : Variable to set the label for the y-axis
#### ylab_var : Variable to set the label for the y-axis
#### color_var : Variable to set the color of line/point to be plotted
#### main_var : Variable to set the title for the plot
#### type_var : Variable to set the type of plot
#### leg_col : Character vector specifying the 3 different colors to be used for annotating the different groups of data points
#### leg_label : Character vector specifying the 3 different labels to be used for annotating the different groups of data points in the legend

plot_graph <- function(df, xlab_var, ylab_var, color_var, main_var, type_var, leg_col, leg_label) {
  plot(df[c(1,2)], xlab=xlab_var, ylab=ylab_var, type="n")
  points(df[c(1,2)], type=type_var, col=leg_col[1])
  points(df[c(1,3)], type=type_var, col=leg_col[2])
  points(df[c(1,4)], type=type_var, col=leg_col[3])
  legend("topright",lty=1,col = leg_col, legend = leg_label)
}

