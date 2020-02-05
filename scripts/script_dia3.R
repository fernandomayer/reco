cont <- c(8, 4, NA, 9, 6, 1, 7, 9)
cont[3]
cont[1]
cont[1:4]
cont[c(1, 3, 8)]
cont[c(5, 2, 1)]

cont[-3]
cont[-c(1, 3, 8)]
cont[-(1:5)]

cont
is.na(cont)
cont[is.na(cont)] <- 99
cont
cont[!is.na(cont)]

cont[0]
cont[]
names(cont) <- letters[1:length(cont)]
cont
cont["e"]
cont["c"]
cont[c("e", "c")]

mat <- matrix(1:9, nrow = 3)
mat
mat[1,3]
mat[3,2]
mat[c(1,3), 2]
mat[c(1,3), 2, drop = FALSE]
mat[2, ]
mat[2, , drop = FALSE]
mat[,1]
mat[,1, drop=FALSE]


lis <- list(c(3, 8, 7, 4), mat, 5:0)
lis

lis[1]
class(lis[1])
lis[[1]]
class(lis[[1]])

lis[[1]][3]
lis[[1]][c(1, 4)]

lis[[2]]
lis[[2]][2, 3]
lis[[2]][2,]
lis[[2]][2, , drop=FALSE]
str(lis)

length(lis)
names(lis)
names(lis) <- c("vetor1", "matriz", "vetor2")
lis
lis[[1]]
lis$vetor1
lis$vetor1[3]

lis[[2]]
lis$matriz
lis$matriz[2,3]

da <- data.frame(A = 4:1,
                 B = c(2, NA, 5, 8))
da
dim(da)
da[2, 1]
da[c(1, 3), 1]
da[c(1, 3), 1, drop = FALSE]
da[1, "B"]
colnames(da)
rownames(da)
names(da)
da["3", "A"]
da$A
da$B
da$B[2]

da
da[is.na(da$B), ]
da[!is.na(da$B), ]
complete.cases(da)

da[complete.cases(da), ]

with(da, A)
with(da, A[3])
with(da, mean(A))
mean(da$A)

dados <- c(5, 15, 42, 28, 79, 4, 7, 14)
dados[dados > 15]
dados > 15

dados[dados > 15 & dados <= 35]
dados[dados > 15 | dados <= 35]

cara <- letters[1:length(dados)]
cara
dados[cara == "b"]
cara == "b"

dados[cara == "a" & cara == "c"]
dados[cara == "a" | cara == "c"]
dados[cara == "a" | cara == "c" | cara == "f"]

dados[cara == c("a", "c", "f")]
dados[cara %in% c("a", "c", "f")]

dados[dados > 15]
which(dados > 15)

which(cara == "a")
which(cara %in% c("a", "c"))

dados <- data.frame(ano = c(2001, 2002, 2003, 2004, 2005),
                    captura = c(26, 18, 25, 32, NA),
                    porto = c("SP", "RS", "SC", "SC", "RN"))
dados
str(dados)

dados[dados$ano == 2004, ]
dados[dados$ano == 2004, 3]

dados[dados$captura > 20, ]
dados[dados$captura > 20 & !is.na(dados$captura), ]
dados[dados$captura > 20 & complete.cases(dados), ]

subset(dados, ano == 2004)
subset(dados, captura > 20)
subset(dados, captura > 20, select = "porto")

for(i in 1:10){
    print(i)
}

x <- 100:200
for(j in 1:10){
    print(x[j])
}

for(i in c(2, 9, 4, 6)){
    print(i^2)
}

for(veiculos in c("carro", "ônibus", "trem", "bicicleta")){
    print(veiculos)
}

## Importa os dados
url <- "http://leg.ufpr.br/~fernandomayer/data/notas.csv"
notas <- read.table(url, header = TRUE, sep = ";", dec = ",")
str(notas)

x <- 100:200
for(j in 1:10){
    if(x[j] <= 105){
        print("Menor ou igual a 105")
    }
}

x <- 100:200
for(j in 1:10){
    if(x[j] <= 105){
        print("Menor ou igual a 105")
    } else{
        print("Maior do que 105")
    }
}

nlinhas <- nrow(notas)
notas$MP <- notas$media

notas$situacao <- NA # aqui usamos NA porque o resultado será um
# caracter
## Estrutura de repetição
for(i in 1:nlinhas){
    ## Estrutura de seleção (usando a média ponderada)
    if(notas$MP[i] >= 7){
        notas$situacao[i] <- "aprovado"
    } else{
        notas$situacao[i] <- "reprovado"
    }
}

head(notas)
provas <- c("prova1", "prova2", "prova3")
notas$media.apply <- apply(X = notas[, provas], 
                           MARGIN = 1, FUN = mean)
head(notas)

notas$dp.apply <- apply(X = notas[, provas], 
                           MARGIN = 1, FUN = sd)

notas$situacao2 <- ifelse(notas$MP >= 7, "aprovado",
                          "reprovado")

mean(notas$prova1)
mean(notas$prova2)
mean(notas$prova3)
apply(X = notas[, provas], MARGIN = 2, FUN = mean)

sapply(notas[, provas],  mean)
lapply(notas[, provas],  mean)

mean(notas$prova1[notas$situacao == "aprovado"])
mean(notas$prova1[notas$situacao == "reprovado"])

## Média da prova 1 por situação
tapply(notas$prova1,  notas$situacao,  mean)
tapply(notas$prova2,  notas$situacao,  mean)
tapply(notas$prova3,  notas$situacao,  mean)

aggregate(prova1 ~ situacao, data = notas, FUN = mean)
aggregate(prova2 ~ situacao, data = notas, FUN = mean)
aggregate(prova3 ~ situacao, data = notas, FUN = mean)
aggregate(cbind(prova1, prova2, prova3) ~ situacao, 
          data = notas, FUN = mean)


