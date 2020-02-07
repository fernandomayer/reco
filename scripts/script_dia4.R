(df <- data.frame(v = 1:4, name = letters[1:4]))
system.time(df[3, 2])
system.time(df[3, "name"])
system.time(df$name[3])

library(microbenchmark)
microbenchmark(df[3, 2], df[3, "name"], df$name[3])

x <- runif(1e6)
microbenchmark(sqrt(x), x^0.5)

x <- 1:1000000
## Cria um objeto de armazenamento com o mesmo tamanho do resultado
st1 <- system.time({
    out1 <- numeric(length(x))
    for(i in 1:length(x)){
        out1[i] <- x[i]^2
    }
})
st1
## Cria um objeto de tamanho "zero" e vai "crescendo" esse vetor
st2 <- system.time({
    out2 <- numeric(0)
    for(i in 1:length(x)){
        out2[i] <- x[i]^2
    }
})
st2

x <- 1:1000000
## Cria uma função para o primeiro caso
st1 <- function(x) {
    out1 <- numeric(length(x))
    for(i in 1:length(x)){
        out1[i] <- x[i]^2
    }
    return(x)
}
## Cria uma função para o segundo caso
st2 <- function(x) {
    out2 <- numeric(0)
    for(i in 1:length(x)){
        out2[i] <- x[i]^2
    }
    return(x)
}
microbenchmark(st1, st2, times = 1000)


Rprof() ## Abre a conexão
out1 <- numeric(length(x))
for(i in 1:length(x)){
    out1[i] <- x[i]^2
}
Rprof(NULL) ## Fecha a conexão
summaryRprof() ## Resumo do profiling


library(profvis)
## Caso 1
profvis({
    out1 <- numeric(length(x))
    for(i in 1:length(x)){
        out1[i] <- x[i]^2
    }
})

profvis({
    out2 <- numeric(0)
    for(i in 1:length(x)){
        out2[i] <- x[i]^2
    }
})

set.seed(123)
n <- 1000; b0 <- 10; b1 <- 0.5
x <- rnorm(n, mean = 150, sd = 15)
sigma2 <- 20
y <- b0 + b1*x + rnorm(n, mean = 0, sd = sqrt(sigma2))
plot(x, y)

## Número de amostras
r <- 1e4
## Número de elementos em cada amostra
m <- 100
profvis({
    ## Vetores para armazenar os resultados
    b0.boot <- numeric(r)
    b1.boot <- numeric(r)
    s2.boot <- numeric(r)
    set.seed(123)
    for(i in 1:r){
        select <- sample(1:length(y), size = m, replace = TRUE)
        x.boot <- x[select]
        y.boot <- y[select]
        mm <- lm(y.boot ~ x.boot)
        b0.boot[i] <- coef(mm)[1]
        b1.boot[i] <- coef(mm)[2]
        s2.boot[i] <- summary(mm)$sigma^2
    }
})
## Por curiosidade, veja:
par(mfrow = c(1, 3))
hist(b0.boot)
hist(b1.boot)
hist(s2.boot)
par(mfrow = c(1, 1))

baskara <- function(a, b, c) {
    denom <- 2 * a
    delta <- b^2 - 4 * a * c
    sqrt_delta <- sqrt(delta)
    x1 <- (-b - sqrt_delta)/denom
    x2 <- (-b + sqrt_delta)/denom
    return(c(x1, x2))
}

baskara(-3, 2, 1)
baskara(0, 2, 1)
baskara(3, 2, 1)

baskara <- function(a, b, c) {
    if(a == 0) stop("Argumento `a` não pode ser zero.")
    denom <- 2 * a
    delta <- b^2 - 4 * a * c
    sqrt_delta <- sqrt(delta)
    x1 <- (-b - sqrt_delta)/denom
    x2 <- (-b + sqrt_delta)/denom
    return(c(x1, x2))
}

debug(baskara)
baskara(3, 2, 1)

undebug(baskara)

debugonce(baskara)

baskara <- function(a, b, c) {
    if(a == 0) stop("Argumento `a` não pode ser zero.")
    denom <- 2 * a
    delta <- b^2 - 4 * a * c
    if(delta < 0) stop("Delta é negativo.")
    sqrt_delta <- sqrt(delta)
    x1 <- (-b - sqrt_delta)/denom
    x2 <- (-b + sqrt_delta)/denom
    return(c(x1, x2))
}

baskara(3, 2, 1)
baskara(0, 2, 1)
baskara(0, 2, 1)
# Error in baskara(0, 2, 1): Argumento `a` não pode ser zero.
er1 <- baskara(0, 2, 1)
# Error in baskara(0, 2, 1): Argumento `a` não pode ser zero.
er1

er1 <- try(baskara(0, 2, 1))
er1
if(class(er1) == "try-error") c(NA, NA)

tryCatch(baskara(0, 2, 1),
         error = function(cmd) c(NA, NA))
