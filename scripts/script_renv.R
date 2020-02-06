## Workflow do renv

## https://rstudio.github.io/renv/articles/renv.html
## https://rstudio.github.io/renv/articles/collaborating.html

## Para instalar curl no Windown
renv::equip()

## Cria projeto
renv::init()

## "Congela" em algum ponto
renv::snapshot()

## Com os arquivos
## renv/activate.R
## .Rprofile
## renv.lock
## em um diretório, faça
renv::restore()
## para restaurar o projeto (instalando todos os pacotes nas versões
## específicas)
