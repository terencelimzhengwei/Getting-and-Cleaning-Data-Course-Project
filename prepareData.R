prepare_data<-function(dataType,features,activityLabel){
  source("rename_features.R")
  
  #prevent unwanted errors due to wrong input
  if(dataType %in% c("test","train")== FALSE ){
    stop("ERROR. DataType must be \"test\" or \"train\".")
  }
  
  #save file names to variables
  trainFileName<-paste("X_",dataType,".txt",sep="")
  subjectFileName<-paste("subject_",dataType,".txt",sep="")
  yFileName<- paste("y_",dataType,".txt",sep="")
  
  #reads data into variables
  x<- tbl_df(read.table(file.path("./UCI HAR Dataset",dataType,trainFileName)))
  subject_data<-tbl_df(read.table(file.path("./UCI HAR Dataset",dataType,subjectFileName)))
  y<-tbl_df(read.table(file.path("./UCI HAR Dataset",dataType,yFileName)))
  
  #Get only mean and std
  featureVector<- grep("mean\\(\\)|std\\(\\)",features)
  x<-x[,featureVector]
  
  #rename columns
  names(x)<-rename_features(features[featureVector])
  
  #add subject and activity columns
  x$subject<-subject_data[[1]]
  x$activity<-activityLabel[y[[1]]]
  x<-arrange(x,subject,activity)
}