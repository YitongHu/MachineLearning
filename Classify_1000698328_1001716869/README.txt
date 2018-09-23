Description:
The data we used was obtained from : https://github.com/samanyougarg/Machine-Learning-Spam-Filter 

What our crunchy does is the following: 
-uses data on spam emails 
-runs NB and GCC on the training and testing data from random emails, and uses features (0:not spam, 1:spam)
-the accuracy of how many spam email is correctly identified will be calculated

From NB we obtained:

    "The accuracy of the training data (NB) is: 0.79304"
    "The accuracy of the testing data (NB) is: 0.78835"

From GCC we obtained:

    "The dimension used is: 5"
    "The accuracy of the training data (GCC) is: 0.89348"
    "The accuracy of the testing data (GCC) is: 0.88874"

    "The dimension used is: 10"
   "The accuracy of the training data (GCC) is: 0.91261"
    "The accuracy of the testing data (GCC) is: 0.92395"

    "The dimension used is: 15"
    "The accuracy of the training data (GCC) is: 0.90739"
    "The accuracy of the testing data (GCC) is: 0.91047"

    "The dimension used is: 20"
    "The accuracy of the training data (GCC) is: 0.9213"
    "The accuracy of the testing data (GCC) is: 0.91656"

    "The dimension used is: 25"
    "The accuracy of the training data (GCC) is: 0.9287"
    "The accuracy of the testing data (GCC) is: 0.92568"

    "The dimension used is: 30"
    "The accuracy of the training data (GCC) is: 0.93043"
    "The accuracy of the testing data (GCC) is: 0.92655"

    "The dimension used is: 35"
    "The accuracy of the training data (GCC) is: 0.93435"
    "The accuracy of the testing data (GCC) is: 0.92916"

    "The dimension used is: 40"
    "The accuracy of the training data (GCC) is: 0.92957"
    "The accuracy of the testing data (GCC) is: 0.92568"

Overall GCC is better here as the data is binary, and has smaller dimensions. We see that the accuracy for GCC decreases at 
dimension 15 and starts to increase until it decreases again at dimension 40. 

Where to find:

Will be with the submission of Assignment 3 with the name: crunchy_1000698328_1001716869.zip

How to run: 

Open the Crunchy.m and press run on matlab. 