\name{get.stats.mcmc}
\alias{get.stats.mcmc}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
get.stats.mcmc(mcmc.summary, sample.size)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{mcmc.summary}{
%%     ~~Describe \code{mcmc.summary} here~~
}
  \item{sample.size}{
%%     ~~Describe \code{sample.size} here~~
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
function (mcmc.summary, sample.size) 
{
    a <- list(n = sample.size)
    for (parm in c("beta.o", "sd.y", "sd.site", "sd.trt", "beta.ghs[2]")) {
        parm.name <- ifelse(parm == "beta.ghs[2]", "beta.ghs", 
            parm)
        if (parm \%in\% rownames(mcmc.summary$statistics)) {
            a[[parm.name]] <- get.parm.stat(mcmc.summary, parameter = parm)
        }
        else {
            a[[parm.name]] <- NA
        }
    }
    return(unlist(a))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
