load BBC_classification.mat
[data,V,mu]=datasetPCA(TrainData,3);

% % getting the colour
C=(repmat([200, 200, 200],numel(TrainClasses),1) .* (TrainClasses))/255;

% 
% %get size
S = repmat([1 1 1],numel(TrainClasses),1);
% 
% % getting the dimensions
% 
X = [data(:,1),data(:,1),data(:,1)];
Y = [data(:,2),data(:,2),data(:,2)];
Z = [data(:,3),data(:,3),data(:,3)];
% 
% % now we got everything, now we  can plot
% 
% scatter3(X(:), Y(:), Z(:), S(:), C(:), 'filled')
scatter3(X(:), Y(:), Z(:), S(:),C(:),'*');
colorbar
