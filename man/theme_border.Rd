\name{theme_border}
\alias{theme_border}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
theme_border(type = c("left", "right", "bottom", "top", "none"), colour = "black", size = 1, linetype = 1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{type}{
%%     ~~Describe \code{type} here~~
}
  \item{colour}{
%%     ~~Describe \code{colour} here~~
}
  \item{size}{
%%     ~~Describe \code{size} here~~
}
  \item{linetype}{
%%     ~~Describe \code{linetype} here~~
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
function (type = c("left", "right", "bottom", "top", "none"), 
    colour = "black", size = 1, linetype = 1) 
{
    type <- match.arg(type, several.ok = TRUE)
    structure(function(x = 0, y = 0, width = 1, height = 1, ...) {
        xlist <- c()
        ylist <- c()
        idlist <- c()
        if ("bottom" \%in\% type) {
            xlist <- append(xlist, c(x, x + width))
            ylist <- append(ylist, c(y, y))
            idlist <- append(idlist, c(1, 1))
        }
        if ("top" \%in\% type) {
            xlist <- append(xlist, c(x, x + width))
            ylist <- append(ylist, c(y + height, y + height))
            idlist <- append(idlist, c(2, 2))
        }
        if ("left" \%in\% type) {
            xlist <- append(xlist, c(x, x))
            ylist <- append(ylist, c(y, y + height))
            idlist <- append(idlist, c(3, 3))
        }
        if ("right" \%in\% type) {
            xlist <- append(xlist, c(x + width, x + width))
            ylist <- append(ylist, c(y, y + height))
            idlist <- append(idlist, c(4, 4))
        }
        polylineGrob(x = xlist, y = ylist, id = idlist, ..., 
            default.units = "npc", gp = gpar(lwd = size, col = colour, 
                lty = linetype), )
    }, class = "theme", type = "box", call = match.call())
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
