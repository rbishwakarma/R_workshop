
# = 
# Entering Input ----
# <- assignment operator
# indicates a comment- Anything to the right of the # is ignored

# Examples:
x <- 5 
# nothing printed but makes value 
# shows in the environment
# shows in the console
x
print(x) # printing x

x <- 1:100
# : is used operator to create integer sequences

# all thing we encounter in R is called object
# five classes of object: character, numeric, logical (integers, complex)
  # a most basic object is a vector
  #   vector can only contain objects of the same class

# R objects can have attributes
  # names
  # dimensions - number of columsn or row
  # class - numeric or character
  # length - number of elements in the vectors

# operation ----
2+2
3*2
3+4

2/3
6/3

# data class ----
  # numeric
  1
  2
  3
  
  # characters
  "Male"
  "Female"
  
  # logical
  # True or FALSE
  
  
  
# data structure in R ----
  # vector
c(1, 2, 3, 4, 5)

number <- c(1, 2, 3, 4, 5)
days <- c("Mon", "Tues", "Wed", "Thurs", "Fri")
days
number <- (1:12) 

  # mathematical operation with vector
 squared <- number ^ 2
 squared
 
 # list 
 x<- list(squared, number)
 
 # data.frame - creating data structure ----
  # create each colomn and make together
 #example:
 id <- c(1:100)
 group <- c(rep("Male", 50), rep("Female", 50)) 
 grades <- c(rnorm(100, mean = 83, sd = 5))

 df <- data.frame(id, group, grades)
 data <- data.frame(student_id = id, gender = group, numeric.grade = grades)
 
 rm(id, grades, group) 
 
# working with vector and dataframe ----
 # subsetting vector
 days[2] # selecting day 2
 days[-2] # not selecting day 2
 days[10] # selecting day 10
 days[c(1,3,5)] # selecting odd days vector
 
 # functions [built in functions]
 mean(squared)
 median(squared)
 min(squared)
 max(squared)
 sum(squared)
 summary(squared)
 sd(squared)
 
 # other functions
 log(squared)
 sqrt(squared)
 hist(squared)
 hist(log(squared)) # using two functions together
 hist(
   log(squared) # writing lines in two lines
 )
 
 # other syntax/function/----
 ?mean
 ?hist
