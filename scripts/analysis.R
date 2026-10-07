# Project: Coke vs. Pepsi Pair Regression Analysis
#   Fits a OLS regression model of Pepsi on Coke
#   using daily log returns, calculates the regression 
#   statistics, evaluates the models assumptions, and
#   saves the diagnostic plots.


# Load required packages
if(!require(car)) install.packages('car')
library(car)


# Reads data from CSV file
data <- read.csv('data/coke_pepsi_returns.csv', row.names = 1)
head(data, 20)


# Creates a linear regression model with Pepsi as
# the dependent variable and prints summary statistics
reg <- lm(PEP ~ KO, data = data)

summary(reg)     


# Test for independence of residuals
durbinWatsonTest(reg)


# Saves regression plot and fitted line
png("outputs/regression_plot.png", width = 800, height = 600)
plot(data$KO, data$PEP, 
     main="Regression of Pepsi onto Coke", 
     xlab="Coca-Cola Returns (KO)", 
     ylab="PepsiCo Returns (PEP)")
abline(reg, col="red", lwd=2)
dev.off()


# Saves diagnostic plots
png("outputs/residuals_fitted.png", width = 800, height = 600)
plot(reg, which=1) 
dev.off()

png("outputs/qq_plot.png", width = 800, height = 600)
plot(reg, which=2) 
dev.off()

