---
output: pdf_document
---
# CodeBook for Coursera Getting and Cleaning Data Course Project

## General Data Description

This tidy data set contains measurements from 30 subjects carrying a Samsung Galaxy S on their waist during 6 activities; laying, sitting, standing, walking, walking downstairs and walking upstairs. There were multiple experiments undertaken by each subject for each activity, so this resulting dataset is a measure of the mean of all 66  mean/std variables for each subject for each activity.

## Variable Description

Subject - a unique identifier for each person who carried out the experiments, from 1-30
Activity - one of laying, sitting, standing, walking, walking downstairs or walking upstairs.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals timeAcceleration-XYZ and timeGyroscope-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeBodyAcceleration-XYZ and timeGravityAcceleration-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccelerationJerk-XYZ and timeBodyGyroscopeJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAccelerationMagnitude, timeGravityAccelerationMagnitude, timeBodyAccelerationJerkMagnitude, timeBodyGyroscopeMagnitude, timeBodyGyroscopeJerkMagnitude).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequencyBodyAcceleration-XYZ, frequencyBodyAccelerationJerk-XYZ, frequencyBodyGyroscope-XYZ, frequencyBodyAccelerationJerkMagnitude, frequencyBodyGyroscopeMagnitude, frequencyBodyGyroscopeJerkMagnitude.

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are: 

Mean: Mean value
Std: Standard deviation

*Please note this description was largely adapted from features.txt and features_info.txt located within the [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )*

The data is normalised, and as such is unitless, as confirmed by a [Community TA](https://class.coursera.org/getdata-031/forum/thread?thread_id=113#comment-1006)

## Variable List

* Subject
* Activity
* timeBodyAccelerationMeanX
* timeBodyAccelerationMeanY
* timeBodyAccelerationMeanZ
* timeBodyAccelerationStdX             
* timeBodyAccelerationStdY
* timeBodyAccelerationStdZ                
* timeGravityAccelerationMeanX
* timeGravityAccelerationMeanY       
* timeGravityAccelerationMeanZ
* timeGravityAccelerationStdX              
* timeGravityAccelerationStdY                
* timeGravityAccelerationStdZ             
* timeBodyAccelerationJerkMeanX             
* timeBodyAccelerationJerkMeanY        
* timeBodyAccelerationJerkMeanZ             
* timeBodyAccelerationJerkStdX       
* timeBodyAccelerationJerkStdY             
* timeBodyAccelerationJerkStdZ            
* timeBodyGyroscopeMeanX                  
* timeBodyGyroscopeMeanY             
* timeBodyGyroscopeMeanZ                   
* timeBodyGyroscopeStdX              
* timeBodyGyroscopeStdY                    
* timeBodyGyroscopeStdZ               
* timeBodyGyroscopeJerkMeanX               
* timeBodyGyroscopeJerkMeanY            
* timeBodyGyroscopeJerkMeanZ               
* timeBodyGyroscopeJerkStdX            
* timeBodyGyroscopeJerkStdY               
* timeBodyGyroscopeJerkStdZ             
* timeBodyAccelerationMagnitudeMean        
* timeBodyAccelerationMagnitudeStd        
* timeGravityAccelerationMagnitudeMean       
* timeGravityAccelerationMagnitudeStd   
* timeBodyAccelerationJerkMagnitudeMean      
* timeBodyAccelerationJerkMagnitudeStd   
* timeBodyGyroscopeMagnitudeMean           
* timeBodyGyroscopeMagnitudeStd           
* timeBodyGyroscopeJerkMagnitudeMean        
* timeBodyGyroscopeJerkMagnitudeStd        
* frequencyBodyAccelerationMeanX             
* frequencyBodyAccelerationMeanY           
* frequencyBodyAccelerationMeanZ
* frequencyBodyAccelerationStdX            
* frequencyBodyAccelerationStdY             
* frequencyBodyAccelerationStdZ
* frequencyBodyAccelerationJerkMeanX        
* frequencyBodyAccelerationJerkMeanY    
* frequencyBodyAccelerationJerkMeanZ      
* frequencyBodyAccelerationJerkStdX     
* frequencyBodyAccelerationJerkStdY        
* frequencyBodyAccelerationJerkStdZ        
* frequencyBodyGyroscopeMeanX              
* frequencyBodyGyroscopeMeanY          
* frequencyBodyGyroscopeMeanZ             
* frequencyBodyGyroscopeStdX             
* frequencyBodyGyroscopeStdY             
* frequencyBodyGyroscopeStdZ
* frequencyBodyAccelerationMagnitudeMean   
* frequencyBodyAccelerationMagnitudeStd
* frequencyBodyAccelerationJerkMagnitudeMean
* frequencyBodyAccelerationJerkMagnitudeStd
* frequencyBodyGyroscopeMagnitudeMean     
* frequencyBodyGyroscopeMagnitudeStd 
* frequencyBodyGyroscopeJerkMagnitudeMean
* frequencyBodyGyroscopeJerkMagnitudeStd