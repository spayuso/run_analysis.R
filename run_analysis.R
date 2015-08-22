##Run analysys.
## Sebastián Pajuelo 

##Library includes, create dirs and files, download and unzip data

if (!require("reshape2")) {
  install.packages("reshape2")
  
}

if(!require("data.table")) {
  install.packages("data.table")
}

library("reshape2")
library("data.table")


if(!file.exists("./datos"))
{
  dir.create("./datos")
} else {
  print("Directory ./datos already exists")
}


if(!file.exists("./datos/dataset.zip"))
{
  dwnUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(dwnUrl, destfile="./datos/dataset.zip", method="curl")
} else {
  print("File ./datos/dataset.zip already exists")
}


if(!file.exists("./datos/UCI HAR Dataset"))
{
  unzip(zipfile ="./datos/dataset.zip", exdir="./datos")
} else {
  print("File dataset.zip already unziped")
}

##Reading files from our directories##

pathFeatures<-file.path("./datos","/UCI Har Dataset","features.txt")
pathActivities<-file.path("./datos","/UCI Har Dataset","activity_labels.txt")
pathXtest<-file.path("./datos","UCI Har Dataset","test","X_test.txt")
pathYtest<-file.path("./datos","UCI Har Dataset","test","Y_test.txt")
pathXtrain<-file.path("./datos","UCI Har Dataset","train","X_train.txt")
pathYtrain<-file.path("./datos","UCI Har Dataset","train","Y_train.txt")
pathSubjectTest<-file.path("./datos","UCI Har Dataset","test","subject_test.txt")
pathSubjectTrain<-file.path("./datos","UCI Har Dataset","train","subject_train.txt")

activityLabels<-read.table(pathActivities)[,2]
featuresTab<-read.table(pathFeatures)[,2]
xTestTab<-read.table(pathXtest)
yTestTab<-read.table(pathYtest)
xTrainTab<-read.table(pathXtrain)
yTrainTab<-read.table(pathYtrain)
subjectTestTab<-read.table(subjectTest)
subjectTrainTab<-read.table(subjectTrain)

##Reading mean and std from features
meanStd<-grepl("mean|std", featuresTab)

##Rename the X with the features
names(xTestTab)=featuresTab
names(xTrainTab)=featuresTab

##Extract from xTestTab the features who want, (mean and std)
xTestTab<-xTestTab[,meanStd]
xTrainTab<-xTrainTab[,meanStd]

##We need load labels for diferent activities
yTestTab[,2]=activityLabels[yTestTab[,1]]
yTrainTab[,2]=activityLabels[yTrainTab[,1]]

##Rename yTestTab with new names
names(yTestTab)=c("activity","activity_label")
names(yTrainTab)=c("activity","activity_label")
names(subjectTestTab)="subject"
names(subjectTrainTab)="subject"

##Merge all our new datas on new table with cbind function##

newDataTest<-cbind(as.data.table(subjectTestTab),yTestTab,xTestTab)
newDataTrain<-cbind(as.data.table(subjectTrainTab),yTrainTab,xTrainTab)

##Merge all data (train and test data)
finalData=rbind(newDataTest,newDataTrain)

newLabels=c("subject","activity","activity_label")
newDataLabels=setdiff(colnames(finalData),newLabels)
newProcData=melt(finalData,id=newLabels,measure.vars=newDataLabels)

perfectTidyData=dcast(newProcData,subject + activity_label ~ variable, mean)

##Writing data on a new table
write.table(perfectTidyData,file="./tidy_data.txt", row.name=FALSE)

##To create codebook we need memsic package

##    if(!require("memisc")){
  ##    install.packages("memisc")
##    }
##    library("memisc")
##    codebook(perfectTidyData)
