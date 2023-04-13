# Cleaning_Data_Final_Project
Final Project for 03 Getting and Cleaning Data

=================================================
Getting and Cleaning Data Course Project
Version 1.0
=================================================

Tidy Data was generated from a set of files that contained data collected from accelerators from the Samsung Galaxy S smartphone.

A full description of the data can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Data was downloaded from here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

=================================================
This repo contains the following:

- READMD.md

- CodeBook.md

- run_analysis.R
=================================================

Running code:
============

1) Download the data a unzip the files.  Place the parent file "UCI HAR Dataset" in the same directory that you are using to run the code.

2) Run run_anlysis.R

3) There are two outputs:
	a) tidyData: shows just the mean and std of the various measurments
	b) avg_tidyData: shows the average of each variable for each activity and each subject

4) Saves avg_tidyData as a text document
