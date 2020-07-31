# Clean up workspace ----
cat("\014")   # clear counsol
rm(list=ls())   # clear global



# Libraries ----
# install.packages
# Load libraries that are needed for this script:
 library(dplyr)   # datamanagement
 library(ggplot2) # figures and graphs
 library(haven)    # read different data format 

# detach("package:ggplot2")

# Load the Data ----
# inbuilt data from
setwd('C:\\Users\\rbishwakarma\\Desktop\\grc\\workshops')
df <- read.csv("data_csv.csv", header = T, sep = ",")

print(df)
# OR
View(df)


# rename colnames
colnames(df)[colnames(df) == "q1"] <- "age"
colnames(df)[colnames(df)=="q1"] <- "age"
colnames(df)[colnames(df)=="label"] <- "race"
colnames(df)[colnames(df)=="group"] <- "gender"
colnames(df)[colnames(df)=="q2"] <- "econ_grade"


# add value labels
table(df$gender)
table(as.numeric(df$gender))
df$gender_2 <- factor(
  as.numeric(df$gender),
  levels = c(0, 1),
  labels = c("Male", "Female"))


df$race <- factor(
  as.numeric(df$race),
  levels = c(1, 2,3,4,5),
  labels = c("White", "African American", "Hispanics", "Native American", "Others"))

# checking variables with table command
table(df$gender_2, df$gender)

# select variables to create a new data
df_var <- select(df, "gender", "race", "age", "econ_grade")

# summary tables
summary<- summary(df_var)
print(summary)

# install package
install.packages("descr")
library(descr)
library(psych)

descriptive.statistics <- describe(df_var, skew = FALSE)
names(descriptive.statistics) <- c('Variable', 'N', 'Mean', 'SD', 'Min', 'Max',
                            'Range', 'se')
descriptive.statistics$Variable[1] <- "Female"
descriptive.statistics$Variable[2] <- "Race"
descriptive.statistics$Variable[3] <- "Age"
descriptive.statistics$Variable[4] <- "Math Score"

# export table
write.table(descriptive.statistics, file= "summary.csv", row.names = F, col.names = T, sep = ",")

rm(summary, descriptive.statistics)

# Cross Table ----
library(descr) 

cross_tab <- crosstab(
  df$gender_2,
  df$race)

# print 
print(cross_tab)

# better looking cross tab
cross_tab <- crosstab(
  df$gender_2,
  df$race,
  digits = list(
    percent = 2, # number after decimal
    others = 3
  ),
  prop.c = TRUE, # column proportion
  prop.r = TRUE, # row percentage
  chisq = TRUE, # chisquare test of independence 
  drop.levels = TRUE,
  dnn = c("Gender","Race"),
  plot = FALSE
)

print(cross_tab)
# export results
# making matrix [::: is used to access the member of the package descr]
cross_tab_m <- descr:::CreateNewTab(cross_tab) 
write.csv(cross_tab_m, file = "tab1.csv")

# t.test ----
#one sample t test
t.test(df_var$math_grade) # mean = 0
ttest<- t.test(df_var$math_grade, mu = 3) # mean = 3
print(ttest)

# independent 2-group t-test
t.test(df_var$math_grade, df$q3) # are mean equal??

t.test(df_var$math_grade, df$q3, paired = T) # are mean equal??

t.test(df_var$math_grade ~ df_var$gender) # mean test between men vs. female
t.test(math_grade ~ gender, data = df_var)


# correlation ----
df_cor <- select(df_var, "gender", "age", "math_grade")
correlation <- cor(df_cor, use="complete.obs")
print(correlation)

# Anova -----------
# anova
anova_result <- aov(math_grade ~ gender, data = df_var)
summary(anova_result)
print(anova_result)

# shipiro test
shapiro.test(data.1$chemistry_score)

# Regression ----

ols_1 <- lm(data = df_var, math_grade ~ gender + age + race)
print(ols_1)
# nice table
library(texreg)
screenreg(ols_1)

ols_2 <- lm(df_var$math_grade ~ df_var$age)
screenreg(ols_2)

# logit
logit <- glm(
  data = df_var,
  gender ~ age,
  family = "binomial"
)
screenreg(logit)

screenreg(list(ols_1, ols_2), digits = 3)

