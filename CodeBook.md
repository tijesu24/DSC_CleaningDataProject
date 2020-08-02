## Data
The data are gotten from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, they captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 

## Description of Variables 
* A std and mean suffix represent standard deviations and mean respectively   
* _X, _Y, _Z represent measurements in the x, y and z axes   
* time.accel_XYZ and time.gyro_XYZ– these represent the raw, time domain acceleration and angular velocity signals from the gyroscope and accelerometer   
* time.body.accel_XYZ and time.gravity.accel_XYZ – these represent a separation of the acceleration signal into body and gravity acceleration signals   
* time.body.accel.jerk_XYZ and time.body.gyro.jerk_XYZ – the jerk signals gotten from differentiating the body linear acceleration and angular velocity signals   
* time.body.accel.mag, time.gravity.acc.mag, time.body.acc.jerk.mag, time.body.gyro.mag, time.body.gyro.jerk.mag – the magnitude of the respective signals, gotten through the Euclidean norm   
* frequency.body.accel-XYZ, frequency.body.accel.jerk-XYZ, frequency.body.gyro-XYZ, frequency.body.accel.jerk.mag, frequency.body.gyro.mag, frequency.body.gyro.jerk.mag – the fast fourier transform of the respective signal   


## Transformations applied to the raw data
These were the transformations applied to the raw data   
1. Merging the training and the test sets to create one data set: All the variables names were the same so, I performed a row merge   
2. Extracting only the measurements on the mean and standard deviation for each measurement.   
3. Using descriptive activity names to name the activities in the data set   
4. Renaming the variable names to more meaningful ones: I converted all variable names to lower case and added dots before each variable feature (For example, “Mean” to “.mean”)   
5. creating a second tidy data set with the average of each variable for each activity and each subject.   
