setwd("C:\\Users\\rbishwakarma\\Desktop\\grc\\workshops")
rm(list = ls(all = TRUE))


# using data from r library

library(psych)
library(ggplot2)
library(dplyr)   # datamanagement
library(haven)    # read different data format

df <- poliscidata::states


# there are many themes; here I use theme_bw(); also theme_classic
colnames(df)[colnames(df)=="abort_rate08"] <- "rate"
colnames(df)[colnames(df)=="urban"] <- "population_size"

# Graphics output ----
# Graph the relationship between rate and population size:

# 1 scatter plot
ggplot(df, aes(y=rate, x=population_size))+
  geom_line()

ggplot(df, aes(y=rate, x = population_size)) +
  geom_point()

# 2 add axis labels
ggplot(df, aes(y=rate, x = population_size)) +
  geom_point() +
  labs( y = "Rate",
        x = "Urban Population percent") +
  geom_smooth(method = 'lm') +
  theme_classic()
ggsave("figure.png", height = 3, width = 5)


# draw histogram
ggplot(df, aes(x= rate)) +
    geom_histogram() +
  theme_classic()



# change bandwith
ggplot(df, aes(x= rate)) +
  geom_histogram(binwidth = 1)

# change color
ggplot(df, aes(x= rate)) +
  geom_histogram(color = "red", fill = "blue") + # difference between color and fill
  theme_classic() +
  coord_flip()


# bar graph ----
df <- read.csv("data_csv.csv", header = T, sep = ",")
data <- select(df, c("school", "group", "label", "q1"))

# bar graph
ggplot(df, aes(x = school, y=q1)) +
    geom_bar(stat="identity") + 
    coord_flip()




