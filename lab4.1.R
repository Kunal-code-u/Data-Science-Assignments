#1
# Create the data frame
df <- data.frame(
  PatientID = c(1, 2, 3, 4), # Column for Patient IDs
  AdmDate = as.Date(c("2009-10-15", "2009-11-01", "2009-10-21", "2009-10-28")), # Convert date strings to Date objects
  Age = c(25, 34, 28, 52), # Column for Age
  Diabetes = c("Type1", "Type2", "Type1", "Type1"), # Column for Diabetes Type
  Status = c("Poor", "Improved", "Excellent", "Poor") # Column for Health Status
)
print(df)

# Extract PatientID and Age
subset1 <- df[, c("PatientID", "Age")]
# Display the subset
print(subset1)
df %>% select(PatientID, Age)

# Identify Type1 patients
type1_patients <- df[df$Diabetes == "Type1", ]

# Display Type1 patients
print(type1_patients)
#or
df %>% filter(Diabetes == "Type1")

# Count the number of Poor status patients
poor_count <- sum(df$Status == "Poor")
# Display the count
print(poor_count)

# Print the summary of the Data Frame
summary(df)

# Calculate the average age of patients
average_age <- mean(df$Age)

# Display the average age
print(average_age)

#3
a <- c(12, 14, 16, 20)
matrix_2d <- matrix(1:10, nrow = 5, ncol = 2)
s <- c("First", "Second", "Third")
MyList <- list(
  title = "My First List",
  criteria = list(
    age_vector = a,
    matrix = matrix_2d,
    score_vector = s
  )
)
print(MyList)
print(MyList$criteria)
print(MyList$criteria$age_vector)
  
