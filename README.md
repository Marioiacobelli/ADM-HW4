# Homework 4 - Recommendation systems and clustering everywhere

### This homework has been done by Group 15:
- Francesco Mari - mari.1919565@studenti.uniroma1.it
- Mario Iacobelli - iacobelli.1841427@studenti.uniroma1.it
- Lorenzo Incoronato - incoronato.1916863@studenti.uniroma1.it
- Eduardo Baldó Chamorro - eduardobaldo10@gmail.com

## Data used
For this homework we've used 1 main link, the link of the [UK Netflix audience]([https://www.findamasters.com/](https://www.kaggle.com/datasets/vodclickstream/netflix-audience-behaviour-uk-movies)).

From this webpage we implement our version of the LSH algorithm first, and the we will do some feature engeneering and clustering

## Different Files

1. `main.ipynb`:
   
   Here are all the answers to the HW4, with all the functions inside of it.

2. `CommandLine.sh `:

   Here we have the command line from the CLQ question

3. `csv_files `:

   A folder containing two zipped csv files of the dataset used for exercises 2.3 and 2.4 


# Master's Degrees from all over! 

In this homework, the focus revolves around implementing a recommendation system tailored for user preferences in the context of movie clicks. The first segment entails building the system's backbone, beginning with the implementation of Locality-Sensitive Hashing (LSH) and Minhash Signatures. The following step involves recommending movies to a given user based on the preferences of similar users. To achieve this, a personalized algorithm is developed to identify the two most similar users, proposing the most-watched movies they have in common or prioritizing movies from the most similar user.

The second part encompasses data preprocessing and feature engineering, including the creation of features such as favorite genre, average click duration, and time-of-day preferences. Additional features are suggested and implemented for each user. Dimensionality reduction techniques like Principal Component Analysis (PCA) are applied to manage the burgeoning feature set. The clustering stage involves implementing the K-means algorithm from scratch, exploring optimal cluster numbers through various methods, and employing clustering metrics for performance evaluation.

Additionally, a bonus task involves implementing a Density-Based Clustering algorithm, comparing and analyzing its results against centroid-based clustering. The homework also delves into a command line question, instructing the creation of a script to extract insights from the dataset, and an algorithmic question focused on optimizing a recursive scoring system.
