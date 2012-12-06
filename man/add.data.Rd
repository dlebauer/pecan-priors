\name{add.data}
\alias{add.data}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
add.data(trait.data, base.plot = NULL, ymax, color = "black")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{trait.data}{
%%     ~~Describe \code{trait.data} here~~
}
  \item{base.plot}{
%%     ~~Describe \code{base.plot} here~~
}
  \item{ymax}{
%%     ~~Describe \code{ymax} here~~
}
  \item{color}{
%%     ~~Describe \code{color} here~~
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
function (trait.data, base.plot = NULL, ymax, color = "black") 
{
    if (is.null(base.plot)) 
        base.plot <- create.base.plot()
    n.pts <- nrow(trait.data)
    ymax <- ymax * sqrt(n.pts + 1)/sqrt((n.pts + 1) * 64)
    y.pts <- seq(0, ymax, length.out = 1 + n.pts)[-1]
    plot.data <- data.frame(x = trait.data$Y, y = y.pts, se = trait.data$se)
    new.plot <- base.plot + geom_point(data = plot.data, aes(x = x, 
        y = y), color = color) + geom_segment(data = plot.data, 
        aes(x = x - se, y = y, xend = x + se, yend = y), color = color)
    return(new.plot)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
