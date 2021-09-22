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

For this week's blog post, I have replicated part of Axelrod's "tournament" of different strategies. I chose six strategies to focus on, with their patterns described below:
- Backstabber
  - Cooperates until the opponent defects 3 times.
  - Defects forever after that.
  - Always defects in the last 2 rounds.
- Cooperator
  - Cooperates systematically.
 - Cycler
  - Cooperates 3 times in a row, then defect once.
  - Repeats sequence until the end of the tournament.
 - Fool Me once
  - Cooperates the first time it plays a new opponent.
  - Keeps cooperating after the first defection of the opponent.
  - Defects systematically after the opponent defects a second time.
- Random
  - Cooperates or defects at random.
 - Tit-for-Tat
  - Cooperates the first time it plays a new opponent.
  - Mirrors the last move of each opponent in subsequent encounters.

*Click [here](https://yanxifang.github.io/Gov-1372/) to return to the front page.*
