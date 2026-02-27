# Cancer Prediction using Decision Tree

# Load libraries
library(mlbench)
library(rpart)
library(rpart.plot)

# Load dataset
data(BreastCancer)

# Remove ID column
dataset <- BreastCancer[,-1]

# Remove missing values
dataset <- na.omit(dataset)

# Convert Class column to factor
dataset$Class <- as.factor(dataset$Class)

# Split data into training (70%) and testing (30%)
set.seed(123)
index <- sample(1:nrow(dataset), 0.7 * nrow(dataset))
train <- dataset[index, ]
test  <- dataset[-index, ]

# Build Decision Tree model
model_dt <- rpart(Class ~ ., data = train, method = "class")

# Make predictions
pred_dt <- predict(model_dt, test, type = "class")

# Confusion Matrix
table(Predicted = pred_dt, Actual = test$Class)

# Calculate Accuracy
accuracy_dt <- sum(pred_dt == test$Class) / length(test$Class)
accuracy_dt

# Plot the Decision Tree
rpart.plot(model_dt)
