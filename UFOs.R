
library(ggplot2)
library(grid)
library(gridExtra)
ufos <- read_csv("ufos_clean.csv")
#Remove black values for shape

ufos <- subset(ufos, !(Shape == "" ))

# Subset for UFOs seen in American States

ufosUSA <- subset(ufos, !(State %in% c("AB","BC","MB","NB","NF","NS","ON","QC","SK")));
head(ufosUSA)

# Subset for UFOs seen in Canadian Provinces that share a border

ufosCAUSA <- subset(ufos, State %in% c("BC","AB","SK","MB","ON","QC","NB"))

# Data Visualization

USA <- ggplot(data = ufosUSA) + geom_bar(mapping = aes(x = Shape,fill = Shape)) + ggtitle("American State UFO sighting") + theme(plot.title = element_text(size = 10)) +theme(axis.title.x=element_blank(), axis.text.x=element_blank(),axis.ticks.x=element_blank())

CanadaBorder <- ggplot(data = ufosCAUSA) + geom_bar(mapping = aes(x = Shape,fill = Shape)) +ggtitle("Canadian provinces bordering US States") + theme(plot.title = element_text(size = 10)) +theme(axis.title.x=element_blank(), axis.text.x=element_blank(),axis.ticks.x=element_blank())

grid.arrange(USA,CanadaBorder,ncol = 2)


# Here we can see that the sightings in the US States and the Canadian borders are very similar, which might either explain that A) People in the US are weird, or B that the closer you get to the US the closer the results get. The data is very similar in shape and very similar in distribution.
```
