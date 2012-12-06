\name{tabnum}
\alias{tabnum}
\title{Table numbers}
\usage{
  tabnum(x, n = 3)
}
\arguments{
  \item{x}{numeric value or vector}

  \item{n}{number of significant figures}
}
\value{
  x rounded to n significant figures
}
\description{
  Table numbers
}
\examples{
# convert parameter name to a string appropriate for end-use plotting
trait.dictionary('growth_resp_factor')
trait.dictionary('growth_resp_factor')$figid

# get a list of all traits and units in dictionary
trait.dictionary()[,c('figid', 'units')]

Convert number to n significant digits
}

