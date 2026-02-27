# -----------------------------------
# Breast Cancer Prediction
# Random Forest Model
# -----------------------------------

# Load dataset
dataset <- read.csv("breast_cancer.csv")

# Convert Class column to factor
dataset$Class <- as.factor(dataset$Class)

# Split data into training and testing
set.seed(123)
index <- sample(1:nrow(dataset), 0.7 * nrow(dataset))

train <- dataset[index, ]
test <- dataset[-index, ]

# Load library
library(randomForest)

# Build Random Forest model
model_rf <- randomForest(Class ~ ., data = train)

# Make predictions
pred_rf <- predict(model_rf, test)

# Confusion Matrix
table(Predicted = pred_rf, Actual = test$Class)

# Accuracy
accuracy_rf <- sum(pred_rf == test$Class) / length(test$Class)
accuracy_rf
