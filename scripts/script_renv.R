## Workflow do renv

## https://rstudio.github.io/renv/articles/renv.html
## https://rstudio.github.io/renv/articles/collaborating.html

## Para instalar curl no Windows
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

## Depois de instalar outros pacotes, atualizar o projeto, etc, a
## qualquer momento use
renv::snapshot()
## para atualizar a lista de pacotes específicos.
