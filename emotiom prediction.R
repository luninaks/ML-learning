
install.packages("dplyr")

library(dplyr)
# 2. Средняя выраженность каждой эмоции
# Рассчитаем средние значения для всех эмоций (первые 7 столбцов)
mean_emo <- colMeans(data[, 1:7])
print("Средняя выраженность эмоций:")
print(mean_emo)

# 3. Поиск самой длинной последовательности доминирования эмоции
# Найдем индекс доминирующей эмоции для каждого кадра
dominant_emo <- apply(data[, 1:7], 1, which.max)

# Функция для подсчета максимальной длины последовательности одинаковых значений
max_sequence_length <- function(emotion_index) {
  rle(dominant_emo == emotion_index)$lengths %>% max()
}

# Рассчитываем максимальную длину последовательности для каждой эмоции
max_seq_lengths <- sapply(1:7, max_sequence_length)
names(max_seq_lengths) <- colnames(data)[1:7]
print("Максимальная длина последовательности доминирования эмоции:")
print(max_seq_lengths)

# 4. Определение позитивных и негативных эмоций
# Позитивные эмоции: happy
# Негативные эмоции: angry, disgust, fear, sad
positive_emotions <- data$happy
negative_emotions <- rowMeans(data[, c("angry", "disgust", "fear", "sad")])

# Рассчитываем средние значения
mean_positive <- mean(positive_emotions)
mean_negative <- mean(negative_emotions)

# Сравнение позитивных и негативных эмоций
if (mean_positive > mean_negative) {
  message("Позитивные эмоции преобладают.")
} else {
  message("Негативные эмоции преобладают.")
}

# Вывод результатов
print("Средняя выраженность позитивных эмоций:")
print(mean_positive)

print("Средняя выраженность негативных эмоций:")
print(mean_negative)
