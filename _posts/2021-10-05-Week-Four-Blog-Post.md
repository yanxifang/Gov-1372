---
title: "Week 4 Analysis: Hierarchies"
date: 2021-10-05
---
## Week 4 Analysis: Hierarchies
*Tuesday, October 5, 2021*

This week, I evaluate the relevance of Social Dominance Theory -- as proposed by [Sidanius and Pratto (1999)](https://www.cambridge.org/core/books/social-dominance/ADA29C256881001463D6E2777404DB95) -- to hierarchies and political behavior within the United States.

### Social Dominance Theory and Hierarchies
Now that I've explored the dynamics and politics of [groups](https://yanxifang.github.io/Gov-1372/2021/09/28/Week-Three-Blog-Post.html), a natural next step is to understand how groups interact with each other -- and how that is manifested in today's society. To answer this question, Sidanius and Pratto (1999) propose using the Social Dominance Theory framework, which essentially states that group-based social hierarchies structure human societies, with hierarchies determined by (a) age, (b) gender, or (c) an arbitrary set of rules, while the ultimate social outcomes are shaped by institutions, which can either enhance or attenuate existing hierarchies.

At the individual level, Sidanius and Pratto further propose a measure called the Social Dominance Orientation, which they define as "the degree to which individuals desire and support group-based hierarchy and the domination of 'inferior' groups by 'superior' groups." Unsurprisingly, they write that individuals vary in their SDO based on how/whether they identiy with salient groups, how they are socialized, and their personality. A person's SDO score is also correlated with various other traits (both inherited and acquired), ranging from gender and race/ethnicity to career preferences. Usually, SDO scores are measured on a 5-point scale, with higher scores representing a more dominant personality and lower scores representing a less dominant personality.

**This is relevant to politics because throughout history, and particularly throughout American history, various racial and socioeconomic groups have dominated society,** making it essential to understand how inter-group dynamics work if a more egalitarian society is to be achieved. So, how exactly does the idea of domination play out in the U.S. today?

### Measuring Social Dominance
Typically, we are most interested in how "socially dominant" individuals are, because some of the most important political decisions, particularly voting (both by the general public and by members of legislatures), are made at the individual level. To actually measure this, a series of 16 statements are shown to correspondents with the goal of understanding their attitudes, not only in terms of dominance, but also in terms of egalitarianism. These statements include things like "groups at the bottom should not have to stay in their place" and "we should do what we can to equalize conditions for different groups."

To conduct my analysis this week, I used the dataset made available to the entire class (`sdo_data.csv`), which consisted of condensed results from a 2018 survey of U.S. voters conducted by Data for Progress, a progressive, left-wing think tank. Among other things, the survey measured SDO scores, demographic information, political information (e.g. party membership, 2016 presidential vote, ideological leanings), respondents' attitudes toward the following: Trump, the Black Lives Matter movement, the MeToo movement, the prospect of demographic change, and the symbolism of the Confederate flag. While this survey is not perfect (after all, it was conducted by a left-leaning group, and likely in pursuit of progressive causes), it still provides room for analysis.

### Social Dominance and Party Affiliation
The first thing I evaluated was the relationship between SDO scores and party affiliation. Under Social Dominance Theory, Democrats (who are left-leaning and on average, are much more supportive of inequality-combatting policies than Republicans might be) are expected to have lower SDO scores (i.e. less dominant personalities). **I can observe this trend in the survey data:** as the histogram below shows, respondents who identified themselves as Democrats turned out to have lower SDO scores on average, while respondents who identified themselves as Independents or Republicans had higher SDO scores on average (which would be indicative of higher levels of dominance -- i.e. greater support for the hierarchical status quo). 

![Social Dominance Orientation Scores by Party](https://yanxifang.github.io/Gov-1372/images/social_dominance_byparty.png)

*Click [here](https://yanxifang.github.io/Gov-1372/) to return to the front page.*
