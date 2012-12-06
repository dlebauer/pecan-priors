\name{plot.sensitivity}
\alias{plot.sensitivity}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
plot.sensitivity(sa.sample, sa.spline, trait, y.range = c(0, 50), median.i = 4, prior.sa.sample = NULL, prior.sa.spline = NULL, fontsize = list(title = 24, axis = 18), linesize = 1, dotsize = 2)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{sa.sample}{
%%     ~~Describe \code{sa.sample} here~~
}
  \item{sa.spline}{
%%     ~~Describe \code{sa.spline} here~~
}
  \item{trait}{
%%     ~~Describe \code{trait} here~~
}
  \item{y.range}{
%%     ~~Describe \code{y.range} here~~
}
  \item{median.i}{
%%     ~~Describe \code{median.i} here~~
}
  \item{prior.sa.sample}{
%%     ~~Describe \code{prior.sa.sample} here~~
}
  \item{prior.sa.spline}{
%%     ~~Describe \code{prior.sa.spline} here~~
}
  \item{fontsize}{
%%     ~~Describe \code{fontsize} here~~
}
  \item{linesize}{
%%     ~~Describe \code{linesize} here~~
}
  \item{dotsize}{
%%     ~~Describe \code{dotsize} here~~
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
function (sa.sample, sa.spline, trait, y.range = c(0, 50), median.i = 4, 
    prior.sa.sample = NULL, prior.sa.spline = NULL, fontsize = list(title = 24, 
        axis = 18), linesize = 1, dotsize = 2) 
{
    LENGTH_OUT <- 1000
    units <- trait.dictionary(trait)$units
    saplot <- ggplot()
    post.x <- seq(from = min(sa.sample), to = max(sa.sample), 
        length.out = LENGTH_OUT)
    saplot <- saplot + geom_line(aes(x, y), data = data.frame(x = post.x, 
        y = sa.spline(post.x)), size = linesize) + geom_point(aes(x, 
        y), data = data.frame(x = sa.sample, y = sa.spline(sa.sample)), 
        size = dotsize) + geom_point(aes(x, y), data = data.frame(x = sa.sample[median.i], 
        y = sa.spline(sa.sample[median.i])), size = dotsize * 
        1.3) + scale_y_continuous(limits = range(pretty(y.range)), 
        breaks = pretty(y.range, n = 3)[1:3]) + theme_bw() + 
        opts(title = trait.dictionary(trait)$figid, axis.text.x = theme_text(size = fontsize$axis * 
            1.5), axis.text.y = theme_text(size = fontsize$axis * 
            1.5), axis.title.x = theme_text(size = fontsize$axis * 
            1.5), axis.title.y = theme_blank(), plot.title = theme_text(size = fontsize$title * 
            1.5), panel.border = theme_blank(), panel.grid.minor = theme_blank(), 
            panel.grid.major = theme_blank())
    prior.x <- post.x
    if (!is.null(prior.sa.sample) & !is.null(prior.sa.spline)) {
        prior.x <- seq(from = min(prior.sa.sample), to = max(prior.sa.sample), 
            length.out = LENGTH_OUT)
        saplot <- saplot + geom_line(aes(x, y), data = data.frame(x = prior.x, 
            y = prior.sa.spline(prior.x)), size = linesize, color = "grey") + 
            geom_point(aes(x, y), data = data.frame(x = prior.sa.sample, 
                y = prior.sa.spline(prior.sa.sample)), size = dotsize, 
                color = "grey") + geom_point(aes(x, y), data = data.frame(x = prior.sa.sample[median.i], 
            y = prior.sa.spline(prior.sa.sample[median.i])), 
            size = dotsize * 1.5, color = "grey")
    }
    max.x <- max(prior.x)
    min.x <- 0
    x.breaks <- pretty(c(min.x, max.x), 4)
    saplot <- saplot + scale_x_continuous(units, limits = range(x.breaks), 
        breaks = x.breaks)
    return(saplot)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
