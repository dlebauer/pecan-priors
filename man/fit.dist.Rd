\name{fit.dist}
\alias{fit.dist}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
fit.dist(trait.data, trait = colnames(trait.data), dists = c("weibull", "lognormal", "gamma"), n = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{trait.data}{
%%     ~~Describe \code{trait.data} here~~
}
  \item{trait}{
%%     ~~Describe \code{trait} here~~
}
  \item{dists}{
%%     ~~Describe \code{dists} here~~
}
  \item{n}{
%%     ~~Describe \code{n} here~~
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
function (trait.data, trait = colnames(trait.data), dists = c("weibull", 
    "lognormal", "gamma"), n = NULL) 
{
    if (class(trait.data) == "data.frame") 
        trait.data <- trait.data[, 1]
    nostart.dists <- dists[dists \%in\% c("weibull", "lognormal", 
        "gamma", "normal")]
    a <- lapply(nostart.dists, function(x) suppressWarnings(fitdistr(trait.data, 
        x)))
    names(a) <- nostart.dists
    if ("f" \%in\% dists) {
        print(trait)
        if (trait == "tt") {
            a[["f"]] <- suppressWarnings(fitdistr(trait.data, 
                "f", start = list(df1 = 100, df2 = 200)))
        }
        else if (trait == "sla") {
            a[["f"]] <- suppressWarnings(fitdistr(trait.data, 
                "f", start = list(df1 = 6, df2 = 1)))
        }
        else if (trait == "rrr") {
            a[["f"]] <- suppressWarnings(fitdistr(trait.data, 
                "f", start = list(df1 = 6, df2 = 1)))
        }
        else if (trait == "q") {
            a[["f"]] <- suppressWarnings(fitdistr(trait.data, 
                "f", start = list(df1 = 1, df2 = 2)))
        }
    }
    if ("beta" \%in\% dists) {
        a[["beta"]] <- suppressWarnings(fitdistr(trait.data, 
            "beta", start = list(shape1 = 2, shape2 = 1)))
    }
    aicvalues <- lapply(a, AIC)
    result <- t(sapply(dists, function(x) cbind(t(tabnum(a[[x]]$estimate)), 
        signif(aicvalues[[x]]))))
    colnames(result) <- c("a", "b", "AIC")
    print(result)
    bestfitdist <- names(which.min(aicvalues))
    parms <- tabnum(a[[bestfitdist]]$estimate)
    dist <- ifelse(bestfitdist == "normal", "norm", bestfitdist)
    return(data.frame(distribution = dist, a = as.numeric(parms[1]), 
        b = as.numeric(parms[2]), n = ifelse(is.null(n), length(trait.data), 
            n)))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
