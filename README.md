# Data-Model-to-find-Quality-of-Wine
**Applying Machine Learning Algorithm Using R**

In this project we applied machine learning algorithm to determine the quality of wine. 

### Procedures : 

*  Imported dataset into R, checked data characteristics and missing values 
*  Performed Correlation
*  Defined Task, Experience and Performance Criteria
*  Changed values of class “Quality” from  nominal to binomial 
*  Applied Logistic Regression model for prediction
*  Performed 10 Fold Cross Validation 
*  Measured model performance through Confusion Matrix

####  Detail Procedures:  

**TASK 1 :** Converted data in excel  file

**TASK 2 :**  Imported data into R environment

**TASK 3 :** Checked characteristics and data relationship

* **Checked data characteristics with following codes** 
                  
                  head(winequality)

                  str(winequality)

                   summary(winequality)

                   class(winequality)

                   nrow(winequality)

                   ncol(winequality)

**Findings :** Datatype is dataframe. Number of attributes is 12.

* **Find out missing values from dataset** 

                 sapply(winequality, function(x) sum( is.na(x)))
                 sum(!complete.cases(winequality))

**Findings :** There is no missing values exist in the dataset as set has already been cleaned

* **Performed  following correlation** 

1.	**Checked correlation among variables**	

                 cor(winequality[,unlist(lapply(winequality, is.numeric))])	

2.	**Checked  correlations  and  significance  levels  with  pearson and  spearman.  Correlation
	coefficients for all possible pairs of columns of a matrix.**	

                  library(Hmisc)

                  rcorr(as.matrix(winequality), type=c("pearson", "spearman"))

3. **Visualized data**

                  library(corrplot)

                  library(ggplot2)

                  corrplot(cor(winequality[,c(1,2,3,4,5,6,7,8,9,10,11)]), method = "ellipse")
                  
*	**Preprocessing data** 

1. **Converted characteristics of Predicted variable from integer to numeric** 

                   winequality$qualiy <- as.numeric(winequality$qualiy) str(winequality)
                   redwine<-winequality

2.	**Converted Predicted variable from multi-class to binary class**

                    redwine$qualiy[redwine$qualiy <= 5] <- 1 
                    
                    redwine$qualiy[redwine$qualiy > 5] <- 0 
                    
                    str(redwine$qualiy)
                    
   **Model perform better if convert data from multi-class to binary. Here, create 2 classes high=1**

                    (score: <=5)& low=0(score>5)

3.  **Changed class of Predicted variable from numeric to factor** 

            redwine$qualiy <- as.factor(redwine$qualiy) str(redwine)
            
### TASK 4: Reason behind selecting the Model and Define Task, Experience and Performance Criteria

### TASK 5 :  Algorithms and Experiment

**Performed Logistic Regression, “rWeka” package has been using here**

* Used R Formula before run the model, no need to write variables. names every time

* Fit checks if model on the same data

### TASK  6. Comparing with previous study (i.e. Modeling wine preferences by data mining from physicochemical properties)




 

 


 


