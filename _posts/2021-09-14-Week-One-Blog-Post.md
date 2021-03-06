---
title: "Week 1 Analysis: Cognitive Decision-Making"
date: 2021-09-14
---
## Week 1 Analysis: Cognitive Decision-Making
*Tuesday, September 14, 2021*

This week, I am analyzing some aspects of cognitive decision-making, building off the work of [Atkinson et al. (2009)](https://scholar.harvard.edu/files/renos/files/atkinsonenoshill2009.pdf) that was covered in class.

### Facial Competence and Decision-Making
In their 2009 paper, Atkinson, Enos, and Hill provide a quantitative measure for the perceived competence of U.S. Senate candidates, taking a paired-comparison survey approach to collect a large number of responses that are based upon relatively quick, instinctual choices. They find that "in more competitive races, the out-party tends to run candidates with higher quality faces," suggesting that to some extent, a candidate's appearance may matter (although the authors do note that "the challenging candidate's face is never the difference between a challenger and incumbent victory.")

Underpinning the assumption that people (specifically, voters) could be influenced by candidates' facial appearances is the idea of heuristics. This is well-explained by [Kahneman (2003)](https://doi.apa.org/doiLanding?doi=10.1037%2F0003-066X.58.9.697), who asserts that as a likely result of human evolution, intuition (quick decision-making) and reasoning (protracted decision-making) operate separately in the mind as a two-system process, with intuition being put to use much more frequently. As part of intuition, some thoughts come to the mind much more easily and quickly, such as the familiar characteristics of an otherwise unfamiliar subject. Subsequently, the mind naturally uses those familiar characteristics to judge that subject, as part of a process called heuristics.

Thus, in the arena of political candidates, voters who aren't particularly familiar with a candidate's policy platforms or stances may choose to instead evaluate a familiar trait: whether the candidate appears competent (or at least, more competent than the opponent). Assuming that voters will have seen candidates at least once prior to the election (since pictures do not appear on ballots), psychological heuristics are why facial quality matters in politics.

### Incumbents and Competitiveness
As an extension from Atkinson et al. (2009), I am looking to evaluate whether there is a relationship between incumbents seeking re-election, their facial quality, and the competitiveness of the race. Given the authors' conclusion that candidates with higher-quality faces tend to do better, the natural hypothesis for my question would be that incumbents in safer (i.e. less competitive) seats may have less-attractive faces.

To start off with the analysis, I had to create an indicator of each electoral race's competitivenesstook the Cook Political Report assessment of the electoral race in the year prior to the election. I defined the least competitive races (1 on a scale of 4) to be Republican incumbents in "solid Republican" seats and Democratic incumbents in "solid Democratic" seats, while the most competive races were "tossups" (4 on a scale of 4). Then, I plotted this competition indicator against the corresponding candidate's facial quality, as measured by Atkinson et al.

![Linear Regression for Seat Safety and Incumbent Facial Quality](https://yanxifang.github.io/Gov-1372/images/seatsafety_incumbentface.png)

As shown above, the line of best fit (in black) on the first plot is almost horizontal, indicating the lack of a relationship, either positive or negative, between seat competitiveness and the incumbent's facial quality. In other words, the first plot suggests that incumbents in more competitive seats do not necessarily have more attractive faces (and vice versa: incumbents in safer seats do not necessarily have less attractive faces). Separating the incumbents by party (Democratic or Republican) in the second plot led to some notable changes from a visual perspective, but ultimately, despite what the lines of best fit may suggest (i.e. Democrats having higher-quality faces in more competitive seats, and Republicans having lower-quality faces in more competitive seats), the numerical summary falls short. As displayed below, none of the coefficients have p-values that are even close to being statistically significant.

| Model | Variable | Coefficient | P-Value |
| --- | --- | --- | --- |
| Overall| Constant | 0.2721 | 0.0386 |
|  | Seat Competitiveness | 0.0065 | 0.9153 |
| Democratic Only | Constant | 0.0358 | 0.8540 |
|  | Seat Competitiveness | 0.1220 | 0.1900 |
| Republican Only | Constant | 0.4739 | 0.0082 |
|  | Seat Competitiveness | -0.0877 | 0.2738 |

In other words, my original hypothesis that seat safety is negatively correlated with incumbent facial quality is clearly not reflected in the data.

### Extension: Another Model Class?
Nonetheless, linear regression (which I used above) is not the only type of model that can be used to assess the relationship between the two variables of interest here. So, I decided to adopt a model -- the ordered multinomial logit model -- that I had encountered in Gov 52 in Chapter 6 of *Data Analysis Using Regression and Multilevel/Hierarchical Models* (Gelman and Hill, 2007). This model makes sense here because the competitiveness scores, which I had assigned on a scale of 1-4, are a great example of ordered categorical outcomes, which is what the multinomial logit model requires.

The model is an extension of regular logit and probit regression, which are models that use probabilities to describe the relationship between variables. Specifically, the multinomial logit model uses a series of thresholds/cutpoints to denote where "switches" from one category to another occur; in this case, it would be the values of the facial quality measure at which the races move from one level of electoral race competitiveness to another (e.g. from least competitive to second-least competitive). The results of applying this model to the data are visualized below:

![Ordered Logit Model for Seat Safety and Incumbent Facial Quality](https://yanxifang.github.io/Gov-1372/images/seatsafety_incumbentface_orderedlogit.png)

On this plot, the variables on the x- and y-axes are switched; now, seat competitiveness -- the ordered categorical variable -- is considered the outcome variable, which still makes sense because my original hypothesis was centered around a correlation and was not clear on which way the relationship goes (i.e. whether a more competitive seat leads to higher facial quality, or whether higher facial quality leads to more competition). Consequently, if there is a correlation between the two variables, then I would expect to see clear cutpoints and a convincing logit curve on the plot. However, this is not the case; the model is not staitistically significant and in fact, as shown below, the cutpoints are well beyond the range of the facial scores.

| Value Name | Coefficient | Std. Error | Cutoff Point |
| --- | --- | --- | --- |
| face_rating | 0.0662 | 0.3995 | |
| Intercept, 1 to 2 | -0.0006 | -0.0040 | -0.0094 |
| Intercept, 2 to 3 | 0.9271 | 5.3786 | 14.0055 |
| Intercept, 3 to 4 | 2.2429 | 8.8244 | 33.8836 |

In other words, this second model class also shows that there is no conclusive correlation between the incumbent's facial quality and the competitiveness of the electoral race.

### Conclusion
While the data is limited in the sense that there is a strong reliance on a sole indicator of electoral competitiveness (Cook's Political Report), the findings about the lack of a correlation do provide (a minimal amount of) evidence that substitution heuristics and instantaneous decision-making may not be the best models for thinking about how voters make their decisions at the ballot box. If rapid decision-making were actually important, then it would stand to reason that because voters perceive lower-quality faces to represent less competent candidates, then incumbents should have higher-quality faces because they have already been voted in (and are seeking re-election), especially in more competitive districts/seats. 

Nonetheless, it is critical to recognize that this analysis only touches on a very small part of political psychology. Contextually, the relationship (or lack thereof) between facial quality and electoral race competitiveness is only a subset of the facial quality research, which in turn is only a small subset of the field of understanding how human brains process information and use it to make political decisions. More to come next week...

*Click [here](https://yanxifang.github.io/Gov-1372/) to return to the front page.*
