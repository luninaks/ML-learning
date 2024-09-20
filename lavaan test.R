
data <- read.csv("SocAnx_Answers.csv", sep = ";")
str(data)

install.packages("lavaan")
library(lavaan)

model <- '
  Social_Anxiety =~ ASC_1 + ASC_2 + ASC_3 + ASC_4 + ASC_5 +
                    ASC_6 + ASC_7 + ASC_8 + ASC_9 + ASC_10 +
                    ASC_11 + ASC_12 + ASC_13 + ASC_14 + ASC_15 +
                    ASC_16 + ASC_17 + ASC_18 + ASC_19 + ASC_20
'

# Подгонка модели к данным
fit <- cfa(model, data = data)

# Результаты подгонки модели
summary(fit, fit.measures = TRUE, standardized = TRUE)
