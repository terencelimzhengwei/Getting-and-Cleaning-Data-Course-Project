rename_features<-function(features){
  #make features more readable
  features %>%
    gsub("^t","time.",.) %>%
    gsub("^f","freq.",.) %>%
    gsub("-",".",.) %>%
    gsub("\\(\\)","",.)
}