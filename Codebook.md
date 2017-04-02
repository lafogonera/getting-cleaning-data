- The experiments have been carried out with a group of 30 volunteers (`subjectID`) within an age bracket of 19-48 years. Each person performed six activities (`WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING`, `LAYING`)
- The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals timeAccelerometer-XYZ and timeGyroscope-XYZ.
- The sensor signals (**accelerometer** and **gyroscope**) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the **time** and **frequency** domain.
- The variables have **descriptive names**. We have avoided all names lowercase as they compose words.
- Time domain signals (prefix **time**)
- Frecuency domain signals (prefix **frequency**)
- These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions


The file with the data is `assignment.txt`.
The data is groyped by `activity` and by `subjectID`. As we have 6 activities and 30 subjects, **the dimensions of the file is 180 rows and 81 columns** We have 79 columns refering to variables with mean or std, plus the activiy and subjectID variables.
The complete list of variables:

 [1] "activity"
 	each person performed six activities
    `WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING`, `LAYING`
    
 [2] "subjectID"
 	30 volunteers: 
    	ids from `1` to `30`

 [3] "timeBodyAccelerometerMeanX"                   
 [4] "timeBodyAccelerometerMeanY"                   
 [5] "timeBodyAccelerometerMeanZ"                   
 [6] "timeBodyAccelerometerStdX"                    
 [7] "timeBodyAccelerometerStdY"                    
 [8] "timeBodyAccelerometerStdZ"                    
 [9] "timeGravityAccelerometerMeanX"                
[10] "timeGravityAccelerometerMeanY"                
[11] "timeGravityAccelerometerMeanZ"                
[12] "timeGravityAccelerometerStdX"                 
[13] "timeGravityAccelerometerStdY"                 
[14] "timeGravityAccelerometerStdZ"                 
[15] "timeBodyAccelerometerJerkMeanX"               
[16] "timeBodyAccelerometerJerkMeanY"               
[17] "timeBodyAccelerometerJerkMeanZ"               
[18] "timeBodyAccelerometerJerkStdX"                
[19] "timeBodyAccelerometerJerkStdY"                
[20] "timeBodyAccelerometerJerkStdZ"                
[21] "timeBodyGyroscopeMeanX"                       
[22] "timeBodyGyroscopeMeanY"                       
[23] "timeBodyGyroscopeMeanZ"                       
[24] "timeBodyGyroscopeStdX"                        
[25] "timeBodyGyroscopeStdY"                        
[26] "timeBodyGyroscopeStdZ"                        
[27] "timeBodyGyroscopeJerkMeanX"                   
[28] "timeBodyGyroscopeJerkMeanY"                   
[29] "timeBodyGyroscopeJerkMeanZ"                   
[30] "timeBodyGyroscopeJerkStdX"                    
[31] "timeBodyGyroscopeJerkStdY"                    
[32] "timeBodyGyroscopeJerkStdZ"                    
[33] "timeBodyAccelerometerMagMean"                 
[34] "timeBodyAccelerometerMagStd"                  
[35] "timeGravityAccelerometerMagMean"              
[36] "timeGravityAccelerometerMagStd"               
[37] "timeBodyAccelerometerJerkMagMean"             
[38] "timeBodyAccelerometerJerkMagStd"              
[39] "timeBodyGyroscopeMagMean"                     
[40] "timeBodyGyroscopeMagStd"                      
[41] "timeBodyGyroscopeJerkMagMean"                 
[42] "timeBodyGyroscopeJerkMagStd"                  
[43] "frecuencyBodyAccelerometerMeanX"              
[44] "frecuencyBodyAccelerometerMeanY"              
[45] "frecuencyBodyAccelerometerMeanZ"              
[46] "frecuencyBodyAccelerometerStdX"               
[47] "frecuencyBodyAccelerometerStdY"               
[48] "frecuencyBodyAccelerometerStdZ"               
[49] "frecuencyBodyAccelerometerMeanFreqX"          
[50] "frecuencyBodyAccelerometerMeanFreqY"          
[51] "frecuencyBodyAccelerometerMeanFreqZ"          
[52] "frecuencyBodyAccelerometerJerkMeanX"          
[53] "frecuencyBodyAccelerometerJerkMeanY"          
[54] "frecuencyBodyAccelerometerJerkMeanZ"          
[55] "frecuencyBodyAccelerometerJerkStdX"           
[56] "frecuencyBodyAccelerometerJerkStdY"           
[57] "frecuencyBodyAccelerometerJerkStdZ"           
[58] "frecuencyBodyAccelerometerJerkMeanFreqX"      
[59] "frecuencyBodyAccelerometerJerkMeanFreqY"      
[60] "frecuencyBodyAccelerometerJerkMeanFreqZ"      
[61] "frecuencyBodyGyroscopeMeanX"                  
[62] "frecuencyBodyGyroscopeMeanY"                  
[63] "frecuencyBodyGyroscopeMeanZ"                  
[64] "frecuencyBodyGyroscopeStdX"                   
[65] "frecuencyBodyGyroscopeStdY"                   
[66] "frecuencyBodyGyroscopeStdZ"                   
[67] "frecuencyBodyGyroscopeMeanFreqX"              
[68] "frecuencyBodyGyroscopeMeanFreqY"              
[69] "frecuencyBodyGyroscopeMeanFreqZ"              
[70] "frecuencyBodyAccelerometerMagMean"            
[71] "frecuencyBodyAccelerometerMagStd"             
[72] "frecuencyBodyAccelerometerMagMeanFreq"        
[73] "frecuencyBodyBodyAccelerometerJerkMagMean"    
[74] "frecuencyBodyBodyAccelerometerJerkMagStd"     
[75] "frecuencyBodyBodyAccelerometerJerkMagMeanFreq"
[76] "frecuencyBodyBodyGyroscopeMagMean"            
[77] "frecuencyBodyBodyGyroscopeMagStd"             
[78] "frecuencyBodyBodyGyroscopeMagMeanFreq"        
[79] "frecuencyBodyBodyGyroscopeJerkMagMean"        
[80] "frecuencyBodyBodyGyroscopeJerkMagStd"         
[81] "frecuencyBodyBodyGyroscopeJerkMagMeanFreq" 

