#!/bin/sh

USER=fernandomayer
HOST=leg.ufpr.br
DIR=public_html/aulas/reco
read -p 'PORTA: ' PORT

Rscript -e 'rmarkdown::render_site()'
rsync -avz --delete -e "ssh -p $PORT" docs/ ${USER}@${HOST}:~/${DIR}

exit 0
