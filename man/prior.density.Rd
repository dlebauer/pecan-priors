\name{prior.density}
\alias{prior.density}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
prior.density(distribution = "norm", a = 0, b = 1, xlim = NA)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{distribution}{
%%     ~~Describe \code{distribution} here~~
}
  \item{a}{
%%     ~~Describe \code{a} here~~
}
  \item{b}{
%%     ~~Describe \code{b} here~~
}
  \item{xlim}{
%%     ~~Describe \code{xlim} here~~
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
function (distribution = "norm", a = 0, b = 1, xlim = NA) 
{
    distribution <- gsub("lognormal", "lnorm", distribution)
    if (distribution != "beta") {
        if (isTRUE(is.na(xlim))) {
            range.x <- range(pretty(do.call(paste("q", distribution, 
                sep = ""), list(c(0.005, 0.995), a, b))))
        }
        else if (isTRUE(!is.na(xlim))) {
            range.x <- xlim
        }
        prior.x <- seq(from = range.x[1], to = range.x[2], length = 1000)
    }
    else {
        range.x <- c(0, 1)
        prior.x <- seq(from = 0, to = 1, length = 1000)
    }
    dens.x <- do.call(paste("d", distribution, sep = ""), list(prior.x, 
        a, b))
    prob.x <- do.call(paste("p", distribution, sep = ""), list(prior.x, 
        a, b))
    return(data.frame(prior.x, dens.x, prob.x))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
