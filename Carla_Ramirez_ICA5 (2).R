data(mtcars)

cat("Column Names:\n")
print(colnames(mtcars))

cat("\nRow Names:\n")
print(rownames(mtcars))

cat("\nAverage and Standard Deviation for mpg:\n")
cat("Mean mpg: ", mean(mtcars$mpg), "\n")
cat("SD mpg: ", sd(mtcars$mpg), "\n")

cat("\nAverage and Standard Deviation for cyl:\n")
cat("Mean cyl: ", mean(mtcars$cyl), "\n")
cat("SD cyl: ", sd(mtcars$cyl), "\n")

cat("\nColumn Means:\n")
print(colMeans(mtcars))

cat("\nCyl value for Mazda RX4:\n")
print(mtcars["Mazda RX4", "cyl"])
