\name{pdf.stats}
\alias{pdf.stats}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
pdf.stats(distn, A, B)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{distn}{
%%     ~~Describe \code{distn} here~~
}
  \item{A}{
%%     ~~Describe \code{A} here~~
}
  \item{B}{
%%     ~~Describe \code{B} here~~
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
function (distn, A, B) 
{
    distn <- as.character(distn)
    mean <- switch(distn, gamma = A/B, lnorm = exp(A + 1/2 * 
        B^2), beta = A/(A + B), weibull = B * gamma(1 + 1/A), 
        norm = A, f = ifelse(B > 2, B/(B - 2), mean(rf(10000, 
            A, B))))
    var <- switch(distn, gamma = A/B^2, lnorm = exp(2 * A + B^2) * 
        (exp(B^2) - 1), beta = A * B/((A + B)^2 * (A + B + 1)), 
        weibull = B^2 * (gamma(1 + 2/A) - gamma(1 + 1/A)^2), 
        norm = B^2, f = ifelse(B > 4, 2 * B^2 * (A + B - 2)/(A * 
            (B - 2)^2 * (B - 4)), var(rf(1e+05, A, B))))
    qci <- get(paste("q", distn, sep = ""))
    ci <- qci(c(0.025, 0.975), A, B)
    lcl <- ci[1]
    ucl <- ci[2]
    out <- unlist(list(mean = mean, var = var, lcl = lcl, ucl = ucl))
    return(out)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
