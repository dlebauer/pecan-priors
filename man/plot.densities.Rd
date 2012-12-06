\name{plot.densities}
\alias{plot.densities}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
plot.densities(density.plot.inputs, outdir, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{density.plot.inputs}{
%%     ~~Describe \code{density.plot.inputs} here~~
}
  \item{outdir}{
%%     ~~Describe \code{outdir} here~~
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
function (density.plot.inputs, outdir, ...) 
{
    trait.samples <- density.plot.inputs$trait.samples
    trait.df <- density.plot.inputs$trait.df
    prior.trait.samples <- density.plot.inputs$trait.df
    traits <- names(trait.samples)
    pdf(paste(outdir, "trait.densities.pdf", sep = ""), height = 12, 
        width = 20)
    for (trait in traits) {
        density.plot <- plot.density(trait.sample = trait.samples[, 
            trait], trait.df = trait.df[[trait]], ...)
        print(sensitivity.plot)
    }
    dev.off()
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
