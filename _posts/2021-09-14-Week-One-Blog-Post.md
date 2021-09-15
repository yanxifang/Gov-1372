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
| Democratic Only | Constant | 0.0358 | 0.854 |
|  | Seat Competitiveness | 0.1220 | 0.190 |
| Republican Only | Constant | 0.4739 | 0.00819 |
|  | Seat Competitiveness | -0.0877 | 0.2738 |

![Ordered Logit Model for Seat Safety and Incumbent Facial Quality](https://yanxifang.github.io/Gov-1372/images/seatsafety_incumbentface_orderedlogit.png)


*Click [here](https://yanxifang.github.io/Gov-1372/) to return to the front page.*
