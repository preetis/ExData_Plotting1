#Purpose of plot1.R file:
## --defines function- plot1() used to generate frequency histogram for Global Active Power as per Plot 1
# -----------------------------------------------------
#Function: plot1()
##Purpose:
### --generate a frequency histogram based on the parameters supplied. Plot generated on screen if no file name is provided
### --provides the option to save the plot to a png file with dimensions 480x480 with grey background if a file name is provided

##Parameter List:
#### x : Variable for which frequency histogram needs to be generated
#### xlab_var : Variable to set the label for the x-axis. Default is empty string
#### ylab_var : Variable to set the label for the y-axis. Default is empty string
#### ylab_var : Variable to set the label for the y-axis. Default is empty string
#### color_var : Variable to set the color of bars. Default is black
#### main_var : Variable to set the title for the plot. Defailt is empty string
#### file_var : Variable to set the file name of the output png file in case user chooses to save the plot. Default is null

plot1 <- function (x, xlab_var="", ylab_var="", color_var="black", main_var = "", file_var=NULL) {
  #Check if file name is provided
  if (length(file_var)==0) { #No file name provided, hence display the graph on screen
    #Plot the frequency histogram based on the parameters supplied to the function
    hist(x, xlab = xlab_var, ylab= ylab_var, main=main_var, col = color_var, freq = TRUE)
  }
  else { #File name provided, hence graph output will be sent to customized png device
    #Define the parameters for the png device-480x480 pixels and having background as "grey"
    png(file_var,  width = 480, height = 480, units = "px", bg="grey")
    
    #Plot the frequency histogram based on the parameters supplied to the function
    hist(x, xlab = xlab_var, ylab= ylab_var, main=main_var, col = color_var, freq = TRUE)
    #Close the png graphic device
    dev.off()
  }
}