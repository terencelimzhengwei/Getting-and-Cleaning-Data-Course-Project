run_analysis<- function(){
  #load relevant libraries
  library(dplyr)
  library(tidyr)
  
  #load source files
  source("prepareData.R")
  source("summarize.R")
  
  #read activity labels and features
  activity_label<- tbl_df(read.table("./data/activity_labels.txt"))
  activity_label<- activity_label[[2]]
  features<- tbl_df(read.table("./data/features.txt"))
  features<- features[[2]]
  
  #prepares the train/test data
  trainData<-prepare_data("train",features,activity_label)
  testData<- prepare_data("test",features,activity_label)
  
  #join test and train data together
  mergeData<- bind_rows(trainData,testData)
  
  #summarizes data by subject and activity
  summarizedData<- summarizeData(mergeData)
  
  #save data as csv
  write.csv(mergeData, file.path("./merged_data.csv"), row.names = FALSE)
  write.csv(summarizedData, file.path("./summarized_data.csv"), row.names = FALSE)
  write.table(summarizedData, file.path("./summarized_data.txt"), row.names = FALSE)
  
  return (summarizedData)
}