# Clean up workspace ----
rm(list = ls(all = TRUE))
cat("\014")   # clear counsol

# Working Directory ----
  setwd('C:\\Users\\rbishwakarma\\Desktop\\grc\\workshops')
  # difference between / and \\

# Libraries ----
# install.packages
# Load libraries that are needed for this script:

 library(dplyr)   # datamanagement
 library(ggplot2) # figures and graphs
 library(haven)    # read different data format 
library(network)
install.packages("network") # installing packages
library("network") # upload packages in the R system
remove.packages("network") # remove packages

# install multiple packages
install.packages(c("dplyr", "network"))


# Load the Data ----
# inbuilt data from
library(hflights)
# check all the datasets available
data()

# csv and dta files
df_csv <- read.csv("data_csv.csv", header = T, sep = ",")


library(haven)    # read different data format 
df_data <- read_dta("stata_data.dta")                  
#dta file - data from stata
# data file from spss, -- sav fil read_sav(file.sav)

# r data
load("data.RData")

rm(barwidth, df, data, month_one, month_two, df_csv, df_data)













# Inspect the data ----
df_csv <- read.csv("data_csv.csv", header = T, sep = ",")


# printing data with number of rows and column
print(df_csv)

View(df_csv)     # shows a spreadsheet-like display of the entire data frame
dim(df_csv)      # shows the dimensions of the data frame by row (observations) and column (variables)
str(df_csv)      # shows the structure of the data frame
summary(df_csv)  # provides summary statistics on the columns of the data frame
colnames(df_csv) # shows the name of each column in the data frame
head(df_csv)     # shows the first 6 rows of the data frame
tail(df_csv)     # shows the last 6 rows of the data frame















# Data management -----

# convert to a normal data frame to see all of the columns
df<-data.frame(df_csv)
rm(df_csv)

# filtering
df_filter <- df[df$Month==2 & df$DayofMonth==2, ]



# OR,
library(dplyr)   # datamanagement
df_filter2 <- filter(df, group == 1)

df_date <- select(df, school, group, q1)
# select by name
df_select <- select(df, DepTime, ArrTime, FlightNum)
# keep the variables with certain names
df_select2 <- select(df, Year:DayofMonth, contains("Taxi"), contains("Delay"))
# including contains - we can also use starts_with, ends_with, and mathces


rm(df_filter2, df_select, df_select2, df_filter, df_date)
# chaining - how to write dplyr codes
# select uniquecarrier and DepDelay columns and filter for delays over 60 minutes - %>% - read as select
df_chaining <- df %>%
  select(UniqueCarrier, DepDelay) %>%
  filter(DepDelay > 60)


# reorder words
df_arrange <- df %>%
  select(UniqueCarrier, DepDelay) %>%
  arrange(DepDelay) # acending 

df_arrange <- df %>%
  select(UniqueCarrier, DepDelay) %>%
  arrange(desc(DepDelay)) # descending 

rm(df_arrange, df_chaining)

# creating dummy variable and recode data
data_name$colnames[data_name$colnames=="Values in the colnm"] <- 1
data_name$colnames[df$oecd=="Values in the colnm"] <- 0



