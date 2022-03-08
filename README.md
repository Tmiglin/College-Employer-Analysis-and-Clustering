# College-Employer-Analysis-and-Clustering
## Motivation
The goal of this project is to group together post-secondary institutions within the US from the perspective of an asipiring professor/instructor. The origin of this problem comes from the covid-19 epidemic hit schools hard at a time and many post-secondary professors began to retire or how they consider retiring from teaching to protect themselves and their family. From The Chronicle of Higher Education that 69% of professors felt stressed up from 32% pre covid, 68% up from 32% felt fatigued, which becomes a sustainability issue. 74% felt their work-life balance had completely deteriorated from the covid-19 epidemic and 55% of Faculty ar either retired or highly consider retiring, a staggering number that even I couldn't believe. What this made me think of was as the covid epidemic may calm down, there will be many openings for professors at universities, larger than the annual 169,000 openings. With that number constantly rising it would be in employment seekers favor to get an idea of what sort of institution they may be looking to work for.


## EDA

The first analysis we are going to look at is the Staffing at post-secondary institutions based on the institution size now the institution size  attribute does go into negative numbers this is how we attribute was encoded and it does not mean that there are negative people at these institutions. What we are looking for is variance in the data that the model can latch onto, there is more variance in the larger institution sizes.

![image](https://github.com/Tmiglin/College-Employer-Analysis-and-Clustering/blob/main/Visuals/staffAtSize.png#gh-light-mode-only)

Look at the data on the State level what we can expect here  is that states with higher average Staffing should also contain more institutions of larger sizes. we do have some anomalies if you look at the lecturers and Wyoming Georgia and Maryland are significantly higher than most other states and if you look at instructors if we look at Colorado there are a large amount of instructors which makes me believe that not every state reports instructors and lecturers the same. Some states might just report on whatever they see first, but then treat the titles as the same.

