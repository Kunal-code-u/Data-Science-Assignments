#1Create the following data set with 20 different years 
# Create a sequence of 20 different years
years <- seq(from = 2000, by = 1, length.out = 20)
# Create a data frame with the 'years' column
years_data <- data.frame(Year = years)

#11. How many unique countries are represented per continent?
# Add a column for countries (repeated values for simplicity)
countries <- c("USA", "Canada", "Brazil", "UK", "Germany", "France", "India", "China", "Japan", "Australia",
               "Russia", "Mexico", "South Africa", "Egypt", "Italy", "Argentina", "South Korea", "Indonesia", "Spain", "Nigeria")
years_data$Country <- countries
# Add a column for continents
continents <- c("North America", "North America", "South America", "Europe", "Europe", "Europe",
                "Asia", "Asia", "Asia", "Oceania", 
                "Europe", "North America", "Africa", "Africa", "Europe",
                "South America", "Asia", "Asia", "Europe", "Africa")
years_data$Continent <- continents

# Load the dplyr package
library(dplyr)

# Count unique countries per continent
continent_country_count <- years_data %>% 
  group_by(Continent) %>%
  summarize(Unique_Countries = n_distinct(Country))

#2. Which European nation had the lowest GDP per capita in a given year?
# Add some random GDP data
set.seed(123) # Ensures that the random numbers are the same every time the code is run (useful for reproducibility).
gdp <- round(runif(20, min = 1000, max = 20000), 2)
# Create the final data frame
years_data$GDP <- gdp

# Step 1: Filter the dataset for European countries
european_nations <- years_data %>% 
  filter(Continent == "Europe")
# Step 2: Find the European country with the lowest GDP per capita
lowest_gdp_europe <- european_nations %>% 
  filter(GDP == min(GDP))

#3. According to the data available, what was the average life expectancy across each continent in a
#given year?
# Add a column for Life Expectancy (simulated data for illustration purposes)
set.seed(123)
life_expectancy <- round(runif(20, min = 50, max = 85),2)
# Update the data frame
years_data$Life_Expectancy <- life_expectancy
# Calculate average life expectancy for each continent
average_life_expectancy <- years_data %>% 
  group_by(Continent) %>%
  summarise(Average_Life_Expectancy = mean(Life_Expectancy))

#4. What 5 countries have the highest total GDP over all years combined?
# Step 1: Sum the GDP for each country
total_gdp_per_country <- years_data %>% 
  group_by(Country) %>%
  summarise(Total_GDP = sum(GDP)) %>%
  arrange(desc(Total_GDP))

# Step 2: Select the top 5 countries
top_5_countries <- total_gdp_per_country %>%
  top_n(5, Total_GDP)

#5. What countries and years had life expectancies of at least 80 years?
# Filter for countries and years with life expectancy of at least 80 years
high_life_expectancy <- years_data %>% filter(Life_Expectancy >= 80)

#6. What 10 countries have the strongest correlation (in either direction) between life expectancy and
#per capita GDP?
# Add GDP per capita (assuming GDP is already in 'per capita' form; otherwise divide by population if available)
# Here, we directly assume GDP represents per capita values
# Step 2: Calculate correlation between Life Expectancy and GDP per capita for each country
country_correlations <- years_data %>% 
  group_by(Country) %>%
  summarise(Correlation = cor(Life_Expectancy, GDP)) %>%
  arrange(desc(abs(Correlation))) # Sort by the absolute value of correlation
  
# Step 3: Select the top 10 countries with the strongest correlations
top_10_countries <- country_correlations %>%
  top_n(10, abs(Correlation))

#7. Which combinations of continent (besides Asia) and year have the highest average population
#across all countries?
# Simulate a population column for the dataset (random values for illustration)
set.seed(123)  # For reproducibility
# Generate random population between 1 million and 100 million
population <- round(runif(20, min = 1e6, max = 1e8), 2)
# Add the population column to the dataset
years_data$Population <- population
# Step 2: Filter out Asia and group by continent and year
avg_population <- years_data %>%
  filter(Continent != "Asia") %>%
  group_by(Continent, Year) %>%
  summarise(Average_Population = mean(Population)) %>%
  arrange(desc(Average_Population))
  
#8. Which three countries have had the most consistent population estimates (i.e. lowest standard
#deviation) across the years of available data?
# Step 1: Group by Country and calculate the standard deviation of Population
population_consistency <- years_data %>% 
  group_by(Country) %>%
  summarise(Population_SD = sd(Population)) %>%
  arrange(Population_SD)
  
# Step 2: Select the top 3 countries with the lowest standard deviation in population
most_consistent_countries <- population_consistency %>%
  slice_head(n = 3)
  
#9. Excluding records from a given year, which observations indicate that the population of a country
#has decreased from the previous year and the life expectancy has increased?
# Order the dataset by Country and Year
years_data <- years_data %>%
  arrange(Country, Year)

# Calculate differences for Population and Life Expectancy compared to the previous year
years_data <- years_data %>%
  group_by(Country) %>%
  mutate(
    Population_diff = Population - lag(Population),
    Life_Expectancy_diff = Life_Expectancy - lag(Life_Expectancy)
  )

# Filter for countries where Population decreased and Life Expectancy increased
result <- years_data %>%
  filter(Population_diff < 0 & Life_Expectancy_diff > 0) 

#Create a database file “DataSet.csv” that contains 10 records of medicine with attribute : MedID,
#Med_Name, Company, Manf_year, Exp_date, Quantity_in_stock, Sales

# Define the dataset
medicine_data <- data.frame(
  MedID = 1 : 10,
  Med_name = c("Paracetamol", "Ibuprofen", "Amoxicillin", "Cetirizine", "Aspirin", 
               "Loratadine", "Omeprazole", "Metformin", "Atorvastatin", "Losartan"),
  Company = c("PharmaA", "PharmaB", "PharmaC", "PharmaD", "PharmaE", 
              "PharmaF", "PharmaG", "PharmaH", "PharmaI", "PharmaJ"),
  Manf_year = c(2022, 2021, 2020, 2021, 2019, 2022, 2020, 2021, 2018, 2022),
  Exp_date = as.Date(c("2024-12-31", "2023-11-30", "2023-05-30", "2024-08-31", 
                       "2022-12-31", "2025-06-30", "2023-12-31", "2025-01-31", 
                       "2022-10-31", "2024-03-31")),
  Quantity_in_stock = c(100, 50, 200, 75, 90, 150, 30, 110, 60, 40),
  Sales = c(500, 400, 800, 300, 600, 700, 200, 750, 550, 450)
)

# Write the data to a CSV file
write.csv(medicine_data, "Dataset.CSV", row.names = FALSE)

read.csv("Dataset.CSV")

#2. Read the data file and show the first 4 record of the file.
# Step 1: Read the CSV file
medicine_data <- read.csv("Dataset.CSV")
# Step 2: Display the first 4 records
head(medicine_data, 4)

#3. Read the data file and show the last 4 record of the file.
tail(medicine_data, 4)

#4. Find the coorelation between Quantity_in_stock and Exp_date.
# Step 1: Convert Exp_date to numeric (number of days since a reference date)
medicine_data$Exp_date_numeric <- as.numeric(as.Date(medicine_data$Exp_date))

# Step 3: Calculate the correlation between Quantity_in_stock and Exp_date_numeric
correlation <- cor(medicine_data$Quantity_in_stock, medicine_data$Exp_date_numeric, use = "complete.obs")

#5. Plot the bar graph for the Sales with year of manufacturing.

# Step 1: Install and load ggplot2 package (if not installed)
library(ggplot2)
#Plot the bar graph for Sales vs. Manf_year
# Aggregate the total Sales for each Manf_year
sales_by_year <- tapply(medicine_data$Sales, medicine_data$Manf_year, sum)
#plot bar graph
barplot(sales_by_year, 
        main = "Sales by Year of Manufacturing", 
        xlab = "Year of Manufacturing", 
        ylab = "Sales", 
        col = "lightblue", 
        border = "black")

#6. Find the company having more than one type of medicine.
medicine_count_per_company <- table(medicine_data$Company)
company_with_multiple_medicines <- names(medicine_count_per_company[medicine_count_per_company > 1])

#7. Find the type of Medicine available.
#Find the unique types of medicine
unique_medicines <- medicine_data %>%
  distinct(Med_name)

#8. Which medicines are expiring? Show by box plots.
#Convert Exp_date to Date format
medicine_data$Exp_date <- as.Date(medicine_data$Exp_date)

#Define today's date and filter for expiring medicines
today <- Sys.Date()
one_year_later = today + 365

# Filter medicines that are expiring within the next year
expiring_medicines <- medicine_data %>%
  filter(Exp_date <= one_year_later)

#Create box plots for sales of expiring medicines
ggplot(expiring_medicines, aes(x = Med_name, y = Sales)) +
  geom_boxplot(fill = "lightblue") +
  labs(title = "Sales of Expiring Medicines", 
       x = "Medicine Name", 
       y = "Sales") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  theme_minimal()

#9. Find the average stock in the store.
average_stock <- medicine_data %>% summarise(average_quantity = mean(Quantity_in_stock, na.rm = TRUE))

#10. Draw the regression line between Manufacturing year and Sales.
ggplot(medicine_data, aes(x = Manf_year, y = Sales)) +
  geom_point(color = "blue") +                         # Add points for each observation
  geom_smooth(method = "lm", color = "red") +         # Add a linear regression line
  labs(title = "Regression Line between Manufacturing Year and Sales", 
       x = "Manufacturing Year", 
       y = "Sales") +
  theme_minimal()
