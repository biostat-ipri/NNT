# The R package NNT

This is the development github repository for NNT, an R package to compute the uncertainty associated to the estimation of the number needed to treat (NNT). This is a companion program to the article: 
Efforts needed for preventing breast and colorectal cancer through changes in dietary patterns
P Mullie et al., iPRI internal research report, 2020.



## Installation

To install the package under R, type

```{r eval=FALSE}
if(! ('devtools' %in% installed.packages())) install.packages('devtools')
devtools::install_github('biostat-ipri/NNT')
```

In order to install a local copy of the package vignette (short documenation) use:

```{r eval=FALSE}
devtools::install_github('biostat-ipri/NNT',build_vignette=TRUE)
```

## Documentation


The vignette can be accessed through

```{r eval=FALSE}
vignette('NNT')
```
## Shiny app

A shiny app providing a graphical interface can be found on [https://i-pri.shinyapps.io/NNT_app/](https://i-pri.shinyapps.io/NNT_app/)
