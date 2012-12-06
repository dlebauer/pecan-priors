\name{read.ensemble.output}
\alias{read.ensemble.output}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
read.ensemble.output(ensemble.size, outdir, pft.name = "", start.year, end.year, read.output = read.output.ed)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{ensemble.size}{
%%     ~~Describe \code{ensemble.size} here~~
}
  \item{outdir}{
%%     ~~Describe \code{outdir} here~~
}
  \item{pft.name}{
%%     ~~Describe \code{pft.name} here~~
}
  \item{start.year}{
%%     ~~Describe \code{start.year} here~~
}
  \item{end.year}{
%%     ~~Describe \code{end.year} here~~
}
  \item{read.output}{
%%     ~~Describe \code{read.output} here~~
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
function (ensemble.size, outdir, pft.name = "", start.year, end.year, 
    read.output = read.output.ed) 
{
    ensemble.output <- list()
    for (ensemble.id in 1:ensemble.size) {
        run.id <- get.run.id("ENS", left.pad.zeros(ensemble.id, 
            5), pft.name = pft.name)
        if (any(grep("h5", dir()[grep(run.id, dir())]))) {
            ensemble.output[[ensemble.id]] <- read.output(run.id, 
                outdir, start.year, end.year)
        }
        else {
            ensemble.output[[ensemble.id]] <- NA
        }
    }
    return(ensemble.output)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
