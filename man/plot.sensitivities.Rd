\name{plot.sensitivities}
\alias{plot.sensitivities}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
plot.sensitivities(sensitivity.plot.inputs, prior.sensitivity.plot.inputs = NULL, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{sensitivity.plot.inputs}{
%%     ~~Describe \code{sensitivity.plot.inputs} here~~
}
  \item{prior.sensitivity.plot.inputs}{
%%     ~~Describe \code{prior.sensitivity.plot.inputs} here~~
}
  \item{\dots}{
%%     ~~Describe \code{\dots} here~~
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
function (sensitivity.plot.inputs, prior.sensitivity.plot.inputs = NULL, 
    ...) 
{
    sa.samples <- sensitivity.plot.inputs$sa.samples
    sa.splines <- sensitivity.plot.inputs$sa.splines
    if (!is.null(prior.sensitivity.plot.inputs)) {
        prior.sa.samples <- prior.sensitivity.plot.inputs$sa.samples
        prior.sa.splines <- prior.sensitivity.plot.inputs$sa.splines
    }
    traits <- names(sa.samples)
    y.range <- c(0, max(mapply(do.call, sa.splines, lapply(sa.samples, 
        list)), na.rm = TRUE))
    sensitivity.plots <- list()
    for (trait in traits) {
        if (!is.null(prior.sensitivity.plot.inputs)) {
            prior.sa.sample <- prior.sa.samples[, trait]
            prior.sa.spline <- prior.sa.splines[[trait]]
        }
        else {
            prior.sa.sample <- NULL
            prior.sa.spline <- NULL
        }
        sensitivity.plots[[trait]] <- plot.sensitivity(sa.sample = sa.samples[, 
            trait], sa.spline = sa.splines[[trait]], trait <- trait, 
            y.range = y.range, median.i = 4, prior.sa.sample = prior.sa.sample, 
            prior.sa.spline = prior.sa.spline, ...)
    }
    return(sensitivity.plots)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
