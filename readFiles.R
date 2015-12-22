library(dplyr)
library(tidyr)

#read training data
X_train<- tbl_df(read.table("./data/train/X_train.txt"))
subject_train<- tbl_df(read.table("./data/train/subject_train.txt"))
y_train<- tbl_df(read.table("./data/train/y_train.txt"))

#read test data
X_test<- tbl_df(read.table("./data/test/X_test.txt"))
subject_test<- tbl_df(read.table("./data/test/subject_test.txt"))
y_test<- tbl_df(read.table("./data/test/y_test.txt"))

#read activity labels
activity_label<- tbl_df(read.table("./data/activity_labels.txt"))







