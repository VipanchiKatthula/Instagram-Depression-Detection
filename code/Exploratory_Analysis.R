#Text analysis
install.packages("corrplot")
library(corrplot)

#reading the file
RDataInput<-read.csv("ExploratoryDataAnalysisInput.csv",header=T)

#Setting the categorical columns as factors
RDataInput$Depressed=as.factor(RDataInput$Depressed)
RDataInput$Female=as.factor(RDataInput$Female)
RDataInput$AgeCategory=as.factor(RDataInput$AgeCategory)


#t-test for numerical variables
t.test(RDataInput$number_of_hashtags~RDataInput$Depressed)
t.test(RDataInput$average_hashtags_per_post~RDataInput$Depressed)
t.test(RDataInput$number_of_words~RDataInput$Depressed)
t.test(RDataInput$average_words_per_post~RDataInput$Depressed)
t.test(RDataInput$avg_sentimentpositive~RDataInput$Depressed)

t.test(RDataInput$avg_sentimentnegative~RDataInput$Depressed)
t.test(RDataInput$avg_sentimentneutral~RDataInput$Depressed)
t.test(RDataInput$avg_sentimentcompound~RDataInput$Depressed)
t.test(RDataInput$cnt_neg_posts~RDataInput$Depressed)
t.test(RDataInput$cnt_neu_posts~RDataInput$Depressed)
t.test(RDataInput$cnt_pos_posts~RDataInput$Depressed)
t.test(RDataInput$avg_polarity~RDataInput$Depressed)
t.test(RDataInput$No_of_Posts~RDataInput$Depressed)
t.test(RDataInput$No_of_Followers~RDataInput$Depressed)

#chi-square test for gender and age
stab<- table(RDataInput$Female, RDataInput$Depressed)
chisq.test(stab)

stab<- table(RDataInput$AgeCategory, RDataInput$Depressed)
chisq.test(stab)

#correlation matrix
RDataInput_cor <- cor(select_if(RDataInput, is.numeric))
corrplot(RDataInput_cor)

#Image analysis
imagedata2_3<-read.csv("ImageDataInput.csv",header=T)

#Setting the categorical columns as factors
imagedata2_3$isDepressed=as.factor(imagedata2_3$isDepressed)


#t-test for numerical variables
t.test(imagedata2_3$HueMean~imagedata2_3$isDepressed)
t.test(imagedata2_3$HueMax~imagedata2_3$isDepressed)
t.test(imagedata2_3$HueMin~imagedata2_3$isDepressed)
t.test(imagedata2_3$SaturationMean~imagedata2_3$isDepressed)
t.test(imagedata2_3$SaturationMax~imagedata2_3$isDepressed)
t.test(imagedata2_3$SaturationMin~imagedata2_3$isDepressed)
t.test(imagedata2_3$BrightnessMean~imagedata2_3$isDepressed)
t.test(imagedata2_3$BrightnessMax~imagedata2_3$isDepressed)
t.test(imagedata2_3$BrightnessMin~imagedata2_3$isDepressed)
t.test(imagedata2_3$FaceCountMax~imagedata2_3$isDepressed)
t.test(imagedata2_3$FaceCountMin~imagedata2_3$isDepressed)
t.test(imagedata2_3$FaceCountMean~imagedata2_3$isDepressed)
t.test(imagedata2_3$`Photosw/Smile`~imagedata2_3$isDepressed)
t.test(imagedata2_3$`TotalPhotosw/faces`~imagedata2_3$isDepressed)

#correlation matrix
imagedata2_3_cor <- cor(select_if(imagedata2_3, is.numeric))
corrplot(imagedata2_3_cor)
