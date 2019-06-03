# Graph generation support file for the Shiny app
# See server.R for the calls to this file
# See ui.R for the output
# Created by Ethck for Info 201 B Spring Final


# This is our dataset from the CDC about deaths and their causes.
data <- read.csv("data/prov_estimates_mortality.csv", stringsAsFactors=FALSE)

# Required libraries.
library(dplyr)
library(ggplot2)

# Store these so we don't make them everytime the function is called
q1 <- data %>% filter(grepl("Q1", Year.and.Quarter))
q2 <- data %>% filter(grepl("Q2", Year.and.Quarter))
q3 <- data %>% filter(grepl("Q3", Year.and.Quarter))
q4 <- data %>% filter(grepl("Q4", Year.and.Quarter))

# This function returns a graph that displays the average
# Rate for all Quarters present in quarterList
genQuarterBar <- function(quarterList) {
	if (length(quarterList) > 0) {
		counts <- NULL
		plotLabels <- NULL
		plotColors <- NULL

		# Test if Quarter X is present, add respective variables
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

		# Make it easier to use
		colnames(counts) <- c("Quarter", "Mean")
		counts <- as.data.frame(counts)

		# Actual plot call
		a <- ggplot(data = counts, aes(x = Quarter, y = Mean)) + 
		geom_bar(stat = "identity", fill = plotColors, 
			mapping = aes(x = plotLabels))
	}

	return(a)
}

# This function is responsible for returning a line graph of all
# selected indicators of death plotted by their rate vs each
# year and quarter.
genLine <- function(deathList) {
	if (length(deathList) > 0) {
		plotLabels <- NULL

		# We have 22 inidicators, so 22 colors
		plotColors <- c("red", "blue", "green", "purple", "orange",
						"chartreuse", "chocolate4", "cornflowerblue", "aquamarine", "blueviolet",
						"coral2", "darkblue", "darkgoldenrod1", "brown4", "firebrick4",
						"deeppink2", "gray3", "hotpink2", "khaki", "mediumorchid1",
						"mediumvioletred", "mediumseagreen")
		
		# For all present Indicators, add new variables
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

		# Each Indicator has 8 results, so colors needs to know this.
		plotColors <- plotColors[1:length(plotLabels)]
		plotColors <- sort(rep(plotColors, times = 8))

		# Plot call.
		a <- ggplot(data = tData, aes(x = Year.and.Quarter, y = Rate, group = Indicator, color = plotColors)) +
		geom_line() +
		geom_point() +
		scale_color_discrete(name = "Inidcators", labels = plotLabels)
	}

	return(a)
}