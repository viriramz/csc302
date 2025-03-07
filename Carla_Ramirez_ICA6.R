
df <- read.csv("titanic.csv")

cat("Summary of Titanic Data:\n")
summary(df)

df2 <- df[!is.na(df$Age), ]
cat("\nRows with non-missing Age:", nrow(df2), "\n")

younger <- df2[df2$Survived == 1 & df2$Age < 30, ]
cat("\nYounger Survived Passengers (under 30):", nrow(younger), "\n")

older <- df2[df2$Survived == 1 & df2$Age >= 30, ]
cat("\nOlder Survived Passengers (30 and older):", nrow(older), "\n")

cat("\nSample younger passengers:\n")
print(head(younger))

cat("\nSample older passengers:\n")
print(head(older))
