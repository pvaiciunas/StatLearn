
xts_to_df <- function(xts_object) {
  
  # This function takes in the xts objects created by quantmod and makes them 
  # a dataframe with the date as a variable. REmoves the rownames
  
  output <- as.data.frame(xts_object)
  output$date <- rownames(output)
  rownames(output) <- NULL
  output
  
}
