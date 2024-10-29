#1 Vector creation Write R code to generate the following vectors, explore the functions seq() and rep()
v1 <- seq(from = 1.3, to = 4.9, by = 0.3)
v2 <- rep(1:4, times = 5)
v3 <- seq(from = 14, to = 0, by = -2)
v4 <- rep(c(5, 12, 13, 20), each = 2)

#2 

data(iris)
View(iris)
print(iris)
class(iris)
dim(iris)  # This will return the dimensions of the data frame.
sapply(iris, class)  # This will show the data type of each column.
nlevels(iris$Species)

#3
# Load the iris dataset if not already loaded
data(iris)

# Calculate mean and standard deviation for sepal width and length by species
summary_stats <- aggregate(cbind(Sepal.Length, Sepal.Width) ~ Species, data = iris, function(x) c(mean = mean(x), sd = sd(x)))
print(summary_stats)
# Calculate mean and standard deviation for each species
iris_summary <- iris %>%
  group_by(Species) %>%
  summarise(
    Mean_Sepal_Width = mean(Sepal.Width),
    SD_Sepal_Width = sd(Sepal.Width),
    Mean_Sepal_Length = mean(Sepal.Length),
    SD_Sepal_Length = sd(Sepal.Length)
  )

# Display the summary
print(iris_summary)

# Copy the iris dataset
iris.class <- iris

# Initialize the Calyx.Width vector
iris.class$Calyx.Width <- rep(NA, nrow(iris.class))

# Loop through each row and assign values based on Sepal.Length
for (i in 1:nrow(iris.class)) {
  iris.class$Calyx.Width[i] <- ifelse(iris.class$Sepal.Length[i] < 5, "short", "long")
}

# Print the updated dataset to check the first few rows
head(iris.class)

#4
data(mtcars)  # Load the dataset if not already available
View(mtcars)
str(mtcars)
colnames(mtcars)

# Using subset()
cars_with_cyl_5_or_more <- subset(mtcars, cyl >= 5)
cars_with_cyl_5_or_more <- mtcars[mtcars$cyl >= 5, ]
mtcars %>% filter(cyl >= 5)

# Using logical indexing
first_10_cars <- head(mtcars, 10)
first_10_cars <- mtcars[1:10, ]

honda_cars <- mtcars[grep("Honda", rownames(mtcars)), ]

mean(mtcars$mpg)
mean(mtcars$mpg)
mean(mtcars$mpg)

library(KernSmooth)
