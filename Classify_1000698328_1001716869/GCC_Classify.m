%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CSC C11 - Assignment 3 - Classification by Gaussian Class Conditionals
%
% This function uses a trained GCC model to classify an input dataset
%
% Inputs:
%
% input_data   -  The training data set  (one input sample per row)
% centers      -  Centers of the Gaussians in the GCC model
% covs         -  Covariances for the Gaussians in the GCC model
% ais          -  Mixture proportions
%
% Returns:
%
% labels       - Output labels for input data samples. Each entry is a
%                value in [1,K] for a GCC model with K components.
%
% F.J.E. Nov, 2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [labels]=GCC_Classify(input_data,centers,covs,ais);

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
% TO DO: Complete the function to classify the input dataset using
%        the model provided. The classification rule should be
%        familiar to you from your GMMs
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
weight = zeros(size(input_data,1),size(input_data,2));
for i = 1:size(centers,1) 
    constant = (1/sqrt(((2*pi)^size(input_data,2))*det(covs(:,:,i))));
    sd = input_data-centers(i,:);
    variable = exp((-0.5)*(sum(sd'.*(inv(covs(:,:,i))*sd')))');
    weight(:,i) = constant * variable;
end
[M,labels] = max(weight,[],2);
    