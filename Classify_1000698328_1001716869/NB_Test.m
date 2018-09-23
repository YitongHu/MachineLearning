load("BBC_classification.")
[NB_probs, NB_ais]=NB_Train(TrainData,TrainClasses+1,5);
[train_labels]=NB_Classify(TrainData, NB_probs, NB_ais);
[test_labels]=NB_Classify(TestData, NB_probs, NB_ais);

"Classification accuracy on training set: "+100*(sum(train_labels==(TrainClasses + 1))/size(TrainClasses,1))
"Classification accuracy on testing set: "+100*(sum(test_labels==(TestClasses+1))/size(TestClasses,1))