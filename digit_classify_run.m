%% Data pasring
[ data,class] = parsing();          %parses all the stroke mat files to data and class given asignment distribution of classes

traindata = zeros(14,3,774);        %Initialize in memory a train data matrix considering the 774 elements from stroke files

k = 1;
%Downsampling 
for i = 0:9                                 %For each class number  
    iset = data(class==i);                  %selection of members that belong to evaluated class number
    for j =1:length(iset)                   %For every number belonging to evaluated class
        c = cell2mat(iset(j));              %Transform sample from cell element to individual matrix sample
        div = size(c,1);                    %Store number of points recorded for the sample
        d = downsample(c,floor((div/14)));  %Downsample the sample from original recorded points to 14
        traindata(:,:,k) = d(1:14,:);       %Store in traindata matrix for at k element the downsampled number
        k = k + 1;                          %Update k value to proceed with following sample
    end
end

%Folowing there will be single test classficiation using all the rest of
%the data for training and multiple data test classification

%%
% ONE Sample way

echo off
sum = 0;                                        %Initializer
for i = 1:10                                    %For ten random test data
    N = randperm(774,1);                        %Return 1 unique integer selected randomly from 1:774
    C = digit_classify(traindata(:,:,N(1)));    %Applies the classification given the random test data random selection and returns vector with propossed classification

    if class(N) == C                            %Case the output and the true value matches
        sum = sum+1;                            %Adds 1 , collection of number of succesfull classifications
    end
end

disp(sum/(i));
%%
% Multiple way
TEST_SIZE = 100;                            %To test 100 randomly selected samples
N = randperm(774,TEST_SIZE);                %Return TEST_SIZE number of intgers selected from 1:774
C = digit_classify(traindata(:,:,N));       %Executes the digit_classify function
plot((class(N)-C),'x');                     %Plots error in classification if zero correct if not wrong.
