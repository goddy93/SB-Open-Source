### 'BASIC' R ###

# Load data

data(iris)
# to load data from your own computer, use this function:
# data <- read.csv("User/File/file.csv")

# let's take a look at the data...
head(iris) # first lines
str(iris) # structure
summary(iris) # summary stats

## Examples

# let's look at a single cell:
iris[1,2]
iris[, 2] #or column
iris[1, ] #or row

# or we can look at a single column by name
iris$Species

# or filter out only sepal lengths greater than 4
iris[iris$Sepal.Length > 6,]

# or change the name of a column
colnames(iris)[4] <- "PW"

# or change the name of one of the species...
iris$Species <- as.character(iris$Species)
iris$Species[iris$Species] <- "ibexus"

# now let's say we want to do several of these at once...
# but let's first reload the data
data(iris)

# ex: let's rename the columns, add one to all the petal widths, filter out sepal widths < 3
x <- iris
colnames(x) <- c("SL", "SW", "PL", "PW", "Species")
x$PW <- x$PW + 1
x <- x[x$SW < 3,]

### THE TIDYVERSE ###
library(tidyverse)

# The tidyverse introduces a new way to view/format data: the tibble
# it makes the output to the console neater, among other things
 x<- as_tibble(iris)

# Let's try to do some of the same things as before, but using dplyr functions

# let's look at a single column:
select(x, Species)

# or filter out only sepal lengths greater than 4
filter(x, Sepal.Length > 4)

# or change the name of a column
rename(x, PW = Petal.Width)

# or change the name of one of the species...
mutate(x, Species = ifelse(Species == "setosa", "ibexus", Species))

# how about doing some things together?
# let's rename the columns, add one to all the petal widths, filter out sepal widths < 3
x <- rename(x, SL = Sepal.Length, 
            SW = Sepal.Width,
            PL = Petal.Length, 
            PW = Petal.Width)
x <- mutate(x, PW = PW + 1)
x <- filter(x, SW < 3)

# Instead of assigning each step to a variable, you can also use a PIPELINE
iris %>% as_tibble() %>% 
    rename(SL = Sepal.Length, 
           SW = Sepal.Width,
           PL = Petal.Length, 
           PW = Petal.Width) %>% 
    mutate(PW = PW + 1) %>% 
    filter(SW < 3)

# Using dplyr functions, you can also arrange data in columns, summarize data,
# select single columns, gather columns together to create long-format data frames,
# and more!

# Mini-exercise - it's your turn to try!

# 1. Filter all petal lengths greater than 1.5 and arrange the data 
#    by petal length in descending order

# 2. Get the species means for each plant measurement

# 3. Gather all plant measurements into two columns: one with the name
#    of the measurement type, and one with the measurement value

# For more practice on R/the tidyverse, check out the swirl package