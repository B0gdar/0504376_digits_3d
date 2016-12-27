function [ C ] = digit_classify( testdata )
%DIGIT_CLASSIFY Algorithm developed for downsample and apply knn to
%classify the input testdata

%[C] = DIGIT_CLASSIFY(testdata) returns vector C with classification result
%after applying k-nearest-neighbor method. First training data is downsample to
%

[data,class] = parsing();                   %Uses parsing to extract from stroke mat files and unify the data in a data cell and a vector with all the classes

N = size(testdata,1);                       %Number of samples to test

TRAIN_N = size(class,2);                    %Initializer for number of trainning samples, initialize with 100%

downSData = zeros(N,3,TRAIN_N);             %Initializer of an empty matrix to downsample
TRAIN_PERCENT = 1;                          %Percentage of whole available samples to use for training [0,1]

for i = 1:TRAIN_N                           %For each available given stroke sample aka 774
    c = cell2mat(data(i));                  %Convert from cell to single matrix each handwritten sample
    div = size(c,1);                        %Determine number of points saved from sensoring
    d = downsample(c,floor((div/14)));      %Downsample to 14 points
    downSData(:,:,i) = d(1:N,:);            %Storage downsampled data
end

%DownSData = mm_normalize(DownSData);       %Normalize downsampled data
SAMPLE_N = size(downSData,3);               %Save number of elements downsampled aka 774
ridx = randperm(SAMPLE_N,SAMPLE_N);         %Return 774 intger permutations of 1:774
cutidx = round(SAMPLE_N*TRAIN_PERCENT);     %Select number of elements training data has, given a percentage

traindata = downSData(:,:,ridx(1:cutidx));  %Define training data according to permutations and number of elements
trainclass = class(ridx(1:cutidx));         %Selects matching class values of seleceted training data

k = 3;                                      %Number of neighbours
C = knn(trainclass,traindata,testdata,k);   %Performs K-nearest-neighbour classification returning vector C with proposed classes

end
