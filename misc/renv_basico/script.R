## Carrega o pacote
library(mvtnorm)

media <- c(5, 10)
cov <- matrix(c(2, 1.8, 1.8, 3), nrow = 2, byrow = TRUE)
dados <- rmvnorm(n = 1000, mean = media, sigma = cov)
str(dados)
plot(dados)
