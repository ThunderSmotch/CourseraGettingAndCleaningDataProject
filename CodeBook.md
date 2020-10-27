Code Book
======

## Data Info

This code makes use of the Human Activity Recognition Using Smartphones Dataset to generate a new dataset with the average of all mean and standard deviation measurements for each subject and activity.

## Modifications done to the dataset

1. Merge the columns for the subject, X and y test and train data.
2. Join both the train and test datasets into a single dataset.
3. Change the activity data so that they use the activity label instead of integers.
4. Select only the measurements pertaining to the mean or standard deviation.
5. Change variable names of these measurements to make them more readable.
6. Order the dataset to be in asceding order of subject and then activity.
7. Group the dataset by subject and activity and perform the mean for all measurements in each grouping (unique pair of subject and activity).

## Description of the variables

We have 68 variables, the first two being identifier variables, identifying the subject and activity type and the other 66 are measurements variables. The first letter of a measurement variable describes if this measurement is in the time (t) or frequency (f) domain and in the end of the variable name is also (when applicable) a designation of the axis of the measurement (X,Y or Z).

### Identifier Variables
1. subject - ID of the subject ranging from 1 to 30
2. activity - Keyword that characterizes the activity monitored. The activities are WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.
### Measurement Variables
1. tBodyAccMeanX
2. tBodyAccMeanY
3. tBodyAccMeanZ
4. tBodyAccStdX
5. tBodyAccStdY
6. tBodyAccStdZ
7. tGravityAccMeanX
8. tGravityAccMeanY
9. tGravityAccMeanZ
10. tGravityAccStdX
11. tGravityAccStdY
12. tGravityAccStdZ
13. tBodyAccJerkMeanX
14. tBodyAccJerkMeanY
15. tBodyAccJerkMeanZ
16. tBodyAccJerkStdX
17. tBodyAccJerkStdY
18. tBodyAccJerkStdZ
19. tBodyGyroMeanX
20. tBodyGyroMeanY
21. tBodyGyroMeanZ
22. tBodyGyroStdX
23. tBodyGyroStdY
24. tBodyGyroStdZ
25. tBodyGyroJerkMeanX
26. tBodyGyroJerkMeanY
27. tBodyGyroJerkMeanZ
28. tBodyGyroJerkStdX
29. tBodyGyroJerkStdY
30. tBodyGyroJerkStdZ
31. tBodyAccMagMean
32. tBodyAccMagStd
33. tGravityAccMagMean
34. tGravityAccMagStd
35. tBodyAccJerkMagMean
36. tBodyAccJerkMagStd
37. tBodyGyroMagMean
38. tBodyGyroMagStd
39. tBodyGyroJerkMagMean
40. tBodyGyroJerkMagStd
41. fBodyAccMeanX
42. fBodyAccMeanY
43. fBodyAccMeanZ
44. fBodyAccStdX
45. fBodyAccStdY
46. fBodyAccStdZ
47. fBodyAccJerkMeanX
48. fBodyAccJerkMeanY
49. fBodyAccJerkMeanZ
50. fBodyAccJerkStdX
51. fBodyAccJerkStdY
52. fBodyAccJerkStdZ
53. fBodyGyroMeanX
54. fBodyGyroMeanY
55. fBodyGyroMeanZ
56. fBodyGyroStdX
57. fBodyGyroStdY
58. fBodyGyroStdZ
59. fBodyAccMagMean
60. fBodyAccMagStd
61. fBodyBodyAccJerkMagMean
62. fBodyBodyAccJerkMagStd
63. fBodyBodyGyroMagMean
64. fBodyBodyGyroMagStd
65. fBodyBodyGyroJerkMagMean
66. fBodyBodyGyroJerkMagStd

A more thorough explanation of these measurement variables can be found in the "features_info.txt" file of the dataset. 