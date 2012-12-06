\name{prior.fn}
\alias{prior.fn}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
prior.fn(parms, x, alpha, distn, central.tendency = NULL, trait = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{parms}{
%%     ~~Describe \code{parms} here~~
}
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{alpha}{
%%     ~~Describe \code{alpha} here~~
}
  \item{distn}{
%%     ~~Describe \code{distn} here~~
}
  \item{central.tendency}{
%%     ~~Describe \code{central.tendency} here~~
}
  \item{trait}{
%%     ~~Describe \code{trait} here~~
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
function (parms, x, alpha, distn, central.tendency = NULL, trait = NULL) 
{
    if (!distn \%in\% c("lnorm", "gamma", "weibull", "beta")) {
        stop(paste(distn, "not currently supported by prior.fn"))
    }
    if (distn == "lnorm") {
        mu <- parms[1]
        sigma <- parms[2]
        lcl <- mu + qnorm(alpha/2) * sigma
        ucl <- mu + qnorm(1 - alpha/2) * sigma
        if (is.null(central.tendency)) {
            ct <- x[3]
        }
        else if (central.tendency == "mean") {
            ct <- mu - sigma^2
        }
        else if (central.tendency == "median") {
            ct <- qlnorm(0.5, parms[1], parms[2])
        }
        x <- log(x)
    }
    if (distn == "gamma") {
        lcl <- qgamma(alpha/2, parms[1], parms[2])
        ucl <- qgamma(1 - alpha/2, parms[1], parms[2])
        if (is.null(central.tendency)) {
            ct <- x[3]
        }
        else if (central.tendency == "median") {
            ct <- qgamma(0.5, parms[1], parms[2])
        }
        else if (central.tendency == "mean") {
            ct <- parms[1]/parms[2]
        }
        else if (central.tendency == "mode") {
            ct <- ifelse(parms[1] > 1, (parms[1] - 1)/parms[2], 
                0)
        }
    }
    if (distn == "weibull") {
        lcl <- qweibull(alpha/2, parms[1], parms[2])
        ucl <- qweibull(1 - alpha/2, parms[1], parms[2])
        if (is.null(central.tendency)) {
            ct <- x[3]
        }
        else if (central.tendency == "median") {
            ct <- parms[2] * log(2)^(1/parms[1])
        }
        else if (central.tendency == "mean") {
            ct <- parms[2] * gamma(1 + 1/parms[2])
        }
        else if (central.tendency == "mode") {
            stop("mode calculation not currently supported for weibull distribution")
        }
    }
    if (distn == "beta") {
        a <- parms[1]
        if (central.tendency == "mean" & trait == "fineroot2leaf") {
            b <- a * (1/x[3] - 1)
        }
        else {
            b <- parms[2]
        }
        lcl <- qbeta(alpha/2, a, b)
        ucl <- qbeta(1 - alpha/2, a, b)
        if (is.null(central.tendency)) {
            ct <- x[3]
        }
        else if (central.tendency == "mean") {
            ct <- a/(a + b)
        }
        else if (central.tendency == "median") {
            ct <- qbeta(0.5, a, b)
        }
        else if (central.tendency == "mode") {
            ct <- ifelse(a > 1 & b > 1, (a - 1)/(a + b - 2), 
                0)
        }
    }
    return(sum(abs(c(lcl, ucl, ct) - x)))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
