\name{plot.trait}
\alias{plot.trait}
\title{Plot trait density}
\usage{
  plot.trait(trait, prior = NULL, posterior.sample = NULL,
    trait.df = NULL,
    fontsize = list(title = 24, axis = 18), x.lim = NULL,
    y.lim = NULL, logx = FALSE)
}
\arguments{
  \item{trait}{character, name of trait to be plotted}

  \item{prior}{named distribution with parameters}

  \item{posterior.sample}{}

  \item{trait.data}{}

  \item{fontsize}{}
}
\value{
  plot (grob) object
}
\description{
  Plot trait density and data
}
\examples{
prior1 <- data.frame(distn = 'norm',
                     parama = 20,
                     paramb = 5)
data1  <- data.frame(Y = c(19, 21), se = c(1,1))
plot.trait(trait = 'Vcmax',
          prior = prior1,
          trait.data = data1)
}

