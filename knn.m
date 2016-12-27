function C = knn(c_t, d_t, dat, k)
%KNN K-Neirest-Neighbour Algorithm given trainning information, testing dat and number of clusters
%
%[C] = KNN(c_t, d_t, dat, k) determines classification C vector of the given
%dat using the k-neirest-neighbout algorithm. c_t is the vector containing
%the classes for the given dat training d_t. K is the number of neighbours
%considered for each cluster.

    length_t = size(d_t, 3);            %Length of training data
    class_num = size(unique(c_t), 2);   %Number of classes to consider
    
    length_tst = size(dat, 3);          %Length of test data
    
    C = zeros(1, length_tst);           %Initialization of output test data class for each test sample
    d = zeros(length_t, 1);             %Initialization of distance vector between analog points
    
    for i = 1 : length_tst              %For each test data sample
        for j = 1 : length_t            %For each training data sample
            
            % Euclidean distance is calculated from all the training
            % samples to current evaluated point from testing.
            d(j) = (sum(sum(abs((d_t(:,:, j) - dat(:,:, i))).^1)))^(1);
            
        end
        
        %Sorting of distances from mimimum to maximum and storage indexes
        %according the sorting to determine nearest neighbours.
        [~, neigh_index] = sort(d);
        
        %Save neirest kth neighbours
        neirest_neigh = neigh_index(1:k);
        
        %Select from class training vector the kth neighbours
        class_nn = c_t(:, neirest_neigh);
        
        %Storage classification voting result according kth neighbours
        h = hist(class_nn, 1:class_num);
        
        %Determines max voted class as the proposed classification result
        %for that test sample
        [~, NN_idx] = max(h);
        
        %Saves in C vector the proposed class after knn algorithm
        C(1, i) = NN_idx;
    end
end