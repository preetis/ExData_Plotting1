#Purpose of plotMenu.R file:
## --defines function- plotMenu() which generates an interactive user driven menu to generate the different graphs- Plot 1, Plot 2, Plot 3, and Plot 4 iteratively
## --By default, the code displays the graph on the screen but does provide the user with a sub-menu where the user can choose to save the graph to a png file identified by filename- "plot<#>.png"
# -----------------------------------------------------
#Function: plotMenu()
##Purpose:
### --accepts the data frame passed to it during call from prepData.R file which has the data frame containing all the data required for plotting
### --uses the interactive menu to accept user's choice of which plot to generate and passes the appropriate data columns to generate the required graphs
##Parameter List:
#### df : Data frame containing all required records and data elements for for generating Plots 1 through 4

plotMenu <- function(df)
{
  #Check if there are any open graphics devices, if yes close them all before proceeding
  while (dev.cur()>1) {
    dev.off()
  }
  
  #Clear the console
  cat(rep("\n",50))
  
  #User menu provided to plot the 4 different graphs. Each selection has a submenu which provides the option to save the plot as .png
  switch(menu(c("Plot 1","Plot 2","Plot 3","Plot 4","Exit"),title="Choose graph to plot:"),
         {
           #Draw Plot 1 by calling the plot1 function in plot1.R file
           plot1(x=df$Global_active_power, xlab_var = "Global Active Power (kilowatts)", ylab_var = "Frequency", main_var = "Global Active Power", color_var = "red")
           #Provide user the option to save the plot
           switch(menu(c("Save to plot1.png","Quit"),title = "Save option"),
                  {
                    dev.off()
                    #Calling plot1 function in plot1.R file with png file name passed as parameter
                    plot1(x=df$Global_active_power, xlab_var = "Global Active Power (kilowatts)", ylab_var = "Frequency", main_var = "Global Active Power", color_var = "red", file_var = "plot1.png")
                    plotMenu(df)
                  },
                  {
                    dev.off()
                    plotMenu(df)
                  }
                  )
         },
         {
           #Draw Plot 2 by calling plot2 function in plot2.R file
           plot2(df = select(df,dt, Global_active_power), ylab_var = "Global Active Power (kilowatts)")
           #Provide user the option to save the plot
           switch(menu(c("Save to plot2.png","Quit"),title = "Save option"),
                  {
                    dev.off()
                    #Calling plot2 function in plot2.R file with png file name passed as parameter
                    plot2(df = select(df,dt, Global_active_power), ylab_var = "Global Active Power (kilowatts)", file_var = "plot2.png")
                    plotMenu(df)
                  },
                  {
                    dev.off()
                    plotMenu(df)
                  }
           )
         },
         {
           #Draw Plot 3 by calling plot3 function in plot3.R file
           plot3(df = select(df,dt, Sub_metering_1, Sub_metering_2, Sub_metering_3), ylab_var = "Energy sub metering", leg_col = c("black","red","blue"), leg_label = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
           #Provide user the option to save the plot
           switch(menu(c("Save to plot3.png","Quit"),title = "Save option"),
                  {
                    dev.off()
                    #Calling plot3 function in plot3.R file with png file name passed as parameter
                    plot3(df = select(df,dt, Sub_metering_1, Sub_metering_2, Sub_metering_3), ylab_var = "Energy sub metering", leg_col = c("black","red","blue"), leg_label = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), file_var = "plot3.png")
                    plotMenu(df)
                  },
                  {
                    dev.off()
                    plotMenu(df)
                  }
           )
         },
         {
           #Draw Plot 4 by calling plot4 function in plot4.R file
           plot4(df)
           #Provide user the option to save the plot
           switch(menu(c("Save to plot4.png","Quit"),title = "Save option"),
                  {
                    #Calling plot4 function in plot4.R file with png file name passed as parameter
                    plot4(df, file_var = "plot4.png")
                    plotMenu(df)
                  },
                  {
                    dev.off()
                    plotMenu(df)
                  }
           )
         },
         {
           #Exit the menu and close any open graphics devices
           if(dev.cur()>1) {
             dev.off()
           }
         }
         )
}