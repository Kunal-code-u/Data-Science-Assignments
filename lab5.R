# Read CSV file from the GitHub URL
url <- "https://raw.githubusercontent.com/fivethirtyeight/data/master/daily-show-guests/daily_show_guests.csv"
daily_show_guests <- read_csv(url)
print(daily_show_guests)

# Display the first 10 records
head(daily_show_guests, 10)

# Display the column names
colnames(daily_show_guests)

# Load dplyr
library(dplyr)

# Rename the columns
daily_show_guests <- daily_show_guests %>% rename(
  year = YEAR,
  job = GoogleKnowlege_Occupation,
  date = Show,
  category = Group,
  guest_name = Raw_Guest_List
)




# Display the new column names
colnames(daily_show_guests)

# Rename columns without dplyr
colnames(daily_show_guests) <- c("year", "job", "date", "category", "guest_name")

# Display the updated column names
colnames(daily_show_guests)

report <- daily_show_guests %>% select(year, date, guest_name)
report
report3 <- select(daily_show_guests, 1 : 2)
report3
report1 <- daily_show_guests[, c("year", "date", "guest_name")]

daily_show_guests %>% select(-year, -job)
# Select all columns except 'year'
daily_show_guests_no_year <- daily_show_guests[, colnames(daily_show_guests) != "year"]

# Display the result
print(daily_show_guests_no_year)

filtered_data <- daily_show_guests %>% filter(job == "actor", guest_name == "ABC")
# Extract the list of actors named "ABC" using base R
actors_ABC_no_dplyr <- daily_show_guests[daily_show_guests$job == "actor" & daily_show_guests$guest_name == "ABC", ]

# Display the result
print(actors_ABC_no_dplyr)

# Arrange the records in order of date
arranged_records <- daily_show_guests %>%
  arrange(date)

# Display the arranged records
print(arranged_records)

# Arrange the records in order of date using base R
arranged_records_no_dplyr <- daily_show_guests[order(daily_show_guests$date), ]

# Display the arranged records
print(arranged_records_no_dplyr)

daily_show_guests <- daily_show_guests %>% mutate(Experience = 5)
colnames(daily_show_guests)


daily_show_guests %>% mutate(Experience2 = 10)
daily_show_guests$exp3 <- 15