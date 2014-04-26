#JHU Getting and Cleaning Data Peer Review Exercise

# Read in the activity label files

testlabel <- read.table('test/y_test.txt')
trainlabel<- read.table('train/y_train.txt')

# Replace the numerical codes with a descriptive label.  This will be question 3 of the assignment.


for (i in 1:nrow(testlabel)){
  if (testlabel[i,1]=='1'){
     testlabel[i,1]<-"WALKING"
	 }
  if (testlabel[i,1]=='2'){
     testlabel[i,1]<-"WALKING UPSTAIRS"
	 }	
  if (testlabel[i,1]=='3'){
     testlabel[i,1]<-"WALKING DOWNSTAIRS"
	 }
  if (testlabel[i,1]=='4'){
     testlabel[i,1]<-"SITTING"
	 }	
  if (testlabel[i,1]=='5'){
     testlabel[i,1]<-"STANDING"
	 }
  if (testlabel[i,1]=='6'){
     testlabel[i,1]<-"LAYING"
	 }	
}	

for (i in 1:nrow(trainlabel)){
  if (trainlabel[i,1]=='1'){
     trainlabel[i,1]<-"WALKING"
	 }
  if (trainlabel[i,1]=='2'){
     trainlabel[i,1]<-"WALKING UPSTAIRS"
	 }	
  if (trainlabel[i,1]=='3'){
     trainlabel[i,1]<-"WALKING DOWNSTAIRS"
	 }
  if (trainlabel[i,1]=='4'){
     trainlabel[i,1]<-"SITTING"
	 }	
  if (trainlabel[i,1]=='5'){
     trainlabel[i,1]<-"STANDING"
	 }
  if (trainlabel[i,1]=='6'){
     trainlabel[i,1]<-"LAYING"
	 }	
}

names(testlabel)[1] <- 'Activity'
names(trainlabel)[1] <- 'Activity'



# Load and label the subject columns

testsubject <- read.table('c:/Data/UCI HAR Dataset/test/subject_test.txt')
trainsubject <- read.table('c:/Data/UCI HAR Dataset/train/subject_train.txt')

names(testsubject)[1] <- 'Subject'
names(trainsubject)[1] <- 'Subject'	 

# Load and label the data sets

datatrain <- read.table('train/X_train.txt')
datatest <- read.table('test/X_test.txt')  	
features <- read.table('features.txt')

colnames(datatrain) <- features[,2]
colnames(datatest) <- features[,2]

# Add the activity and subject to the data sets

datatrain <- cbind(trainlabel, trainsubject, datatrain)
datatest <- cbind(testlabel, testsubject, datatest)

#Merge the test and train data (this is step 1 of the assignment)

datah <- rbind(datatrain, datatest)

# Select out the mean and standard deviation colnames. Question #2 of assignment.

wants <-c(123:128,163:168,203:204,216:217,229:230,242:243,255:256,268:273,296:298,347:352,375:377,426:431,454:456,505:506,515,518:519,528,531:532,541,544:545,554)
data <- datah[,wants]

# Question 5 is ambiguous.  I construct means of the original merged data.
# Must have the package plyr loaded.

nomdecol<- c('Activity','Subject', as.character(features[,2]))
tidy <- ddply(datah, c("Activity", "Subject"), function(df)mean(df[,3]))
for (i in 4:ncol(datah)){
  colnames(tidy) <- nomdecol[1:(i-1)]
  dust <- ddply(datah, c("Activity", "Subject"), function(df)mean(df[,i]))
  tidy <- merge(tidy,dust)
}
colnames(tidy)<-nomdecol
tidy <- tidy[order(tidy$Activity, tidy$Subject),]

