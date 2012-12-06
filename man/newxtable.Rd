\name{newxtable}
\alias{newxtable}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
newxtable(x, environment = "table", table.placement = "ht", label = NULL, caption = NULL, caption.placement = NULL, align = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{environment}{
%%     ~~Describe \code{environment} here~~
}
  \item{table.placement}{
%%     ~~Describe \code{table.placement} here~~
}
  \item{label}{
%%     ~~Describe \code{label} here~~
}
  \item{caption}{
%%     ~~Describe \code{caption} here~~
}
  \item{caption.placement}{
%%     ~~Describe \code{caption.placement} here~~
}
  \item{align}{
%%     ~~Describe \code{align} here~~
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
function (x, environment = "table", table.placement = "ht", label = NULL, 
    caption = NULL, caption.placement = NULL, align = NULL) 
{
    print(xtable(x, label = label, caption = caption, align = align), 
        floating.environment = environment, table.placement = table.placement, 
        caption.placement = caption.placement, sanitize.rownames.function = function(x) paste(""))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
