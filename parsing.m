function [ data,class ] = parsing()
%PARSING Parsing of the stroke mat files to obtain data matrix and class
%vector
%   [data,class]=PARSING() Selects all the training_data stroke mat files
%   to obtain two single objects with all of them: A data cell and a
%   class vector. 
%
%   The type of file constructed automatically will be of
%   type "stroke_Numberclass_0Elementidfromalldistribution.mat" p.e.
%   "stroke_1_028.mat" would make reference to sample 28 of class 1.

str1 = 'stroke_';                               %First part of file names
str_last = '.mat';                              %File extension

idx_list = [84 79 78 73 76 79 84 75 70 76];     %Class distribution
class_idx = 1;                                  %Initializer

class = zeros(1,sum(idx_list));                 %Initializer of output vector which will hold the classes

for k=0:9                                       %For each class, aka from number 0 to 9
    c = strcat(str1,num2str(k));                %c="stroke_"+ Number from 0 to 9
    d = strcat(c,'_0');                         %d="stroke_Numberclass_0"
    
    for i=1:idx_list(k+1)                       %For each sample of each class
        numi = num2str(i);                      %"#id sample of that sample in the class"
        if length(numi) <2                      %Case is in the 9 first elements add a 0 before
            numi = strcat('0',numi);
        end
        
        e = strcat(d,numi);                     %e="stroke_Numberclass_0numi"
        f = strcat(e,str_last);                 %f="stroke_Numberclass_0numi.mat"
%        disp(f);
        p = load(f);                            %Loads the file specified in f and saves it in p
        data{class_idx} = p.pos;                %cell with class index element equal to loaded sample 
        class(class_idx) = k;                   %class with index element equal to class evaluated
        
        class_idx = class_idx + 1;              %Update for next index
    end
end


end

