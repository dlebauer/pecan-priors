\name{priorfig}
\alias{priorfig}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
priorfig(priordata = NA, priordensity = NA, trait = "", xlim = "auto", fontsize = 24)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{priordata}{
%%     ~~Describe \code{priordata} here~~
}
  \item{priordensity}{
%%     ~~Describe \code{priordensity} here~~
}
  \item{trait}{
%%     ~~Describe \code{trait} here~~
}
  \item{xlim}{
%%     ~~Describe \code{xlim} here~~
}
  \item{fontsize}{
%%     ~~Describe \code{fontsize} here~~
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
function (priordata = NA, priordensity = NA, trait = "", xlim = "auto", 
    fontsize = 24) 
{
    if (is.data.frame(priordata)) {
        colnames(priordata) <- "x"
    }
    if (isTRUE(xlim == "auto")) {
        x.breaks <- pretty(c(signif(priordensity$prior.x, 2)), 
            4)
        xlim <- range(x.breaks)
    }
    else {
        x.breaks <- pretty(signif(xlim, 2), 4)
        xlim <- range(c(x.breaks, xlim))
    }
    priorfigure <- ggplot() + theme_bw() + scale_x_continuous(limits = xlim, 
        breaks = x.breaks, trait.dictionary(trait)$units) + scale_y_continuous(breaks = NA) + 
        opts(title = trait.dictionary(trait)$figid, panel.grid.major = theme_blank(), 
            panel.grid.minor = theme_blank(), axis.text.y = theme_blank(), 
            axis.text.x = theme_text(size = fontsize), axis.title.y = theme_blank(), 
            axis.title.x = theme_text(size = fontsize * 0.9), 
            plot.title = theme_text(size = fontsize * 1.1), panel.border = theme_border(c("bottom")))
    if (is.data.frame(priordata)) {
        priordata <- subset(priordata, subset = !is.na(x))
        dx <- with(priordata, min(abs(diff(x)[diff(x) != 0])))
        priordata <- transform(priordata, x = x + runif(length(x), 
            -dx/2, dx/2))
        rug <- geom_rug(data = priordata, aes(x))
        priorfigure <- priorfigure + rug
    }
    if (is.data.frame(priordensity[1])) {
        dens.line <- geom_line(data = priordensity, aes(x = prior.x, 
            y = dens.x))
        qpts <- get.quantiles.from.density(priordensity)
        dens.ci <- geom_point(data = qpts, aes(x, y))
        priorfigure <- priorfigure + dens.line + dens.ci
    }
    return(priorfigure)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
