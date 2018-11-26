ds_helper=function(type, dataset, col, rpt_obj, funk, df_flds, rnd)
{
  #################################################################################################
    #CREATED BY: Karl J. Jurek
    #CREATION DATE: 25 Nov 2018
    #LAST UPDATED: 25 Nov 2018
    #types are:
      #'data' - creates objects based on the function that is passed in
      #'report' - creates a simple report based on the previous created objects
    #dataset is the dataset that is to be used
    #col is the specific column to be accessed in the data set
    #funk is the function to be called
      #built in functions, such as 'median', can be passed individually or
      #if you want to pass in two or more functions to create a vector it can do that as well
        #EXAMPLE:  
          #rses_mean_and_sd=ds_helper(dataset=sleep_data, col="RSES", funk=c(mean,sd))
          #results in:  rses_mean_and_sd equal to [1] 18.114943  6.176522
    #report allows for three options using the 'funk' object
      #make - will create the report data field based on predetermined objects
        #fnk_report - the dataframe that will be passed back with the desired data
        #df_fields - the object's values desired in the report
      #rename - will rename the columns of the report based on the values in the 'df_fields' object 
        #rpt_obj - the report data frame that the names are going to be changes on
        #df_flds - the new column names      
      #round - will round the values in the report based on the value passed in the 'rnd' object
        #rpt_obj - the report data frame whose values are going to be rounded
        #rnd - the number of decimals to round the values in the report
  #################################################################################################
  
  if (type=="data")
  {
    #creates an object based on the length(size) of the values in the 'funk' variable
    result=c(length(funk))
    if (length(funk)<1)
    {
      #some error message - not added yet KJJ 11/25/2018
    }
    else
    {
      if (length(funk)==1)
      {
        #performs the function that is passed
        result=funk(dataset[, col], na.rm=TRUE)
      }
      else
      {
        #if the funk object has more than one function to be performed it will loop through each
        #function and place the results in one vector
        for (i in 1:length(funk))
        {
          result[i]=funk[[i]](dataset[, col], na.rm=TRUE)
        }
      }
      return(result)
    }
  }
  else if (type=="report")
  {
    #this will create a data frame based on the values of the objects passed
    if (funk=="make")
    {
      #creates a data frame based on the number of objects passed 
      fnk_report=data.frame(length(df_flds))
      
      #adds the values of the objects that were passed into the data frame
      for (i in 1:length(df_flds))
      {
        fnk_report[i]=data.frame(df_flds[i])
      }
      
      return(fnk_report)
      
    }
    else if (funk=="rename")
    {
      #renames the column names for the data frame that was passed in with the 
      #values passed into df_flds 
      names(rpt_obj)=df_flds
      
      return(rpt_obj)
    }
    else if (funk=="round")
    {
      
      #rounds any values of the passed data frame to the number of decimals indicated in 'rnd'
      rpt_obj=round(rpt_obj, digits=rnd)
      
      return(rpt_obj)
    }
  }
}