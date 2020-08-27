# Instagram-Depression-Detection
### TABLE OF CONTENTS
* [Objective](#objective)
* [Technologies](#technologies)
* [Algorithms](#algorithms)
* [Background](#background)
* [Data](#data)
* [Implementation](#implementation)
* [Results](#results)
* [Conclusion](#conclusion)

## TECHNOLOGIES
Project is created with:

* Python - **pandas, Tokenizer**
* Tesseract
* Vader
* OpenCV

## ALGORITHMS
* Sentiment Analysis
* Random Forest
* Support Vector Machine(SVM)
* Logistic Regression

## BACKGROUND
According to the World Health Organization (WHO), Depression is the leading cause of disability worldwide affecting more than 264 million people of all age groups around the world. **Post- traumatic stress disorder (PTSD)** is a form of depression that develops after exposure to a potentially traumatic event like witnessing accidents, physical or sexual assault, combat or death. In the United States, about 8 million adults have PTSD in a given year. It is a serious health condition causing persistent thoughts of traumatic memories, insomnia, and severe anxiety. Thus, early diagnosis and treatment is of paramount importance. There are therapy methods and medications available for its effective treatment. With the growth of social media, people tend to post most of their activities online in the form of text and images which reflects their mental health condition to a great extent. Finding these indicators will help in early diagnosis and could help save a life in future.

## OBJECTIVE 
This project focuses on **finding the important markers of PTSD** based on the **captions and images** a person posts on the social media platform, Instagram. A machine learning model is built to classify whether a person may be suffering from PTSD based on their Instagram posts (text and images).

## DATA
The data for the project was collected manually. First a cohort of 150 individuals were selected. After setting constraints on the minimum number of instagram posts, stratified sampling with age and gender a group of 50 depressed individuals(self-reported on instagram) were selected and analyzed. Another set of 50 non-depressed individuals were identified using matched pairs methodogy. With the data being sensitive to the users, I am not sharing the data on GitHub.

The data was pulled using https://github.com/instaloader/instaloader for all the individuals. The project only deals with instagram accounts which are public as private accounts cannot be scraped without becoming friends with them on Instagram.

* Emoji analysis from Text

![GitHub Logo](/images/emojianalysis.PNG)

## IMPLEMENTATION
* Instagram handles of 50 individuals suffering from PTSD and 50 non-depressed individuals were collected with thorough analysis using keywords proving their mental health status. Matched pairs methodology was used to maintain similar distribution among the selected individuals for both groups by their gender and age demographics. Text and images of instagram posts were analysed separately. 
* Topic modelling was done to identify word patterns to distinguish depressed individuals from non-depressed individuals. Unsupervised **Latent Dirichlet Allocation(LDA)** and **Supervised Correlation Explanation(Corex)** models were developed. Text models were built with 10,695 word features and their
corresponding TF-IDF scores to predict the mental health status as Depressed and Non-depressed. **Random Forest Classifier, Linear Support Vector Classifier(SVC), Multinomial Naive Bayes and Logistic Regression models** were built and analyzed with 5-fold cross validation.
* Image analysis in both depressed and non-depressed categories was done using openCV library and python language to extract image features such as Hue, Saturation and Brightness. Tesseract library was used to segregate images containing text and images containing faces/ nature shots.Images containing text like memes and quotes were removed. HSV values were recorded for each photo of users and were aggregated to generate data at user level. 
* Facecount and smile was extracted using the HAARCascade implementation for detecting faces using the openCV library. Facecount and smile features were added to the dataframe with all the HSV values. The maximum, minimum and mean of HSV , facecount , number of photos with smiles and total photos with faces were used to develop a Logistic Regression Model.

## RESULTS
Exploratory analysis revealed that out of the 14 numeric variables only 4 variables were significant based on t-test with the target variable, with p-value lower than 0.05.For the two categorical columns female and age category, Chi-square test showed a p-value of 0.005095 for age category making it a significant variable.Correlation matrix revealed that there was no significant correlation between any two numerical variables.

Text analysis of instagram posts using the Supervised CorEx algorithm revealed that causes of depression were abuse, accident, loss and trauma. The Symptoms of depression were illness,mentally, broken, breaking and hiding. The Coping Mechanisms of the depressed were doing meditation, expressing emotions and struggles, getting fit, motivation and maintaining balance. The treatment options used by the individuals were expressed by the use of words like therapy, healing, challenging, feeling like and overwhelmed. The physical symptoms of depression were identified to be drugs, alcohol, sweat, harm and drinking.

* Anchors
![GitHub Logo](/images/CorExAnchors.PNG)

* Output 
![GitHub Logo](/images/CorExoutput.PNG)

Linear Support Vector Classifier(SVC) model was best to identify the depressed individuals using the text TF-IDF features with accuracy - 92.895%, precision - 98% and recall - 92%. Predicting data using Linear SVC model on test data resulted in an accuracy of 89%, precision - 85% and recall - 85%.

![GitHub Logo](/images/logisticoutput.png)

Image analysis revealed that the **average Hue value for Happy people was found to be lesser than depressed people**, indicating that images of depressed people were more blue and images of happy people were more red(P<2.2e-16, depressed -124, non-depressed - 65.3). **Happy people had more gray and faded images as compared to depressed people(P<1.319e-09)**. **Happy people posted brighter images than depressed people** who posted images which were dull and sometimes blurred and darker(P<2.8e-12).

![GitHub Logo](/images/imageanalysis.PNG)

**Facecount was on average 1 or 2 for depressed people** as compared to an **average of 4 for happy people** who loved posting in groups quite often(P<0.01). **Only 1 out of 15 photos had smiling faces in the depressed category** as compared to **1 out every 3 photos for non-depressed profiles(P<0.01).**

## CONCLUSION
The choice of words of an individual is highly influenced by the mood and the mental health status of a person. The main causes of depression were identified to be trauma caused by sexual abuse, accident or loss. The  number of words and average number of words per post, average negative sentiment, Count of negative posts and age category were significant in determining if a person is showing signs of PTSD. Willingness to get treated was partly determined by their use of words like therapy, healing, fitness etc. Females tend to talk more and easily about their mental issues as compared to males.The results of this study are useful for health care providers and physicians for early identification of signs of depression in a person from their Instagram posts.

