\name{plot.trait}
\alias{plot.trait}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
plot.trait(trait, prior = NULL, posterior.sample = NULL, trait.df = NULL, fontsize = list(title = 24, axis = 18), x.lim = NULL, y.lim = NULL, logx = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{trait}{
%%     ~~Describe \code{trait} here~~
}
  \item{prior}{
%%     ~~Describe \code{prior} here~~
}
  \item{posterior.sample}{
%%     ~~Describe \code{posterior.sample} here~~
}
  \item{trait.df}{
%%     ~~Describe \code{trait.df} here~~
}
  \item{fontsize}{
%%     ~~Describe \code{fontsize} here~~
}
  \item{x.lim}{
%%     ~~Describe \code{x.lim} here~~
}
  \item{y.lim}{
%%     ~~Describe \code{y.lim} here~~
}
  \item{logx}{
%%     ~~Describe \code{logx} here~~
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
function (trait, prior = NULL, posterior.sample = NULL, trait.df = NULL, 
    fontsize = list(title = 24, axis = 18), x.lim = NULL, y.lim = NULL, 
    logx = FALSE) 
{
    plot.posterior <- !is.null(posterior.sample)
    plot.prior <- !is.null(prior)
    plot.data <- !is.null(trait.df)
    units <- trait.dictionary(trait)$units
    prior.density <- posterior.density <- data.frame(x = NA, 
        y = NA)
    if (plot.prior) {
        prior.color = "black"
        prior.density <- create.density.df(distribution = prior)
        prior.density <- prior.density[prior.density$x > 0, ]
    }
    if (plot.posterior) {
        posterior.density <- create.density.df(samps = posterior.sample)
        posterior.density <- posterior.density[posterior.density$x > 
            0, ]
        prior.color <- "grey"
    }
    if (is.null(x.lim)) {
        x.lim <- range(posterior.density$x, prior.density$x, 
            na.rm = TRUE)
    }
    if (is.null(y.lim)) {
        y.lim <- range(posterior.density$y, prior.density$y, 
            na.rm = TRUE)
    }
    print(trait)
    print(x.lim)
    print(y.lim)
    ticks <<- lapply(data.frame(x = x.lim, y = y.lim), pretty, 
        4)
    print(ticks)
    x.lim <<- range(ticks$x)
    y.lim <<- range(ticks$y)
    base.plot <- create.base.plot() + theme_bw()
    if (logx == TRUE) {
        ticks$x <- ticks$x[ticks$x > 0]
        base.plot <- base.plot + scale_x_log10(units, breaks = ticks$x, 
            labels = ticks$x, limits = range(ticks$x))
    }
    else {
        base.plot <- base.plot + scale_x_continuous(units, breaks = ticks$x, 
            labels = ticks$x, limits = range(ticks$x))
    }
    if (plot.prior) {
        keep <- (prior.density$x > x.lim[1] & prior.density$x < 
            x.lim[2] & prior.density$y > y.lim[1] & prior.density$y < 
            y.lim[2])
        prior.density <- prior.density[keep, ]
        base.plot <- add.prior.density(prior.density, base.plot = base.plot, 
            prior.color = prior.color)
    }
    if (plot.posterior) {
        keep <- (posterior.density$x > x.lim[1] & posterior.density$x < 
            x.lim[2] & posterior.density$y > y.lim[1] & posterior.density$y < 
            y.lim[2])
        posterior.density <- posterior.density[keep, ]
        base.plot <- add.posterior.density(posterior.density, 
            base.plot = base.plot)
    }
    if (plot.data) {
        base.plot <- add.data(trait.df, base.plot = base.plot, 
            ymax = y.lim[2])
    }
    trait.plot <- base.plot + opts(title = trait.dictionary(trait)$figid, 
        axis.text.x = theme_text(size = fontsize$axis), axis.text.y = theme_blank(), 
        axis.title.x = theme_text(size = fontsize$axis), axis.title.y = theme_blank(), 
        axis.ticks = theme_blank(), axis.line = theme_blank(), 
        plot.title = theme_text(size = fontsize$title), panel.grid.major = theme_blank(), 
        panel.grid.minor = theme_blank(), panel.border = theme_blank()) + 
        geom_segment(aes(x = 0, y = 0, yend = 0, xend = x.lim[2])) + 
        geom_segment(aes(x = pretty(x.lim, 4), y = 0, xend = pretty(x.lim, 
            4), yend = -y.lim[2]/50))
    return(trait.plot)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
