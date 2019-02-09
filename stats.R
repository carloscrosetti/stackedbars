# install.packages("devtools")
# install.packages("tidyverse")

library(tidyverse)

setwd("C:/Users/cvjh/OneDrive - Chevron/My Documents/R/scripts/stats")
getwd()

ranks <- read_csv("sample_ranks.csv", col_names = TRUE)
salary <- as.data.frame(table(ranks$Salary))
salary$Name <- "Salary"
recognition <- as.data.frame(table(ranks$Recognition))
recognition$Name <- "Recognition by \nEmployer"
PTO <- as.data.frame(table(ranks$PTO))
PTO$Name <- "Paid Time Off"
insurance <- as.data.frame(table(ranks$Insurance))
insurance$Name <- "Insurance"
flexible <- as.data.frame(table(ranks$FlexibleHours))
flexible$Name <- "Flexible Schedule"
learn <- as.data.frame(table(ranks$OptoLearn))
learn$Name <- "Opportunity to \nLearn"

rank_chart <- rbind(salary, recognition, PTO, insurance, flexible, learn)
rank_chart$Var1 <- as.numeric(rank_chart$Var1)

ggplot(rank_chart, aes(fill = Var1, y = Freq, x = Name)) +
  geom_bar(stat = "identity") +
  labs(title = "Ranking of Factors Most Important in a Job") +
  ylab("Frequency") +
  xlab("Job Factors") +
  scale_fill_continuous(name = "Ranking",
                      breaks = c(1:4),
                      labels = c("1","2","3","Not Ranked")) +
  theme_bw() +
  theme(plot.title=element_text(hjust=0.5))
