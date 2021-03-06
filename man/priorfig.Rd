\name{priorfig}
\alias{priorfig}
\title{Prior Figure}
\usage{
  priorfig(priordata = NA, priordensity = NA, trait = "",
    xlim = "auto", fontsize = 24)
}
\arguments{
  \item{priordata}{observations to be plotted as points}

  \item{priordensity}{density of prior distribution,
  calculated by \code{\link{prior.density}}}

  \item{trait}{name of trait}

  \item{xlim}{limits for x axis}
}
\value{
  plot / grob of prior distribution with data used to
  inform the distribution
}
\description{
  Plot prior density and data
}

