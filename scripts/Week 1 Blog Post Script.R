#### Week 1 Blog Post ####
#### Gov 1372: Political Psychology ####
#### Yanxi Fang, Fall 2021 ####

####-----------------------------------#
#### Set-Up ####
####-----------------------------------#

# load packages
library(tidyverse)
library(gridExtra)

# read data
face_df <- read_csv("senate_data.csv")

####-----------------------------------#
#### Data Cleaning ####
####-----------------------------------#

# filter for only incumbents
# (since incumbents are the population of interest in Q7)
face_df <- face_df %>%
  filter(incumbent == TRUE)

# create new variable to code for competitiveness/safety
# 1 being the safest (e.g. Dem in `SolidDem` or Republican in `SolidRep`)
# 2 being the second-safest (e.g. Dem in `LikelyDem` or Republican in `LikelyRep`)
# 3 being the middle (e.g. Dem in `LeanDem` or Republican in `LeanRep`)
# 4 being the second-least safe (e.g. Dem in `TossupDem` or Republican in `TossupRep`)
# 5 being the least safe (e.g. Dem in `TossupRep` or Republican in `TossupDem`)
# (need to check assumption: no Dem incumbents in Republican-likely/-solid seats and vice versa)
# note: there are some coding issues with the data set (capitalized U vs. lowercase U in `tossup`)
face_df <- face_df %>%
  mutate(competition = ifelse(cook == "TossupRep" & party == "dem", 5,
                              ifelse(cook == "TossupDem" & party == "rep", 5,
                              ifelse(cook == "TossUpRep" & party == "dem", 5,
                              ifelse(cook == "TossUpDem" & party == "rep", 5,
                              ifelse(cook == "TossupDem" & party == "dem", 4,
                              ifelse(cook == "TossupRep" & party == "rep", 4,
                              ifelse(cook == "TossUpDem" & party == "dem", 4,
                              ifelse(cook == "TossUpRep" & party == "rep", 4,
                              ifelse(cook == "LeanRep" | cook == "LeanDem", 3,
                              ifelse(cook == "LikelyDem" | cook == "LikelyRep", 2, 1)))))))))))
# check assumption
table(face_df$cook, face_df$party)

# check data
table(face_df$competition)
# as it turns out, there is only one observation where the seat is "most competitive"

# this outlier will be converted to a 4 to make everything else easier
face_df <- face_df %>%
  mutate(comp = ifelse(competition == 1, 1,
                ifelse(competition == 2, 2,
                ifelse(competition == 3, 3, 4))))

# check data again
table(face_df$comp)

####-----------------------------------#
#### Visualization 1 ####
####-----------------------------------#

# competition vs face rating
a <- face_df %>%
  ggplot(aes(x = comp, y = face_rating)) +
  geom_point(aes(color = party)) +
  scale_color_manual(values = c("cornflowerblue", "firebrick2")) +
  xlab("Seat Competitiveness") +
  ylab("Incumbent Facial Quality") +
  ggtitle("Seat Safety vs. Incumbent Facial Quality") +
  geom_smooth(method = "lm", se = FALSE, color = 'black') +
  theme_bw()

# competition vs face rating, by party
b <- face_df %>%
  ggplot(aes(x = comp, y = face_rating, color = party)) +
  geom_point() +
  scale_color_manual(values = c("cornflowerblue", "firebrick2")) +
  xlab("Seat Competitiveness") +
  ylab("Incumbent Facial Quality") +
  ggtitle("Seat Safety vs. Incumbent Facial Quality") +
  geom_smooth(method = "lm", se = FALSE) +
  theme_bw()

# combine two graphs
ggsave("seatsafety_incumbentface.png", arrangeGrob(a, b, nrow = 1), height = 4, width = 12)

# numbers associated with the plots

# overall (no distinction between parties)
summary(lm(face_rating ~ comp, data = face_df))

# distinction between the two parties
face_dem <- face_df %>%
  filter(party == "dem")
face_rep <- face_df %>%
  filter(party == "rep")

summary(lm(face_rating ~ comp, data = face_dem))
summary(lm(face_rating ~ comp, data = face_rep))

# none of these three linear relationships are particularly useful!

####-----------------------------------#
#### Visualization 2 ####
####-----------------------------------#

# this visualization will adopt the ordered multinomial logit model from the MASS package
# from Gelman and Hill (2007), Chapter 6
# (Data Analysis Using Regression and Multilevel/Hierarchical Models)

# load an additional package
library(MASS)

# now switching the axes: face quality on horizontal, seat competitiveness on vertical
face_df %>%
  ggplot(aes(x = face_rating, y = comp)) +
  geom_point() +
  xlab("Incumbent Facial Quality") +
  ylab("Seat Competitiveness") +
  ggtitle("Seat Safety vs. Incumbent Facial Quality") +
  theme_bw()

# modify the outcome variable to become a factor
face_df$comp_factor <- as.factor(face_df$comp)

# fit the ordered logit model
d <- polr(comp_factor ~ face_rating, data = face_df)
summary(d)

# graphical summary of logit model
invlogit <- function(Xb) {
  1/(1+exp(-Xb))
  }

expected <- function(x, c1.5, c2.5, c3.5, sigma) {
  p1.5 <- invlogit((x-d$zeta[1])/1/d$coefficients[1])
  p2.5 <- invlogit((x-d$zeta[2])/1/d$coefficients[1])
  p3.5 <- invlogit((x-d$zeta[3])/1/d$coefficients[1])
  return ((1*(1-p1.5) + 2*(p1.5-p2.5) + 3*(p2.5-p3.5) + 4*p3.5))
}

png("seatsafety_incumbentface_orderedlogit.png", height = 1200, width = 2400, res = 300)

plot (face_df$face_rating, face_df$comp_factor, xlim=c(-2,2), ylim=c(1,4),
      xlab = "Incumbent Facial Quality", ylab = "Seat Competitiveness",
      main = "Facial Quality vs Seat Competitiveness, Ordered Logit Model")
lines (rep (d$zeta[1]/d$coefficients[1], 2), c(1,2))
lines (rep (d$zeta[2]/d$coefficients[1], 2), c(2,3))
lines (rep (d$zeta[3]/d$coefficients[1], 2), c(3,4))
curve (expected (x, d$zeta[1]/d$coefficients[1],
                    d$zeta[2]/d$coefficients[1],
                    d$zeta[3]/d$coefficients[1],
                    1/d$coefficients[1]), add=TRUE)

dev.off()

# cut-off points
d$zeta[1]/d$coefficients[1]
d$zeta[2]/d$coefficients[1]
d$zeta[3]/d$coefficients[1]
# interestingly large values for the second and third cut-offs!

