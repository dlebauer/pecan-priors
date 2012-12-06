\name{plot.variance.decomposition}
\alias{plot.variance.decomposition}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
plot.variance.decomposition(plot.inputs, prior.plot.inputs = NULL, fontsize = list(title = 24, axis = 18))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{plot.inputs}{
%%     ~~Describe \code{plot.inputs} here~~
}
  \item{prior.plot.inputs}{
%%     ~~Describe \code{prior.plot.inputs} here~~
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
function (plot.inputs, prior.plot.inputs = NULL, fontsize = list(title = 24, 
    axis = 18)) 
{
    traits <- names(plot.inputs$variances)
    units <- trait.dictionary(traits)$units
    trait.labels <- merge(data.frame(id = traits), trait.dictionary(traits), 
        by = "id", sort = FALSE)$figid
    .plot.data <- data.frame(trait.labels = trait.labels, units = units, 
        coef.vars = plot.inputs$coef.vars * 100, elasticities = plot.inputs$elasticities, 
        variances = sqrt(plot.inputs$variances))
    if (!is.null(prior.plot.inputs)) {
        prior.plot.data <- data.frame(trait.labels = trait.labels, 
            units = units, prior.coef.vars = prior.plot.inputs$coef.vars * 
                100, prior.elasticities = prior.plot.inputs$elasticities, 
            prior.variances = sqrt(prior.plot.inputs$variances))
        .plot.data <- merge(.plot.data, prior.plot.data, by = "trait.labels")
    }
    pv.order <- order(.plot.data$variances, decreasing = FALSE)
    plot.data <- data.frame(.plot.data[pv.order, ], points = 1:length(traits) - 
        0.5)
    cv.xticks <<- pretty(as.matrix(plot.data[, grep("coef.var", 
        colnames(plot.data))]), 4)
    pv.xticks <<- pretty(as.matrix(plot.data[, grep("variances", 
        colnames(plot.data))]), 4)
    el.xticks <<- pretty(as.matrix(plot.data[, grep("elasticities", 
        colnames(plot.data))]), 3)
    el.xrange <<- range(pretty(as.matrix(plot.data[, grep("elasticities", 
        colnames(plot.data))]), 4))
    base.plot <- ggplot(plot.data) + coord_flip() + theme_bw() + 
        opts(axis.line.y = theme_blank(), axis.text.x = theme_text(size = fontsize$axis, 
            vjust = -1), axis.text.y = theme_blank(), axis.title.x = theme_blank(), 
            axis.title.y = theme_blank(), axis.ticks = theme_blank(), 
            panel.grid.major = theme_blank(), panel.grid.minor = theme_blank(), 
            panel.border = theme_blank())
    if (!is.null(prior.plot.inputs)) {
        .cv.plot <- base.plot + geom_pointrange(aes(x = points, 
            y = prior.coef.vars, ymin = 0, ymax = prior.coef.vars), 
            size = 1.25, color = "grey")
        .el.plot <- base.plot + geom_pointrange(aes(x = points, 
            prior.elasticities, ymin = 0, ymax = prior.elasticities), 
            size = 1.25, color = "grey")
        .pv.plot <- base.plot + geom_pointrange(aes(x = points, 
            y = prior.variances, ymin = 0, ymax = prior.variances), 
            size = 1.25, color = "grey")
    }
    else {
        .cv.plot <- base.plot + scale_y_continuous(breaks = cv.xticks)
        .el.plot <- base.plot + scale_y_continuous(breaks = el.xrange)
        .pv.plot <- base.plot + scale_y_continuous(breaks = pv.xticks)
    }
    trait.plot <- base.plot + opts(title = "Parameter", plot.title = theme_text(hjust = 0.96, 
        size = fontsize$title), axis.text.x = theme_text(colour = "white"), 
        axis.line.x = theme_blank()) + geom_text(aes(y = 1, x = points, 
        label = trait.labels, hjust = 1), size = fontsize$axis/3) + 
        scale_y_continuous(breaks = c(0, 0), limits = c(0, 1)) + 
        geom_segment(aes(x = c(0, 0), y = c(0, 0), yend = c(0, 
            max(cv.xticks)), xend = c(length(traits), 0)), colour = "white") + 
        geom_segment(aes(x = 0, y = cv.xticks, xend = -0.1, yend = cv.xticks), 
            colour = "white")
    cv.plot <- .cv.plot + opts(title = "CV (\%)", plot.title = theme_text(size = fontsize$title)) + 
        scale_y_continuous(breaks = cv.xticks, limits = range(cv.xticks)) + 
        geom_pointrange(aes(x = points, y = coef.vars, ymin = 0, 
            ymax = coef.vars), size = 1.25) + geom_segment(aes(x = c(0, 
        0), y = c(0, 0), yend = c(0, max(cv.xticks)), xend = c(length(traits), 
        0))) + geom_segment(aes(x = 0, y = cv.xticks, xend = -0.1, 
        yend = cv.xticks))
    if (diff(range(el.xticks)) < 4) 
        el.xticks <- c(-1, 0, 1)
    el.plot <- .el.plot + opts(title = "Elasticity", plot.title = theme_text(size = fontsize$title)) + 
        scale_y_continuous(breaks = el.xticks, limits = range(el.xrange)) + 
        geom_pointrange(aes(x = points, y = elasticities, ymin = 0, 
            ymax = elasticities), size = 1.25) + geom_segment(aes(x = c(0, 
        0), y = c(0, min(el.xrange)), yend = c(0, max(el.xrange)), 
        xend = c(length(traits), 0))) + geom_segment(aes(x = 0, 
        y = el.xticks, xend = -0.1, yend = el.xticks))
    pv.plot <- .pv.plot + opts(title = "Root Variance (SD)", 
        plot.title = theme_text(size = fontsize$title)) + scale_y_continuous(breaks = pv.xticks, 
        limits = range(pv.xticks)) + geom_pointrange(aes(x = points, 
        variances, ymin = 0, ymax = variances), size = 1.25) + 
        geom_segment(aes(x = c(0, 0), y = c(0, 0), yend = c(0, 
            max(pv.xticks)), xend = c(length(traits), 0))) + 
        geom_segment(aes(x = 0, y = pv.xticks, xend = -0.1, yend = pv.xticks))
    return(list(trait.plot = trait.plot, cv.plot = cv.plot, el.plot = el.plot, 
        pv.plot = pv.plot))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
