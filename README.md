# Introduction

This repository contains both the two capstones, and the corresponding mini-projects from Springboard. This repository will contain, codes for SQL Databases, Supervised Learning, Unsupervised Learning and Big Data Tools.



# Data Wrangling

1. [JSON Extraction and Manipulation](https://github.com/dreamtx01/Springboard/blob/master/Folders/Mini-Projects/JSON_Project/sliderule_dsi_json_exercise.ipynb)
This simple exercise demonstrates ability to work with JSON files. The dataset comes from the 2013 World Bank data on projects funded by the World Bank and is in a JSON file format. I also fill in missing values using a lookup table. Data wrangling reveals that China, Indonesia, and Vietnam had the most projects funded by the World Bank in 2013. The most popular project themes were Environment and natural resources management, Rural development, and Human development.

2. [API Requests with Quandl API](https://github.com/dreamtx01/Springboard/blob/master/Folders/Mini-Projects/API/api_data_wrangling_mini_project.ipynb)

This exercise demonstrates ability to use requests package to retrieve data from Quandl using API keys. For 2017 Franfurt Stock Exchange data (ticker AFX_X), I am able to find out that the lowest opening price was $34.0, the highest opening price was $53.11, and that the median trading volume during 2017 was 76286.000, among other simple financial metrics.

# Statistics: Experimental Design, Hypothesis Testing & Normality Testing

This section is divided into four parts that build on top of each other. Each section uses different statistical methods to gain insights on medical charges data (Source: Kaggle)

1. [Hospital Readmission Analysis](https://github.com/dreamtx01/Springboard/blob/master/Folders/Mini-Projects/Statistics/inferential_statistics_1a.ipynb)

2. [Hospital Readmission Analysis with Frequentist Statistics](https://github.com/dreamtx01/Springboard/blob/master/Folders/Mini-Projects/Statistics/inferential_statistics_1b.ipynb)

Using classical frequentist methods such as the z-statistic and t-statistic and the scipy statistics package, this section investigates two questions:

whether the hospital's revenue stream fell below a key threshold of $12,000
whether people with insurance are charged a different amount to those without Performing statistics on the first question reveals that the lower limit of the 95% confidence interval for the population mean is $12,725.48. Thus it is highly unlikely that the hospital's revenue stream fell below the threshold of $12,000. For the second question, using Welch's t-test gives us a t-value of -13.29. Thus we reject the null hypothesis and conclude that there is a difference in the amount charged between the two groups

3. [Analyzing Hospital Medical Charges with Bootstrapping](https://github.com/dreamtx01/Springboard/blob/master/Folders/Mini-Projects/Statistics/inferential_statistics_2.ipynb)

This section explores the same two questions above but analyzes it using bootstrapping methods. For the first question: When we generate 10,000 bootstrap replicates, we obtain $12724.46 (exact value might vary due to bootstrapping) for the lower limit of the 95% confidence interval, validating our frequentist approach above. For the second question, we conclude that there is no practical need to perform bootstrapping since the obtained t-value is already so low (t-value of -13.29). We do however perform bootstrapping methods to verify that the variances of the two groups (insured vs. non-insured) were unequal, validating our choice of using Welch's t-test in the previous section.

4. [Analyzing Hospital Medical Charges with Bayesian Methods (PyMC3)](https://github.com/dreamtx01/Springboard/blob/master/Folders/Mini-Projects/Statistics/inferential_statistics_3.ipynb)

This section is mostly focused on using and familiarizing oneself with the PyMC3 library. As an exercise, this section models 'no-insurance' group's individual medical charges using Bayesian inferential modeling.

# SQL Database

[SQL Querying](https://github.com/dreamtx01/Springboard/blob/master/Folders/Mini-Projects/SQL/SQL.sql)

# Supervised Learning
[Linear Regression](https://github.com/dreamtx01/Springboard/blob/master/Folders/Mini-Projects/Linear%20Regression/Mini_Project_Linear_Regression.ipynb)

[Logistic Regression](https://github.com/dreamtx01/Springboard/blob/master/Folders/Mini-Projects/Logistic%20Regression/Logistic_Regression_Springboard_Rev1.ipynb)

Naive Bayes

# Unsupervised Learning
1. [Clustering & PCA](https://github.com/dreamtx01/Springboard/blob/master/Folders/Mini-Projects/Clustering/Mini_Project_Clustering.ipynb)

This exercise delves into unsupervised machine learning, specifically K-Means Clustering techniques. The purpose of this exercise is to segment the customers with similar behavior in order to target them for specific promotions in the future. To choose K, the number of clusters, I use both the elbow method and the silhouette method and compare metrics against each approach. For visualizations, we turn to PCA techniques, since this dataset has 32 feature columns. We reduce the dimensionality into 2 dimensions and try to get a feel for how the different clusters are formed for different K-values. Additionally other clustering algorithms such as affinity propagation, spectral clustering, agglomerative clustering, and DBSCAN are used on the dataset and their respective Silhouette Scores are compared.

# Big Data Tools
Spark,Dataframe,SQL & ML with Databricks

MapReduce Using Spark

# Data Science Challenges
Relax Challenge - Discovering Adopted Users

Ultimate Challenge - Logistics & Rideshares


Capstone Projects






