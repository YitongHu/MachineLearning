%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CSC C11 - Assignment 3 - Dimensionality reduction by PCA
%
% In this function you will apply PCA to an input dataset to
% return a low-dimensional representation for the input data.
%
% Inputs:
% 
% input_data    -   Input dataset, one sample PER ROW
% k             -   Number of dimensions for the low-dimensional data
%
% Return values:
%
% LodWim_data   -   The low-dimensional representation of the dataset
%                   one sample per row
% V             -   The matrix with the PCA directions (one per column)
% mu            -   The mean of the input data (needed for reconstruction)
% 
% F.J.E. Nov, 2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [LowDim_data,V,mu]=datasetPCA(input_data, k);

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% TO DO: Complete the code below to find the PCA directions.
%        
%        Note: Use the eigs() function for computing the 
%              eigenvalues and eigenvectors.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% PCA step 1 - compute the mean of the data, and subtract
% the mean from all input vectors
mu=mean(input_data);
new_data=input_data-mu;

% PCA step 2 - Compute the covariance matrix - have a look 
% at it! the off-diagonal entries are fairly large, indicating
% a significant correlation between R, G, and B
cv=cov(input_data);
% PCA step 3 - Compute the eigenvectors and eigenvalues of 
% the covariance matrix. Sort them by decreasing magnitude of
% the eigenvalue. Take a look at the eigenvectors and think
% about what they tell you in terms of what directions 
% contain the most information in the image.
[V,e]=eigs(cv,k);
%e=diag(e);
% PCA step 4 - Obtain PCA coefficients for each pixel by 
% projecting onto the matrix whose columns are the sorted
% eigenvectors of the covariance matrix.
LowDim_data=(V'*new_data')';
%%%%%%%%%%%%%%%
%  imR=zeros(size(new_data));
%  for i=1:size(imR,1)
%   imR(i,:)=((LowDim_data(i,1)*V(:,1))+(LowDim_data(i,2)*V(:,2))+(LowDim_data(i,3)*V(:,3))+(LowDim_data(i,4)*V(:,4)));
%  end;
%  imR=imR+repmat(mu,[size(imR,1) 1]);
%  imR

