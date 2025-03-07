# Carla Ramirez - HW2

# PART 1: Data Aggregation and Grouping (20 points)

# 1a - Create df1 and aggregate sales by state using Base R
df1 <- data.frame(
  Name = c('James', 'Paul', 'Richards', 'Marico', 'Samantha', 'Ravi', 'Raghu',
           'Richards', 'George', 'Ema', 'Samantha', 'Catherine'),
  State = c('Alaska', 'California', 'Texas', 'North Carolina', 'California', 'Texas',
            'Alaska', 'Texas', 'North Carolina', 'Alaska', 'California', 'Texas'),
  Sales = c(14, 24, 31, 12, 13, 7, 9, 31, 18, 16, 18, 14)
)

# Aggregation using Base R
agg_sales <- aggregate(Sales ~ State, data = df1, sum)
print("Aggregated Sales by State (Base R):")
print(agg_sales)

# 1b - Use dplyr to group and summarize sales by state
if (!require(dplyr)) install.packages("dplyr")
library(dplyr)

grouped_sales <- df1 %>%
  group_by(State) %>%
  summarise(sum_sales = sum(Sales))

print("Aggregated Sales by State (dplyr):")
print(grouped_sales)

# PART 2: WorldCupMatches.csv Analysis (48 points)

# 2a - Read data
worldcup <- read.csv("WorldCupMatches.csv")
cat("\nNumber of rows:", nrow(worldcup), "\n")
cat("Number of columns:", ncol(worldcup), "\n")

# 2b - Summary statistics
cat("\nSummary statistics for WorldCupMatches:")
print(summary(worldcup))

# 2c - Number of unique locations
num_locations <- length(unique(worldcup$City))
cat("\nNumber of unique match locations:", num_locations, "\n")

# 2d - Average attendance
average_attendance <- mean(worldcup$Attendance, na.rm = TRUE)
cat("\nAverage attendance across all matches:", average_attendance, "\n")

# 2e - Total goals per home team
home_goals <- aggregate(Home.Team.Goals ~ Home.Team.Name, data = worldcup, sum, na.rm = TRUE)
print("Total goals by home team:")
print(head(home_goals)) # Only show head for PDF clarity

# 2f - Average attendance per year
avg_attendance_per_year <- aggregate(Attendance ~ Year, data = worldcup, mean, na.rm = TRUE)
print("Average attendance per year:")
print(head(avg_attendance_per_year)) # Use head() for PDF clarity

# PART 3: metabolites.csv Analysis (32 points)

# 3a - Number of Alzheimer's patients
metabolites <- read.csv("metabolite.csv")
alzheimers_patients <- sum(metabolites$Group == "Alzheimer's", na.rm = TRUE)
cat("\nNumber of Alzheimer's patients:", alzheimers_patients, "\n")

# 3b - Number of missing values per column
missing_counts <- colSums(is.na(metabolites))
cat("\nMissing values per column:")
print(missing_counts)

# 3c - Remove rows with missing Dopamine values
metabolites_no_na <- metabolites[!is.na(metabolites$Dopamine), ]
cat("\nRows after removing missing Dopamine:", nrow(metabolites_no_na), "\n")

# 3d - Replace missing c4-OH-Pro values with median
median_c4 <- median(metabolites_no_na$`c4-OH-Pro`, na.rm = TRUE)
metabolites_no_na$`c4-OH-Pro`[is.na(metabolites_no_na$`c4-OH-Pro`)] <- median_c4
cat("\nReplaced missing c4-OH-Pro values with median:", median_c4, "\n")

# 3e - Drop columns with more than 25% missing values
missing_fraction <- colMeans(is.na(metabolites))
columns_to_keep <- names(missing_fraction)[missing_fraction <= 0.25]
metabolites_cleaned <- metabolites_no_na[, columns_to_keep]
cat("\nColumns kept after removing those with >25% missing data:")
print(colnames(metabolites_cleaned))

