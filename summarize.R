summarizeData<-function(data){
  #summarizes data by subject and activity
  data %>%
    group_by(subject,activity) %>%
    summarise_each(funs(mean))
}