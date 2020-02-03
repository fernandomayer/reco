## Vetor com uma sequência de 1 a 1.000.000
x <- 1:1000000

## Cria um objeto de armazenamento com o mesmo tamanho do resultado
st1 <- system.time({
    out1 <- numeric(length(x))
    for(i in 1:length(x)){
        out1[i] <- x[i]^2
    }
})

## Cria um objeto de tamanho "zero" e vai "crescendo" esse vetor
st2 <- system.time({
    out2 <- numeric(0)
    for(i in 1:length(x)){
        out2[i] <- x[i]^2
    }
})

## Cria um objeto de tamanho "zero" e cresce o vetor usando a função c()
## NUNCA faça isso!!
st3 <- system.time({
    out3 <- numeric(0)
    for(i in 1:length(x)){
        out3 <- c(out3, x[i]^2)
    }
})



library(tidyverse)

mean(c(1, 2, 3))

c(1, 2, 3) %>%
    mean()


runif(100, 1, 10)
runif(max = 100, 1, 10)
runif(max = 100, n = 10, min = 1)

sample(x = 1:10, size = 2, replace = TRUE)

plot(runif(10), runif(10), main = "Titulo")


olaMundo <- function(texto){
    writeLines(texto)
}

olaMundo(texto="bla")


`+`(2, 2)
2 + 2
sum(2, 2)

minhaSoma <- function(x, y, ...){
    sum(x, y, ...)
}

minhaSoma(2, NA, na.rm = TRUE)

