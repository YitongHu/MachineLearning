
#load kmeansGT.mat;
load GMMGT.mat;

diffVect=[];

im=double(imread('test_image_2.jpg'))/255;
[l,c,b]=RGB_clustering(im,5,0);
[l,c,b]=RGB_clustering(im,5,1);

centers_kmeans=zeros(size(centersGT_kmeans));
centers_GMM=zeros(size(centersGT_GMM));
covariances_GMM=zeros(size(covariancesGT_GMM));
mps_GMM=zeros(size(mpsGT_GMM));

load kmeans.mat
load GMM.mat

diffVect=[];
for i=1:5
 diffVect(end+1)=sum((centersGT_kmeans(i,:)-centers_kmeans(i,:)).^2);	% K-means centers should be the same
end;
for i=1:5
 diffVect(end+1)=sum((centersGT_GMM(i,:)-centers_GMM(i,:)).^2);		% GMM centers should be the same
end;
for i=1:5								% Covariance matrices should be identical
 c1=covariancesGT_GMM(:,:,i);
 c2=covariances_GMM(:,:,i);
 diffVect(end+1)=sum((c1(:)-c2(:)).^2);
end;
diffVect(end+1)=sum((mpsGT_GMM-mps_GMM).^2);				% Same mixture proportions

fprintf(2,'The result of running my code is:\n');
diffVect