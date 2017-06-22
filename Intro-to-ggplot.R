### PLOTTING IN R ###

# One of the most commonly-used plotting packages in R is ggplot2, which is included
# in the tidyverse package.

# Let's use the iris dataset from before...
data(iris)

# Let's say we want to look the relationship between sepal length and width
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
    geom_point()

# We can add a regression line...
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
    geom_point() +
    geom_smooth(method = "lm", se = FALSE) # change se to TRUE to show the confidence interval

# or color them by species...
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
    geom_point()

# or do both!
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
    geom_point() +
    geom_smooth(method = "lm", se = FALSE)
    
# We can also make other types of graphs, such as histograms:
ggplot(iris, aes(x = Sepal.Length)) +
    geom_histogram()

# or boxplots
ggplot(iris, aes(x = Species, y = Sepal.Length)) +
    geom_boxplot()

# or barcharts
ggplot(iris, aes(x = Species)) +
    geom_bar()

# or density plots
ggplot(iris) +
    geom_density(aes(Sepal.Length, color = Species))

ggplot(iris) +
    geom_density2d(aes(Sepal.Length, Sepal.Width, color = Species))

# You can also combine ggplot with the pipeline. 
ggplot(iris %>% filter(Sepal.Length < 5), aes(x = Species)) +
    geom_bar()

iris %>% filter(Sepal.Length < 5) %>% 
    ggplot(aes(x = Species)) +
    geom_bar()

# It's also possible to plot multiple graphs at once.
ggplot(iris, aes(x = Sepal.Length)) +
    geom_histogram(binwidth = .2) + #set binwidth to 0.2
    facet_wrap(~ Species, scales = "free") #by default, the scale of the x-axis will be the same for each graph

# For more info and links to tutorials, check out the ggplot website:
# http://ggplot2.tidyverse.org/