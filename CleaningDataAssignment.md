## Overview of Steps of run_analysis script

### Read in the activity label files

Self explanatory

### Replace the numerical codes with a descriptive label.  This will be question 3 of the assignment.

Loop through the rows of each data table and replace each numerical label with it's English equivalent.

Name the Activity columns as 'Activity'

### Load and label the data sets

Loan the data and label the columns.

### Add the activity and subject to the data sets

### Merge the test and train data (this is step 1 of the assignment)

### Select out the mean and standard deviation colnames. Question #2 of assignment.

### Question 5 is ambiguous.  I construct means of the original merged data.

Must have the package plyr loaded.

For each subject and each activity provide the mean of the variable within that pair, row by row.  
Merge each column of averages as it's produced.

