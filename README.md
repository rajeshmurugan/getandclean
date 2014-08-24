Getting and Cleaning Project
============================

This file explains about the process flow of run_analysis.R script briefly.

>1. First reading Training data, Subject and Activity Label information and stores in data frame called 'train'.
>2. Second reading Test data, Subject and Activity Label information and stores in data frame called 'test'.
>3. Merge both training and test data frames and store it in data.
>4. Then reading features information and assign it to merged data frame.
>5. Extracting only the measurements on the mean and standard deviation for each measurement.
>6. Removing punctuations in variable names.
>7. Reading Activity Label information
>8. Naming the each activitie value with descriptive activity names in the data set.
>9. Creating independent tidy data set which contains the average of each variable for each activity and each subject.
>10. Writing tidy data set into text file called 'tidydata.txt'


Thank you!!!!

