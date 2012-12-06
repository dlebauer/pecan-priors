\name{read.sa.output}
\alias{read.sa.output}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
read.sa.output(traits, quantiles, outdir, pft.name = "", start.year, end.year, read.output = read.output.ed)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{traits}{
%%     ~~Describe \code{traits} here~~
}
  \item{quantiles}{
%%     ~~Describe \code{quantiles} here~~
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
function (traits, quantiles, outdir, pft.name = "", start.year, 
    end.year, read.output = read.output.ed) 
{
    sa.output <- data.frame()
    for (trait in traits) {
        for (quantile in quantiles) {
            run.id <- get.run.id("SA", round(quantile, 3), trait = trait, 
                pft.name = pft.name)
            print(run.id)
            sa.output[as.character(round(quantile * 100, 3)), 
                trait] <- read.output(run.id, outdir, start.year, 
                end.year)
        }
    }
    sa.output["50", ] <- read.output(get.run.id("SA", "median"), 
        outdir, start.year, end.year)
    sa.output <- sa.output[order(as.numeric(rownames(sa.output))), 
        ]
    return(sa.output)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
