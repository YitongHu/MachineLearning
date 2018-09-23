load NB_GT.mat;
load GCC_GT.mat;
load BBC_classification.mat;

diffVect=[];

NB_probs=[];
NB_ais=[];
NB_Train_Labels=[];
NB_Test_Labels=[];

[NB_probs,NB_ais]=NB_Train(TrainData,TrainClasses+1,5);
if (~isempty(NB_probs))
  [NB_Train_Labels]=NB_Classify(TrainData,NB_probs,NB_ais);
  if (min(NB_Train_Labels)==0) NB_Train_Labels=NB_Train_Labels+1; end;

  [NB_Test_Labels]=NB_Classify(TestData,NB_probs,NB_ais);
  if (min(NB_Test_Labels)==0) NB_Test_Labels=NB_Test_Labels+1; end;
end;

GCC_centers=[];
GCC_covs=[];
GCC_ais=[];
GCC_Train_Labels=[];
GCC_Test_Labels=[];

[TrainData_LowDim,V,mu]=datasetPCA(TrainData, 6);
TD_small=(V'*(TrainData-repmat(mean(TrainData),[size(TrainData,1) 1]))')';
TS_small=(V'*(TestData-repmat(mean(TestData),[size(TestData,1) 1]))')';

[GCC_centers,GCC_covs,GCC_ais]=GCC_Train(TD_small,TrainClasses+1,5);

if (~isempty(GCC_centers))
  [GCC_Train_Labels]=GCC_Classify(TD_small,GCC_centers,GCC_covs,GCC_ais);
  if (min(GCC_Train_Labels)==0) GCC_Train_Labels=GCC_Train_Labels+1; end;

  acc=length(find(GCC_Train_Labels-(TrainClasses+1)==0))/length(TrainClasses);
  fprintf(2,'Training set GCC accuracy = %f\n',acc);

  [GCC_Test_Labels]=GCC_Classify(TS_small,GCC_centers,GCC_covs,GCC_ais);
  if (min(GCC_Test_Labels)==0) GCC_Test_Labels=GCC_Test_Labels+1; end;

  acc=length(find(GCC_Test_Labels-(TestClasses+1)==0))/length(TestClasses);
  fprintf(2,'Testing set GCC accuracy = %f\n',acc);
end;

diffVect=[];
for i=1:5
 diffVect(end+1)=sum((NB_probs(i,:)-NB_probs_GT(i,:)).^2);		% Check probabilities output by NB_Train()
end;
for i=1:5
 diffVect(end+1)=sum((abs(GCC_centers(i,:))-abs(GCC_centers_GT(i,:))).^2);	% Check mean locations for GCC components
end;
for i=1:5								% Check covariances for GCC components
 c1=GCC_covs_GT(:,:,i);
 c2=GCC_covs(:,:,i);
 diffVect(end+1)=sum((c1(:)-c2(:)).^2);
end;
diffVect(end+1)=sum((NB_ais_GT-NB_ais).^2);				% Check proportions for NB_Train()
diffVect(end+1)=sum((GCC_ais_GT-GCC_ais).^2);				% Check proportions for GCC_Train()

if (size(NB_Train_Labels,1)==1) NB_Train_Labels=NB_Train_Labels'; end;
if (size(NB_Test_Labels,1)==1) NB_Test_Labels=NB_Test_Labels'; end;
if (size(GCC_Train_Labels,1)==1) GCC_Train_Labels=GCC_Train_Labels'; end;
if (size(GCC_Test_Labels,1)==1) GCC_Test_Labels=GCC_Test_Labels'; end;
diffVect(end+1)=length(find(NB_Train_Labels_GT-NB_Train_Labels==0))/length(NB_Train_Labels_GT);
if (diffVect(end)>1) diffVect(end)=0; end;
diffVect(end+1)=length(find(NB_Test_Labels_GT-NB_Test_Labels==0))/length(NB_Test_Labels_GT);
if (diffVect(end)>1) diffVect(end)=0; end;
diffVect(end+1)=length(find(GCC_Train_Labels_GT-GCC_Train_Labels==0))/length(GCC_Train_Labels_GT);
if (diffVect(end)>1) diffVect(end)=0; end;
diffVect(end+1)=length(find(GCC_Test_Labels_GT-GCC_Test_Labels==0))/length(GCC_Test_Labels_GT);
if (diffVect(end)>1) diffVect(end)=0; end;

fprintf(2,'The result of running my code is:\n');
diffVect