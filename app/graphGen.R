

data <- read.csv("data/prov_estimates_mortality.csv", stringsAsFactors=FALSE)

library(dplyr)
library(ggplot2)

q1 <- data %>% filter(grepl("Q1", Year.and.Quarter))
q2 <- data %>% filter(grepl("Q2", Year.and.Quarter))
q3 <- data %>% filter(grepl("Q3", Year.and.Quarter))
q4 <- data %>% filter(grepl("Q4", Year.and.Quarter))

print(head(q1))

genQuarterBar <- function(quarterList) {
	counts <- data.frame(matrix(ncol=2, nrow=1), strinsgAsFactors = FALSE)
	if ("1" %in% quarterList) {
		counts <- rbind(counts, c(1, mean(q1$Rate, na.rm = TRUE)))
	}
	if ("2" %in% quarterList) {
		counts <- rbind(counts, c(2, mean(q3$Rate, na.rm = TRUE)))
	}
	if ("3" %in% quarterList) {
		counts <- rbind(counts, c(3, mean(q3$Rate, na.rm = TRUE)))
	}
	if ("4" %in% quarterList) {
		counts <- rbind(counts, c(4, mean(q4$Rate, na.rm = TRUE)))
	}
	colnames(counts) <- c("Quarter", "Mean")
	print(counts)
	a <- ggplot(data = counts, aes(x = data[,1], y = data))
	#print(a)
}

genQuarterBar(c("1","4"))