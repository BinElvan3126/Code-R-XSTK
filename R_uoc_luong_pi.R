num <- 100000

# tạo x, y ngẫu nhiên phân phối đều
# mục đích là tạo ra các điểm đồng đều nhau -> ước lượng chính xác hơn
x <- runif(num, -1, 1)
y <- runif(num, -1, 1)

# đếm số điểm nằm trong hình tròn
inside <- (x^2 + y^2) <= 1

pi_mc <- 4*sum(inside) / num

pi_mc
pi

plot(x, y, col = ifelse(inside, "blue", "red"),
     pch = 16, cex = 0.5,
     xlab = "X", ylab = "Y",
     main = "Monte Carlo xấp xỉ Pi")
# cex kích thước điểm nhỏ

theta <- seq(0, 2*pi, length.out = 200)
# theta 200 góc đều từ 0 tới 2pi
lines(cos(theta), sin(theta), col="black", lwd=2)
# cos(theta), sin(theta) tọa độ các điểm trên đường tròn

#================================#

# tạo dãy từ 100-100000 step 1000
sample_sizes <- seq(100, 100000, by = 1000)

# Vector số lưu Pi ước lượng
# có cùng số lượng phần tử với sample size
pi_estimates <- numeric(length(sample_sizes))

# Tính Pi ước lượng cho từng n
for (i in 1:length(sample_sizes)) {
  n <- sample_sizes[i]
  x <- runif(n, -1, 1)
  y <- runif(n, -1, 1)
  inside <- (x^2 + y^2) <= 1
  pi_estimates[i] <- 4 * sum(inside) / n
}

# Biểu đồ đường
plot(sample_sizes, pi_estimates, type = "l", col = "blue", lwd = 2,
     xlab = "Số điểm mẫu (n)", ylab = "Giá trị Pi",
     main = "So sánh Pi thực tế và Pi ước lượng")
abline(h = pi, col = "red", lwd = 2, lty = 2)  # Pi thực tế
legend("topright", legend = c("Pi ước lượng", "Pi thực tế"),
       col = c("blue", "red"), lwd = 2, lty = c(1, 2))










