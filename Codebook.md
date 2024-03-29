Getting and Cleaning Data - Course Project - CodeBook
========================================================
  
  ### Original data:
  
  - [source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
- [description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


Data Transformation Steps
-------------------------
  
  1. For each of the training and test datasets, 
* Read the data
* Take a subset of the columns representing only the mean and standard deviation values. This is done via regular expressions. Therefore the features have to matches the expressions "mean" or "std".
* Associate additional columns to represent activity IDs and subject IDs read from `y_<dataset>.txt` and `subject_<dataset>.txt` files respectively.
* Assign column names by the measurement names in features.txt
2. Merge the training and the test sets, read as in step 1 to create one data set
3. Associate an additional column with descriptive activity names as specified in `activity_labels.txt`
4. Use `ddply` of the package `plyr` to get a data set with the average of each variable for each activity and each subject
5. Save the result in re-casted dataset as `dataSet_MeanValues.txt`


Variable Descriptions
-------------------------
  
  The data for this data set was derived from sources mentioned in the "Original data" section of this document. Part of the description below has been taken from the original data description.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are:
  
  * mean: Mean value
* std: Standard deviation


Data Columns Of the Output File
-------------------------
  
1. activity: Activity being performed.
2. subject: ID indicating the subject from whom data was collected
3. tBodyAccMeanX
4. tBodyAccMeanY
5. tBodyAccMeanZ
6. tBodyAccStdX
7. tBodyAccStdY
8. tBodyAccStdZ
9. tGravityAccMeanX
10. tGravityAccMeanY
11. tGravityAccMeanZ
12. tGravityAccStdX
13. tGravityAccStdY
14. tGravityAccStdZ
15. tBodyAccJerkMeanX
16. tBodyAccJerkMeanY
17. tBodyAccJerkMeanZ
18. tBodyAccJerkStdX
19. tBodyAccJerkStdY
20. tBodyAccJerkStdZ
21. tBodyGyroMeanX
22. tBodyGyroMeanY
23. tBodyGyroMeanZ
24. tBodyGyroStdX
25. tBodyGyroStdY
26. tBodyGyroStdZ
27. tBodyGyroJerkMeanX
28. tBodyGyroJerkMeanY
29. tBodyGyroJerkMeanZ
30. tBodyGyroJerkStdX
31. tBodyGyroJerkStdY
32. tBodyGyroJerkStdZ
33. tBodyAccMagMean
34. tBodyAccMagStd
35. tGravityAccMagMean
36. tGravityAccMagStd
37. tBodyAccJerkMagMean
38. tBodyAccJerkMagStd
39. tBodyGyroMagMean
40. tBodyGyroMagStd
41. tBodyGyroJerkMagMean
42. tBodyGyroJerkMagStd
43. fBodyAccMeanX
44. fBodyAccMeanY
45. fBodyAccMeanZ
46. fBodyAccStdX
47. fBodyAccStdY
48. fBodyAccStdZ
49. fBodyAcc-meanFreq-X
50. fBodyAcc-meanFreq-Y
51. fBodyAcc-meanFreq-Z
52. fBodyAccJerk-mean-X
53. fBodyAccJerk-mean-Y
54. fBodyAccJerk-mean-Z
55. fBodyAccJerkMeanX
56. fBodyAccJerkMeanY
57. fBodyAccJerkMeanZ
58. fBodyAccJerkStdX
59. fBodyAccJerkStdY
60. fBodyAccJerkStdZ
61. fBodyAccJerk-meanFreq-X
62. fBodyAccJerk-meanFreq-Y
63. fBodyAccJerk-meanFreq-Z
64. fBodyGyroMeanX
65. fBodyGyroMeanY
66. fBodyGyroMeanZ
67. fBodyGyroStdX
68. fBodyGyroStdY
69. fBodyGyroStdZ
70. fBodyGyro-meanFreq-X
71. fBodyGyro-meanFreq-Y        
72. fBodyGyro-meanFreq-Z
73. fBodyAccMagMean
74. fBodyAccMagStd
75. fBodyBodyAccJerkMagMean
76. fBodyBodyAccJerkMagStd
77. fBodyBodyGyroMagMean
78. fBodyBodyGyroMagStd
79. fBodyBodyGyroJerkMagMean
80. fBodyBodyGyroJerkMagStd
81. fBodyBodyGyroJerkMag-meanFreq