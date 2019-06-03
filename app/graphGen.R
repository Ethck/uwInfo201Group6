data <- read.csv("data/prov_estimates_mortality.csv", stringsAsFactors=FALSE)

library(dplyr)
library(ggplot2)

q1 <- data %>% filter(grepl("Q1", Year.and.Quarter))
q2 <- data %>% filter(grepl("Q2", Year.and.Quarter))
q3 <- data %>% filter(grepl("Q3", Year.and.Quarter))
q4 <- data %>% filter(grepl("Q4", Year.and.Quarter))

print(head(q1))

genQuarterBar <- function(quarterList) {
	counts <- NULL
	plotLabels <- NULL
	plotColors <- NULL
	if ("1" %in% quarterList) {
		counts <- rbind(counts, c(1, mean(q1$Rate, na.rm = TRUE)))
		plotLabels <- append(plotLabels, "Quarter 1")
		plotColors <- append(plotColors, "red")
	}
	if ("2" %in% quarterList) {
		counts <- rbind(counts, c(2, mean(q3$Rate, na.rm = TRUE)))
		plotLabels <- append(plotLabels, "Quarter 2")
		plotColors <- append(plotColors, "blue")
	}
	if ("3" %in% quarterList) {
		counts <- rbind(counts, c(3, mean(q3$Rate, na.rm = TRUE)))
		plotLabels <- append(plotLabels, "Quarter 3")
		plotColors <- append(plotColors, "yellow")
	}
	if ("4" %in% quarterList) {
		counts <- rbind(counts, c(4, mean(q4$Rate, na.rm = TRUE)))
		plotLabels <- append(plotLabels, "Quarter 4")
		plotColors <- append(plotColors, "green")
	}
	colnames(counts) <- c("Quarter", "Mean")
	counts <- as.data.frame(counts)
	print(counts)
	a <- ggplot(data = counts, aes(x = Quarter, y = Mean)) + geom_bar(stat = "identity", fill = plotColors, mapping = aes(x = plotLabels))
	print(a)
}

genQuarterBar(c("1","4"))