# 0504376_digits_3d
Solution developed by Taekyung Han and Miguel Cordero Sánchez for the BM40A0701 Pattern Recognition Final Project at Lappeenranta University of Technology

The main files that can be found are 
- training_data folder: Collects a series of randomly selected handwritten numbers with LeapSensor in independt files.
- digit_classify.m: Matlab function which applies downsampling and knn classification for given test data. Uses the training_data files for    training.
- digit_classify_run.m: Script which allows to visualize execution of digit_classify Matlab function
- knn.m: K-nearest-neighbour Matlab classification function
- parsing.m: Matlab function which allows to collect all the samples from individual files captured by LeapMotion sensor in a cell cointaining all the data samples and points and the correspondent class vector.

NOTE: IF MATLAB DOES NOT RECOGNIZE BY DEFEULT INTERNAL FOLDER OF THE PATH, PLEASE SELECT THE training_data FOLDER RIGHT CLIK AND INCLUDE SELECTED FOLDER

These files were made in December of 2016 and no forward maintenance and development is going to be made.
