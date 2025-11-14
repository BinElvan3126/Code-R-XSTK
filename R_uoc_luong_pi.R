num <- 100000

es_pi<- function(num) {
  # tạo x, y ngẫu nhiên phân phối đều
  # mục đích là tạo ra các điểm đồng đều nhau -> ước lượng chính xác hơn
  x <- runif(num, -1, 1)
  y <- runif(num, -1, 1)
  
  # đếm số điểm nằm trong hình tròn
  inside <- (x^2 + y^2) <= 1

  pi <- 4*sum(inside) / num
  return(pi)
}

a <- es_pi(num)
cat(a)



















