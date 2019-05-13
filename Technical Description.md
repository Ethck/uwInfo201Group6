# Technical Description for the Project

How will you be reading in your data (i.e., are you using an API, or is it a static .csv/.json file)?


The dataset is a staic .csv file obtained from the CDC concerning the the 15 leading causes of death and a couple of other ones.


What types of data-wrangling (reshaping, reformatting, etc.) will you need to do to your data?


The dataset is already in a fairly usable form that will not require much, if any, data-wrangling. Below is a sample of the dataset.


`Year and Quarter, Time Period, Indicator, Rate Type, Rate, Unit, Significant`
`2017 Q1, 12 months ending with quarter, All Causes, Age-adjusted, 731.5, "Deaths per 100,000", False`


This format is already usable; however, the Year and Quarter column could be adjusted to show in timestamp format as opposed to Quarters.


What (major/new) libraries will be using in this project (no need to list common libraries that are used in many projects such as dplyr)


There appears to be no new libraries needed specifically for this project. Much of this project will be handled by "core" libraries such as *dplyr* and base R commands. There may be some additional libraries needed for the front-end of the program however.


What questions, if any, will you be answering with statistical analysis/machine learning?


- What Cause of Death (CoD) has the most fluctuation from the beginning to the end?
- What Cause of Death (CoD) has the least fluctuation from the beggining to the end?
- Which Cause of Deaths (CoD) are increasing in their potency?
- Which Cause of Deaths (CoD) are decreasing in their potency?


What major challenges do you anticipate?


Some major challenges we will face include the following:
- Working with a group
- Designing and producing a good User Experience and Front-end
- Understanding the implications of the data.