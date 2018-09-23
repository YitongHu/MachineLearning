%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CSC C11 - Assignment 3 - Classification by Gaussian Class Conditionals
%
% In this function, you will implement the code that trains the GCC model
% for the input dataset. 
%
% Inputs:
%
% train_data   -  The training data set  (one input sample per row)
% train_labels -  Labels for the training data set
% K            -  Number of components in the GCC model
%
% Returns:
%
% centers      - Each row is the center of a Gaussian in the GCC model
% covs         - A NxNxK matrix with K, NxN covariance matrices
% ais          - Mixture proportions
%
% F.J.E. Nov, 2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [centers,covs,ais]=GCC_Train(train_data,train_labels,K);

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% TO DO: Complete the function to learn the parameters of the model
%        this should be fairly similar to your GMMs from A2!
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% initialize centers, covariances and ais
centers=zeros(K,size(train_data,2));
covs=zeros([size(train_data,2) size(train_data,2) K]);
ais=ones(K,1)/K;

for j =1:K
   % find jth data points and the size of the class
   clustlabel = (train_labels==j);
   clustsize = nnz(clustlabel);
   % keep on data of jth class
   labeldata = train_data(train_labels==j,:);
%    labeldata = clustlabel.*train_data;
%    labeldata(any(labeldata ~= 0,2),:);
   %update weight
   ais(j) = clustsize/size(train_data,2);
   % update mean.
   %centers(j,:) = sum(labeldata)/clustsize;
   centers(j,:) = mean(labeldata);
   % update covariance
   %covs(:,:,j)= ((train_data(train_labels(:, 1) == j,:)-centers(j,:))'*(train_data(train_labels(:,1)==j,:)-centers(j,:)))./size(train_data(train_labels(:,1)==j,:),1);
   covs(:,:,j)= cov(labeldata);
end
