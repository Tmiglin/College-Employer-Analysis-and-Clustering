# College-Employer-Analysis-and-Clustering
## Motivation
The goal of this project is to group together post-secondary institutions within the US from the perspective of an asipiring professor/instructor. The origin of this problem comes from the covid-19 epidemic hit schools hard at a time and many post-secondary professors began to retire or how they consider retiring from teaching to protect themselves and their family. From The Chronicle of Higher Education that 69% of professors felt stressed up from 32% pre covid, 68% up from 32% felt fatigued, which becomes a sustainability issue. 74% felt their work-life balance had completely deteriorated from the covid-19 epidemic and 55% of Faculty ar either retired or highly consider retiring, a staggering number that even I couldn't believe. What this made me think of was as the covid epidemic may calm down, there will be many openings for professors at universities, larger than the annual 169,000 openings. With that number constantly rising it would be in employment seekers favor to get an idea of what sort of institution they may be looking to work for.


## EDA

The first analysis we are going to look at is the Staffing at post-secondary institutions based on the institution size now the institution size  attribute does go into negative numbers this is how we attribute was encoded and it does not mean that there are negative people at these institutions. What we are looking for is variance in the data that the model can latch onto, there is more variance in the larger institution sizes.

![image](https://github.com/Tmiglin/College-Employer-Analysis-and-Clustering/blob/main/Visuals/staffAtSize.png#gh-light-mode-only)

Look at the data on the State level what we can expect here  is that states with higher average Staffing should also contain more institutions of larger sizes. we do have some anomalies if you look at the lecturers and Wyoming Georgia and Maryland are significantly higher than most other states and if you look at instructors if we look at Colorado there are a large amount of instructors which makes me believe that not every state reports instructors and lecturers the same. Some states might just report on whatever they see first, but then treat the titles as the same.

![image](https://github.com/Tmiglin/College-Employer-Analysis-and-Clustering/blob/main/Visuals/staffAtState.png#gh-light-mode-only)

## Feature Selection

Random Forest is a supervised model that implements both decision trees and bagging method. The idea of bagging is that, by averaging the outputs of the single decision trees, the standard error decreases and so does the variance of the model according to bias-variance tradeoff.  Each sample contains a random subset of the original columns and is used to fit a decision tree. The number of models and the number of columns are hyperparameters to be optimized. Finally, the predictions of the trees are mixed together calculating the mean value. Each tree of the random forest can calculate the importance of a feature according to its ability to increase the pureness of the leaves, the higher the value the more important the feature is. I inserted a random integer between 1 and 1000 into the feature set. Once I collect the feature scores any feature that scored below the random integer will be removed from the feature set.

![image](https://github.com/Tmiglin/College-Employer-Analysis-and-Clustering/blob/main/Visuals/Feature%20Selection.png)

## Elbow Method

The elbow method uses the sum of squared distance (SSE) to choose an ideal value of k based on the distance between the data points and their assigned clusters. We would choose a value of k where the SSE begins to flatten out and we see an inflection point. When visualized this graph would look somewhat like an elbow, hence the name of the method.

![image](https://github.com/Tmiglin/College-Employer-Analysis-and-Clustering/blob/main/Visuals/elbowmethod.png)

## K-Means Model

We can allude back to one of the previous visualizations to look at our resulting clusters, there are some defining traits for each cluster, and noticeable trends for each cluster within this staffing plot. One hint at centroid placement is to look at the regression lines, the darker blue has a higher slope, and you can see that cluster has more values higher on the y axis, and lower on the x axis. The mirrored observation can be made for the lighter blue cluster, higher amounts of instructional staff, lower academic affair staff. The orange cluster is low in both.

![image](https://github.com/Tmiglin/College-Employer-Analysis-and-Clustering/blob/main/Visuals/clustered.png#gh-light-mode-only)

## Use Case

Now that the institutions are separated into clusters an application for these results can begin with someone identifying which state they would like to live in or teach within,  from there they can look up  an institution that will seem appealing to them, while looking at that school they can also look at other schools within the cluster according to the features that matter most to them, they should find that those schools are similar in those features and from there it might only be a few deciding feature’s for the employment Seeker to decide what institution they would like to work at. For example, an aspiring professor wants to work for a, institution that is within cluster 2.0, there are 13 other institutions




