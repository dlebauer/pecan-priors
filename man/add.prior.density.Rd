\name{add.prior.density}
\alias{add.prior.density}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
add.prior.density(prior.density, base.plot = NULL, prior.color = "black")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{prior.density}{
%%     ~~Describe \code{prior.density} here~~
}
  \item{base.plot}{
%%     ~~Describe \code{base.plot} here~~
}
  \item{prior.color}{
%%     ~~Describe \code{prior.color} here~~
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
function (prior.density, base.plot = NULL, prior.color = "black") 
{
    if (is.null(base.plot)) 
        base.plot <- create.base.plot()
    new.plot <- base.plot + geom_line(data = prior.density, aes(x = x, 
        y = y), color = prior.color)
    return(new.plot)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
