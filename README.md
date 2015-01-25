The script run_analysis.R does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Check out the CodeBook file for more details on the available functions, variables and the workstream overall.

Please note that file management assumes given filepath and the right permissions are properly set. No exceptions have been 
implemented to control any further issue with file manipulations. 

Thus the raw files needed to trigger the process were previously downloaded from the location highlighted on Coursera training course. 
Note the folder containing the raw files requires at least Read permissions and whatever the path chosen for the output file has to set with Write permissions.

To execute the script code, run the following command:

processData(inputpath, output_filename)

on where:

 -inputpath is the path where the inner folders test and train are located (as well as any other files provided on the original zip file).
 -output_filename is the file you choose the output of the process will be written into.
