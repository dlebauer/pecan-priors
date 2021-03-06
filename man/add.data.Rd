\name{add.data}
\alias{add.data}
\title{Add data to plot}
\usage{
  add.data(trait.data, base.plot = NULL, ymax,
    color = "black")
}
\arguments{
  \item{trait.data}{data to be plotted}

  \item{base.plot}{a ggplot object (grob), created by
  \code{\link{create.base.plot}} if none provided}

  \item{ymax}{maximum height of y}
}
\value{
  updated plot object
}
\description{
  Add data to an existing plot or create a new one from
  \code{\link{create.base.plot}}
}
\details{
  Used to add raw data or summary statistics to the plot of
  a distribution. The height of Y is arbitrary, and can be
  set to optimize visualization. If SE estimates are
  available, tehse wil be plotted
}
\examples{
add.data(data.frame(Y = c(1, 2), se = c(1,2)), base.plot = NULL, ymax = 10)
}
\seealso{
  \code{\link{create.base.plot}}
}

