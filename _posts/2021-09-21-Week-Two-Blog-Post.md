---
title: "Week 2 Analysis: Human Cooperation"
date: 2021-09-21
---
## Week 2 Analysis: Human Cooperation
*Tuesday, September 21, 2021*

This week, I am analyzing part of the fundamental reasoning behind human cooperation, building off the work of [Axelrod (2006)](https://www.basicbooks.com/titles/robert-axelrod/the-evolution-of-cooperation/9780465005642/) that was discussed in class to discuss the implications for politics.

### Cooperation and Human Evolution
In his 2006 book, Robert Axelrod describes a theory of cooperation based on the notion that repeated human interaction over time will create incentives for cooperation. Starting with the intuitive idea that self-interested individuals may not necessarily have the incentives to cooperate with each other without a centralized authority compelling such cooperation, Axelrod cites the classic Prisoner's Dilemma game (shown below), where defecting from cooperation can actually yield better results for an individual. 

However, Axelrod points out that the Prisoner's Dilemma game can actually be solved, with the most common solution being repeated interactions between players. He goes on to explain that cooperation, fueled by cooperation and reciprocity, is evolutionarily advantageous, allowing it to become a stable strategy that endures over time; this explains why humans still cooperate today.

| P1, P2 | C | D |
| --- | --- | --- |
| C | R = 3, R = 3 | S = 0, T = 5 | 
| D | T = 5, S = 0 | P = 1, P = 1 | 

### Simulating Cooperation
However, the principle of cooperation is not sufficient by itself. Cooperation can take many forms, especially with regard to how individuals respond to defections by the other party (or to continued cooperation); as previously mentioned, unilateral decisions to not cooperate can often prove advantageous for the defecting party. Thus, different people can have different views on what cooperation looks like, leading to different strategies of cooperation (i.e. different sets of rules about when and when not to cooperate).

This was a central part of Axelrod's work: he invited submissions of computer programs from game theorists from around the world, with the aim of testing different strategies against each other to see which yielded the best results. Conceptually, the strategy that yielded the highest scores (i.e. the most benefits for the player) would be most advantageous from an evolutionary perspective, because that party would have the most resources with which to survive.

For this week's blog post, I have replicated part of Axelrod's "tournament" of different strategies. I chose six strategies to focus on, with their behavioral patterns described below:
- Backstabber
  - Cooperates until the opponent defects 3 times.
  - Defects forever after that.
  - Always defects in the last 2 rounds.
- Cooperator
  - Cooperates systematically.
- Cycler
  - Cooperates 3 times in a row, then defect once.
  - Repeats sequence until the end of the tournament.
- Fool Me Once
  - Cooperates the first time it plays a new opponent.
  - Keeps cooperating after the first defection of the opponent.
  - Defects systematically after the opponent defects a second time.
- Random
  - Cooperates or defects at random.
- Tit-for-Tat
  - Cooperates the first time it plays a new opponent.
  - Mirrors the last move of each opponent in subsequent encounters.
  - *Note*: Axelrod found this strategy to be dominant, i.e. prevailing over all others in his "tournament."

These strategies were played against each other in a round-robin style, with each strategy facing each of the other 5 strategies once. For each of the 15 encounters, I recorded the winner, as well as the number of points scored by each strategy. The final results are provided below:

| Player | Total Score | Number of Wins |
| --- | --- | --- |
| Backstabber | 1576 | 5 |
| Cooperator | 1266 | 0 |
| Cycler | 931 | 2 |
| Fool Me Once | 1577 | 2 |
| Random | 1075 | 3 |
| Tit-for-Tat | 1391 | 0 |
| *Tie* | | 3 |

![Comparison of Scores for Six Cooperation Strategies](https://yanxifang.github.io/Gov-1372/images/axelrod_strategies_scores.png)

There are a number of notable patterns here:
- Despite Axelrod's findings, **"Tit-For-Tat" was not the dominant strategy based on the simulations I ran.** Instead, strategies that are arguably more aggressive in terms of defection enforcement procedures (i.e. "Backstabber" and "Fool Me Once") performed better, particularly in terms of the total score but also in terms of the number of wins. This shows that while the "shadow of the future" (a term referring to the prospect of future rewards and how much/little individuals value them) may be present to limit socially inefficient defections, it is nonetheless important to have a more confrontational stance to respond to such incidents.
- **"Nicer" strategies performed worse** in terms of winning: specifically, the "Cooperator" strategy did not win a single round. Although it did gain a respectable number of points, showing that even a stubborn insistence on cooperation can build trust with the opponent, this does show the downside of being too nice: consistently ending up with fewer resources relative to the other party, which likely did not bode well in the human evolutionary process.
- Nonetheless, **"Tit-For-Tat" was one of the more consistent strategies in terms of points won against opponents.** This is significant because the simulations that I ran were only a small subset of what Axelrod did for his book. Being consistent suggests that "Tit-for-Tat" will have approximately the same (i.e. relatively high) performance against the many other strategies that are out there, which would align with Axelrod's findings that it was the dominant one.

### Application to Political Psychology (and General Politics)
So far, I've explored some of the theories underpinning human cooperation, but what exactly do they tell us about political psychology and politics as a whole? The answer is actually quite straightforward: cooperation is needed in many political situations, particularly in legislatures. Many Congressional bills today are passed on a party-line basis, which requires cooperation from all members of that party, while historically (i.e. when Congressional bills tended to be more bipartisan), cooperation across parties -- and across individual members of Congress -- had to be attained.

Thus, the patterns described above do have real-world parallels. For instance, on the enforcement/punishment front, when a member of a political party (either Democratic or Republican) defies the party excessively, there can be immense pressure for that person to be replaced; this happened four months ago with Rep. Liz Cheney, whose strong opposition to Trump led to her [being voted out of her No. 3 position in the House GOP leadership](https://www.nbcnews.com/politics/congress/house-republicans-vote-liz-cheney-s-future-leadership-rebuking-trump-n1266992) and replaced with Rep. Elise Stefanik. In a similar vein, Sen. Bernie Sanders, who is now quite popular with many Democrats, is actually an independent, having criticized various members of the Democratic Party over his decades-long political career; this shields him from some of the penalties that defecting that he might have otherwise incurred.

Meanwhile, on the "niceness" front, it is also clear that being nice does not always yield positive political outcomes in the real world. In the realm of judicial nominees in the U.S. Senate, the Democrats' choice to [abolish the judicial nomination filibuster in 2013](https://www.washingtonpost.com/politics/senate-poised-to-limit-filibusters-in-party-line-vote-that-would-alter-centuries-of-precedent/2013/11/21/d065cfe8-52b6-11e3-9fe0-fd2ca728e67c_story.html) led Republicans to realize that *not* changing the rules would be harmful, which would explain their 2017 decision to [expand the filibuster abolishment to also include Supreme Court nominees](https://www.politico.com/story/2017/04/senate-neil-gorsuch-nuclear-option-236937). In turn, this has led to ongoing conversations in the Democratic Party about wanting to change the rules even further to their own advantage, such as by ["packing" SCOTUS](https://www.nbcnews.com/politics/supreme-court/democrats-introduce-bill-expand-supreme-court-9-13-justices-n1264132). All of this goes to show that being nice is increasingly not an option, particularly as the number of defections by the other side increases.

But what do these say about the future? I think that the lengthy process of human evolution occurred in the way it did for a reason, meaning that cooperation will continue to be important despite what the current U.S. political climate might suggest. In the long run, the failure to cooperate will mean many missed opportunities, greatly decreasing social efficiency, and at some point, unless the rules and norms of human society have changed too much, people will start realizing that neither "friendship (n)or foresight" are necessary for cooperation, leading a return to a society where things are more easily reconciled.

*Click [here](https://yanxifang.github.io/Gov-1372/) to return to the front page.*
