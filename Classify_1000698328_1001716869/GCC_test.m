dimensions = [3,5,6,7,9,10,15];
load("BBC_classification.")
for i = dimensions
    
[lowd,V,mu]=datasetPCA(TrainData,i);
test_data = (V'*(TestData-mu)')';

[centers,covs,ais]=GCC_Train(lowd,TrainClasses+1,5);
[train_labels]=GCC_Classify(lowd,centers,covs,ais);

[test_labels]=GCC_Classify(test_data,centers,covs,ais);
"for dimension " + i
"Classification accuracy on training set: "+100*(sum(train_labels==(TrainClasses + 1))/size(TrainClasses,1))
"Classification accuracy on testing set: "+100*(sum(test_labels==(TestClasses+1))/size(TestClasses,1))


end

% load("BBC_classification.mat")
% 
% [LowDim_data,V,mu]=datasetPCA(TrainData, 15);
% [centers,covs,ais]=GCC_Train(LowDim_data,TrainClasses+1,5);
% [labels]=GCC_Classify(LowDim_data,centers,covs,ais);
% nnzn = nnz(TrainClasses+1 - labels);
% fprintf(1, "Train Data Accuracy ");
% 1-(nnzn/size(TestData,1))
% 
% std_input_data = TestData - repmat(mu, [size(TestData, 1) 1]);
% LowDim_data = (V'*std_input_data')';
% [labels]=GCC_Classify(LowDim_data,centers,covs,ais);
% nnzn = nnz(TestClasses+1 - labels);
% fprintf(1, "Test Data Accuracy ");
% 1-(nnzn/size(TestData,1))
