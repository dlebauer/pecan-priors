\name{pr.dens}
\alias{pr.dens}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
pr.dens(distn, parama, paramb, n = 1000, alpha = 0.001)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{distn}{
%%     ~~Describe \code{distn} here~~
}
  \item{parama}{
%%     ~~Describe \code{parama} here~~
}
  \item{paramb}{
%%     ~~Describe \code{paramb} here~~
}
  \item{n}{
%%     ~~Describe \code{n} here~~
}
  \item{alpha}{
%%     ~~Describe \code{alpha} here~~
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
function (distn, parama, paramb, n = 1000, alpha = 0.001) 
{
    alpha <- ifelse(alpha < 0.5, alpha, 1 - alpha)
    n <- ifelse(alpha == 0.5, 1, n)
    range.x <- do.call(paste("q", distn, sep = ""), list(c(alpha, 
        1 - alpha), parama, paramb))
    seq.x <- seq(from = range.x[1], to = range.x[2], length.out = n)
    dens.df <- data.frame(x = seq.x, y = do.call(paste("d", distn, 
        sep = ""), list(seq.x, parama, paramb)))
    return(dens.df)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
