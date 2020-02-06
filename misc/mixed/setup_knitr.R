library(knitr)
## knitr options
opts_chunk$set(
    cache = TRUE,
    tidy = FALSE,
    comment = "#",
    collapse = TRUE, ## colapsa chunks em R Markdown
    fig.width = 7,
    fig.height = 5,
    out.width = "80%",
    fig.align = "center",
    ## dpi = 80, ## aumentar o dpi para exibir maior.
    ## dev = "png",
    ## cache.path = "cache/"
    fig.path = "figures/"
    )
