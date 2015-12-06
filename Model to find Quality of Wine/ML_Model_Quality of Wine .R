#  Mohammad Zaidul Karim


# -- TASK 1: CONVERT DATA FROM TEXT TO COLUMN IN CSV -- # 
    # -- By using text to column bar in xls sheet -- #

# -- TASK 2: i) IMPORT DATA FROM CSV TO R WITH HEADER TRUE -- # 

winequality <- read.csv(file.choose(), header=T, sep=",", check.names=TRUE)

      # -- ii) FIND OUT CHARACTERISTICS OF IMPORTED FILE -- #

head(winequality)
str(winequality)
summary(winequality)
class(winequality)
nrow(winequality)
ncol(winequality)


# -- TASK 3: FIND OUT MISSING VALUES(IF ANY) -- #
    
    # -- i) Display attributeswise number of missing value -- #
    # -- ii) Show total number of mission value -- #

sapply(winequality, function(x) sum(is.na(x)))
sum(!complete.cases(winequality)) 

# -- TASK 4:  EXPLORATARY ANALYSIS -- # 
    
    # -- i) Check correration amaong variables
    # -- ii) rcorr() produces correlations and significance levels -- #
          #  for pearson and spearman relations -- #

cor(winequality[,unlist(lapply(winequality, is.numeric))])

library(Hmisc)
rcorr(as.matrix(winequality), type=c("pearson", "spearman"))

    # -- Visualize data -- #

library(corrplot)
library(ggplot2)

corrplot(cor(winequality[,c(1,2,3,4,5,6,7,8,9,10,11)]), method = "ellipse")

# -- TASK 5: PREPROCESSING -- #

  # -- Step 1: Convert characteristics of Predicted variable from integer to numeric -- #

winequality$qualiy <- as.numeric(winequality$qualiy) 
str(winequality)
redwine<-winequality

  # -- Step 2: Convert Predicted variable from multi-class to binary class -- #
      # -- (Model perform better if convert data from multi-class to binary) -- #

redwine$qualiy[redwine$qualiy <= 5] <- 1   
redwine$qualiy[redwine$qualiy > 5] <- 0
str(redwine$qualiy)

  # -- Step 3: Change class of Predicted variable from numeric to factor -- #
      # -- (Logistic regression perform only when Predicted variable is catagorical data) -- #

redwine$qualiy <- as.factor(redwine$qualiy)
str(redwine)

  # -- Step 4: Use R Formula, no need to write var. names everytime -- # 


formula_text <- paste(names(redwine)[12] ,"~",
                      paste(names(redwine[1:11]), collapse="+"))
formula <- as.formula(formula_text)

  # -- Step 5: Fit checks if model on the same data -- #

fit <- glm(formula,data=redwine,family=binomial())
summary(fit)

# -- TASK 7: ALGORITHMS & EXPERIMENT-- #
    
library("RWeka")
library("ROCR")
library("caret")
library("e1071")
library("rJava")

weka_fit <- Logistic(formula, data=wine)
evaluate_Weka_classifier(weka_fit, numFolds = 10)



------------------------------------------------------------

