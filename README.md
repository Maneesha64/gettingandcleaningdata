"Getting and Cleaning Data - Course Project"
==================================================== 

Description of the project:
----------------
This project is part of "Getting and cleaning data" course. The project is to create a tidy dataset using a raw data. The raw data was provided in separate text files from which a single dataset with specific requirements was to be created. The goal in preparing the tidy dataset is to get the mean and standard deviation measurements and to show their average values for each activity that was performed and for each subject. 

The repository consists of the newly created tidy dataset "tidydata.txt" file, an R script "run_analysis.R" showing the R code followed for creating the tidy dataset and a codebook describing the tidy dataset variables.

Data description:
------------------
The raw data was given in the directory "UCI HAR Dataset". The raw data gives information on two sets, one where the volunteers were set for training dataset and the others for test dataset. Each set was tested for 561 features and is available in respective X_.txt files. The activities were available in Y_.txt files and subjects were available in subject_.txt files for each set respectively. This data given as zip was unzipped and stored in working directory for usage.

About the script:
------------------
The script first adds the activity and subject information to each of the features dataset for training and testing data. Then the two datasets are combined into a single data, stored in 'testandtrain' data frame. The measurements for mean and standard deviation are extracted from features list and renamed suitably. The testandtrain data is reduced to the data showing only mean and standard deviation information. Next the activity class is labelled with the list of activities that were performed. Finally, the average values of each variable was calculated for each activity and each subject and was written to a new dataset called tidydata.txt.

Creation of Tidy dataset: 
-------------------------------
The tidy data set which is output of R code, is a text file with tab delimited spacing.

The codebook
--------------------
The codebook written is made available in the repository. This gives details on all the valriables used to build the tidy data set.    
