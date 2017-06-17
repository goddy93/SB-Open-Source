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

# let's look at a single column:
iris$Species

# or filter out only sepal lengths greater than 4
iris[iris$Sepal.Length > 4,]

# or change the name of a column
colnames(iris)[4] <- "PW"

# or change the name of one of the species...
iris$Species[iris$Species == "setosa"] <- "virginica"

# now let's say we want to do several of these at once...
# but let's first reload the data
data(iris)

# select the sepal widths that correspond to sepal lengths greater than 4
iris$Sepal.Width[iris$Sepal.Length > 4]

# let's rename the columns, add one to all the petal widths, filter out sepal widths < 3
x <- iris
colnames(x) <- c("SL", "SW", "PL", "PW", "Species")
x$PW <- x$PW + 1
x <- x[x$SW < 3,]

### THE TIDYVERSE ###
library(tidyverse)

# The tidyverse introduces a new way to format data: the tibble
# it makes the output to the console neater
x <- as_tibble(iris)

# Let's try to do some of the same things as before, but using dplyr functions

# let's look at a single column:
select(x, Species)

# or filter out only sepal lengths greater than 4
filter(x, Sepal.Length > 4)

# or change the name of a column
rename(x, PW = Petal.Width)

# or change the name of one of the species...
mutate(x, Species = ifelse(Species == "setosa", "virginica", Species))

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

# For more practice on R/the tidyverse, check out the swirl package