%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% CSC C11 - Assignment 2 - K-means clustering
%
% This function implements K-means clustering for a set of input
%  vectors, and an *initial* set of cluster centers. If the initial
%  set is empty, it initializes the centers and proceeds to do
%  the clustering.
%
% function [centers,labels]=kmeans(data,cent_init,k)
%
% Example calls (assuming data contains vectors of length 3 in each row)
%
% [centers,labels]=kmeans(data,[],5);	% Choose initial centers
%                                       % for 5 clusters
%
% [centers,labels]=kmeans(data,[1 2 3; 4 5 6],2);  % use initial centers
%                                                  % [1 2 3] and [4 5 6]
% 
%
% Inputs: data - an array of input data points size n x d, with n 
%                input points (one per row), each of length d.
%         k - number of clusters
%         cent_init - either an empty array '[]', or an array of
%                     size k x d, with k initial cluster centers
%
% Outputs: centers - Final cluster centers
%          labels - An array of size n x 1, with labels indicating
%                   which cluster each input point belongs to.
%                   e.g. if data point i belongs to cluster j,
%                   then labels(i)=j
%
% Starter code: F. Estrada, Sep. 2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [centers,labels]=kmeans(data,cent_init,k)

centers=zeros(k,size(data,2));
labels=zeros(size(data,1),1);

if (isempty(cent_init))
  % Initial centers is an empty array, choose initial centers
  % randomly
  
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % TO DO: Complete this part so that your code chooses k initial
  %        centers randomly. This comes down to picking random
  %        entries in your data array.
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  centers=datasample(data,k);
  
else
  if (size(cent_init,1)~=k | size(cent_init,2)~=size(data,2))
    fprintf(2,'Initial centers array has wrong dimensions.'\n');
    return;
  end;
  centers=cent_init;
end ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% TO DO: Complete the function by implementing the k-means algorithm
%        below.
% 
%        As a reminder, this is a loop that:
%          * Assigns data points to the closest cluster center
%          * Re-computes cluster centers based on the data points
%            assigned to them.
%          * Update the labels array to contain the index of the
%            cluster center each point is assigned to
%        Loop ends when the labels do not change from one iteration
%         to the next. 
%
%  DO NOT compute distances from data points to cluster centers
%   with a for loop over data points. Doing so will cause you to wait
%   forever for this thing to converge. Your TA certainly won't
%   wait that long.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
prev_label = ones(size(data,1),1);

while (isequal(labels, prev_label) ~= 1)
    dmatrix = [];
    prev_label = labels;
    for i = 1:k
        dmatrix = [dmatrix sqrt(sum((data-centers(i,:)).^2,2))]; 
    end
    
    [M,labels] = min(dmatrix,[],2);
    for t = 1:k
        clusterlabel = labels == t;
        sizecluster= nnz(labels == t);
        clustern = data.*clusterlabel;
%         centers(t,:) = sum(clustern)/size(data(labels(:,1)==t,:),1);
        
        centers(t,:) = sum(clustern)/sizecluster;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COMPLETE THIS TEXT BOX:
%
% 1) Student Name:Suren Gnanaranjan	
% 2) Student Name:Yitong Hu			
%
% 1) Student number:1000698328
% 2) Student number:1001716869
% 
% 1) UtorID:gnanaran
% 2) UtorID:huyi10
% 
% We hereby certify that the work contained here is our own
%
% __Suren Gnanaranjan___            _____Yitong Hu______
% (sign with your name)            (sign with your name)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

