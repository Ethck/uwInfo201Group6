

data <- read.csv("data/prov_estimates_mortality.csv", stringsAsFactors=FALSE)

library(dplyr)

q1 <- data %>% filter(grepl("Q1", Year.and.Quarter))
q2 <- data %>% filter(grepl("Q2", Year.and.Quarter))
q3 <- data %>% filter(grepl("Q3", Year.and.Quarter))
q4 <- data %>% filter(grepl("Q4", Year.and.Quarter))

print(head(q1))