data <- read.csv("data/prov_estimates_mortality.csv", stringsAsFactors=FALSE)

library(dplyr)
library(ggplot2)

q1 <- data %>% filter(grepl("Q1", Year.and.Quarter))
q2 <- data %>% filter(grepl("Q2", Year.and.Quarter))
q3 <- data %>% filter(grepl("Q3", Year.and.Quarter))
q4 <- data %>% filter(grepl("Q4", Year.and.Quarter))

genQuarterBar <- function(quarterList) {
	if (length(quarterList) > 0) {
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
		a <- ggplot(data = counts, aes(x = Quarter, y = Mean)) + geom_bar(stat = "identity", fill = plotColors, mapping = aes(x = plotLabels))
	}
	return(a)
}

genLine <- function(deathList) {
	if (length(deathList) > 0) {
		plotLabels <- NULL
		plotColors <- c("red", "blue", "green", "purple", "orange",
						"chartreuse", "chocolate4", "cornflowerblue", "aquamarine", "blueviolet",
						"coral2", "darkblue", "darkgoldenrod1", "brown4", "firebrick4",
						"deeppink2", "gray3", "hotpink2", "khaki", "mediumorchid1",
						"mediumvioletred", "mediumseagreen")
		tData <- NULL
		count <- 1
		for (i in unique(data$Indicator)) {
			if (i %in% deathList) {
				d <- data %>% filter(grepl(i, Indicator)) %>% filter(Rate.Type == "Age-adjusted") %>% filter(Time.Period == "3-month period")
				tData <- rbind(tData, d)
				plotLabels <- append(plotLabels, i)
			}

			count <- count + 1
		}

		plotColors <- plotColors[1:length(plotLabels)]
		plotColors <- sort(rep(plotColors, times = 8))

		a <- ggplot(data = tData, aes(x = Year.and.Quarter, y = Rate, group = Indicator, color = plotColors)) +
		geom_line() +
		geom_point() +
		scale_color_discrete(name = "Inidcators", labels = plotLabels)
	}

	return(a)
}