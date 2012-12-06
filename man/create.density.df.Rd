\name{create.density.df}
\alias{create.density.df}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
create.density.df(samps = NULL, zero.bounded = FALSE, distribution = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{samps}{
%%     ~~Describe \code{samps} here~~
}
  \item{zero.bounded}{
%%     ~~Describe \code{zero.bounded} here~~
}
  \item{distribution}{
%%     ~~Describe \code{distribution} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (samps = NULL, zero.bounded = FALSE, distribution = NULL) 
{
    samp.exists <- !is.null(samps)
    dist.exists <- !is.null(distribution)
    if (identical(samp.exists, dist.exists)) {
        stop("create.density.df requires one and only one of:\n             samps: a vector of samples, e.g. MCMC chain,\n               OR\n             distribution: a named distribution supported by R")
    }
    if (samp.exists) {
        if (zero.bounded) {
            new.density <- zero.bounded.density(samps)
        }
        else {
            new.density <- density(samps)
        }
        density.df <- with(new.density, data.frame(x = x, y = y))
    }
    if (dist.exists) {
        density.df <- do.call(pr.dens, c(distribution[1:3], n = 1000))
    }
    return(density.df)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
