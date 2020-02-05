x <- runif(3)
x
library(MASS)
search()
fractions(x)
MASS::fractions(x)
ls("package:MASS")
detach("package:MASS")
search()

.libPaths()
install.packages("mvtnorm")

## Exercícios 1
runif(30)
runif(min = -5, max = 5, 30)
runif(30, min = 10, max = 500)

?"+"
"+"(2, 2)

dados1 <- function(){
    sample(x = 1:6, size = 1)
}
dados1()

dados2 <- function(){
    ## sample(x = 1:6, size = 2, replace = TRUE)
    face1 <- sample(x = 1:6, size = 1)
    face2 <- sample(x = 1:6, size = 1)
    return(c(face1, face2))    
}

dados2()

dados3 <- function(n){
    sample(x = 1:6, size = n, replace = TRUE)
}

dados3(n = 100)

x <- 2
y <- 3
x <- 2; y <- 3

## Tipos primitivos


## double
x <- c(2, 4, 6)
class(x)
typeof(x)

x <- as.integer(x)
x <- as.integer(c(1, 2, 3))
class(x)
typeof(x)

## integer
x <- c(2L, 4L, 6L)
class(x)
typeof(x)

## character
x <- c("a", "b", "c")
class(x)
typeof(x)

## logical
x <- c(TRUE, FALSE, TRUE)
class(x)
typeof(x)

## complex
x <- c(2 + 1i, 4 + 1i, 6 + 1i)
x
class(x)
typeof(x)

## raw
x <- raw(3)
x
class(x)
typeof(x)

num <- c(10, 5, 2, 4, 8, 9)
typeof(num)

x <- as.integer(num)
typeof(x)

object.size(num)
object.size(x)

sqrt(2)^2 - 2
print(sqrt(2)^2, digits = 22)

0.3 + 0.6 - 0.9
print(c(0.3, 0.6, 0.9), digits = 22)

seq(1, 10)
1:10
seq(1, 10, by = 2)

rep(1, 10)
rep(c(1,2,3), times = 5)
rep(c(1,2,3), each = 5)

num <- c(10, 5, 2, 4, 8, 9)
num + num
num + c(2, 4, 1)
num + c(2, 4, 1, 5)

num * 2

x <- 1:10
x2 <- x^2
x2

## caracter

caracter <- c("brava", "joaquina", "armação")

## logico

logico <- caracter == "armação"
logico

logico <- num >= 4
logico

w <- c(5L, "a")
x <- c(1.7, "a")
y <- c(TRUE, 2)
z <- c("a", T)

## Exercício 3
x <- c(54, 0, 17, 94, 12.5, 2, 0.9, 15)
x + c(5, 6)
x + c(5, 6, 7)

x <- rep(c("A", "B", "C"), times = c(15, 12, 8))
x
x == "B"
sum(x == "B")

set.seed(123)
x <- runif(100, 0, 1)
x >= 0.5
sum(x >= 0.5)

int <- 1:50
x <- 2^int
x

y <- int^2
y

x == y
sum(x == y)
x[x == y]

x <- seq(0, 2*pi, by = 0.1)
x
a <- sin(x)
b <- cos(x)
c <- tan(x)
c2 <- a/b
c - c2
c[c == c2]
max(abs(c - c2))

fator <- factor(c("alta","baixa","baixa","media",
                  "alta","media","baixa","media","media"))
fator
class(fator)
typeof(fator)

unclass(fator)
as.integer(fator)

fator
fator <- factor(c("alta","baixa","baixa","media",
                  "alta","media","baixa","media","media"),
                levels = c("baixa", "media", "alta"),
                ordered = TRUE)
fator
class(fator)

matriz <- matrix(1:12, nrow = 3, ncol = 4)
matriz

matriz <- matrix(1:12, nrow = 3, ncol = 4, byrow = TRUE)
matriz

length(num)
length(matriz)
dim(num)
dim(matriz)

num
dim(num) <- c(3, 2)
num
dim(num) <- NULL
num

length(num) <- 10
num

matriz
matriz <- rbind(matriz, c(99,99,99,99))
matriz
matriz <- cbind(matriz, c(1,1,1,1))
matriz
dim(matriz)
dim(matriz) <- c(3, 4)
matriz

dim(matriz)
length(matriz)
length(matriz) <- 12
matriz
dim(matriz) <- c(3, 4)
matriz

matriz * 2

matriz2 <- matrix(1, nrow = 4, ncol = 3)
matriz %*% matriz2

lista <- list(1:30, "R", list(TRUE, FALSE))
lista
class(lista)
typeof(lista)

str(lista)
str(matriz)

dim(lista)
length(lista)

matriz
fator

lis2 <- list(matriz, fator)
lis2


da <- data.frame(nome = c("João", "José", "Maria"),
                 sexo = c("M", "M", "F"),
                 idade = c(32, 34, 30),
                 stringsAsFactors = FALSE)
da
str(da)
class(da)
typeof(da)
length(da)
dim(da)

## Atributos
names(da)
colnames(da)
rownames(da) <- letters[1:3]
rownames(da)
da

rownames(matriz) <- LETTERS[1:3]
colnames(matriz) <- letters[4:7]
matriz

num
length(num) <- 6
names(num) <- letters[1:6]
num

set.seed(1)
mat <- matrix(rnorm(50), nrow = 5)
mat
mean(mat)

mean.matrix <- function(x, ...)  colMeans(x, ...)
methods(mean)

mean(mat)
mean.default(mat)
