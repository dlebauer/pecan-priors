\name{dhist}
\alias{dhist}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
dhist(x, a = 5 * iqr(x), nbins = nclass.Sturges(x), rx = range(x, na.rm = TRUE), eps = 0.15, xlab = "x", plot = TRUE, lab.spikes = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{a}{
%%     ~~Describe \code{a} here~~
}
  \item{nbins}{
%%     ~~Describe \code{nbins} here~~
}
  \item{rx}{
%%     ~~Describe \code{rx} here~~
}
  \item{eps}{
%%     ~~Describe \code{eps} here~~
}
  \item{xlab}{
%%     ~~Describe \code{xlab} here~~
}
  \item{plot}{
%%     ~~Describe \code{plot} here~~
}
  \item{lab.spikes}{
%%     ~~Describe \code{lab.spikes} here~~
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
function (x, a = 5 * iqr(x), nbins = nclass.Sturges(x), rx = range(x, 
    na.rm = TRUE), eps = 0.15, xlab = "x", plot = TRUE, lab.spikes = TRUE) 
{
    if (is.character(nbins)) 
        nbins <- switch(casefold(nbins), sturges = nclass.Sturges(x), 
            fd = nclass.FD(x), scott = nclass.scott(x), stop("Nclass method not recognized"))
    else if (is.function(nbins)) 
        nbins <- nbins(x)
    x <- sort(x[!is.na(x)])
    if (a == 0) 
        a <- diff(range(x))/1e+08
    if (a != 0 & a != Inf) {
        n <- length(x)
        h <- (rx[2] + a - rx[1])/nbins
        ybr <- rx[1] + h * (0:nbins)
        yupper <- x + (a * (1:n))/n
        ylower <- yupper - a/n
        cmtx <- cbind(cut(yupper, breaks = ybr), cut(yupper, 
            breaks = ybr, left.include = TRUE), cut(ylower, breaks = ybr), 
            cut(ylower, breaks = ybr, left.include = TRUE))
        cmtx[1, 3] <- cmtx[1, 4] <- 1
        cmtx[n, 1] <- cmtx[n, 2] <- nbins
        checksum <- (cmtx[, 1] + cmtx[, 2] + cmtx[, 3] + cmtx[, 
            4])\%\%4
        straddlers <- (1:n)[checksum == 2]
        if (length(straddlers) > 0) {
            counts <- table(c(1:nbins, cmtx[-straddlers, 1]))
        }
        else {
            counts <- table(c(1:nbins, cmtx[, 1]))
        }
        counts <- counts - 1
        if (length(straddlers) > 0) {
            for (i in straddlers) {
                binno <- cmtx[i, 1]
                theta <- ((yupper[i] - ybr[binno]) * n)/a
                counts[binno - 1] <- counts[binno - 1] + (1 - 
                  theta)
                counts[binno] <- counts[binno] + theta
            }
        }
        xbr <- ybr
        xbr[-1] <- ybr[-1] - (a * cumsum(counts))/n
        spike <- eps * diff(rx)/nbins
        flag.vec <- c(diff(xbr) < spike, F)
        if (sum(abs(diff(xbr)) <= spike) > 1) {
            xbr.new <- xbr
            counts.new <- counts
            diff.xbr <- abs(diff(xbr))
            amt.spike <- diff.xbr[length(diff.xbr)]
            for (i in rev(2:length(diff.xbr))) {
                if (diff.xbr[i - 1] <= spike & diff.xbr[i] <= 
                  spike & !is.na(diff.xbr[i])) {
                  amt.spike <- amt.spike + diff.xbr[i - 1]
                  counts.new[i - 1] <- counts.new[i - 1] + counts.new[i]
                  xbr.new[i] <- NA
                  counts.new[i] <- NA
                  flag.vec[i - 1] <- T
                }
                else amt.spike <- diff.xbr[i - 1]
            }
            flag.vec <- flag.vec[!is.na(xbr.new)]
            flag.vec <- flag.vec[-length(flag.vec)]
            counts <- counts.new[!is.na(counts.new)]
            xbr <- xbr.new[!is.na(xbr.new)]
        }
        else flag.vec <- flag.vec[-length(flag.vec)]
        widths <- abs(diff(xbr))
        heights <- counts/widths
    }
    bin.size <- length(x)/nbins
    cut.pt <- unique(c(min(x) - abs(min(x))/1000, approx(seq(length(x)), 
        x, (1:(nbins - 1)) * bin.size, rule = 2)$y, max(x)))
    aa <- hist(x, breaks = cut.pt, plot = FALSE, probability = TRUE)
    if (a == Inf) {
        heights <- aa$counts
        xbr <- aa$breaks
    }
    amt.height <- 3
    q75 <- quantile(heights, 0.75)
    if (sum(flag.vec) != 0) {
        amt <- max(heights[!flag.vec])
        ylim.height <- amt * amt.height
        ind.h <- flag.vec & heights > ylim.height
        flag.vec[heights < ylim.height * (amt.height - 1)/amt.height] <- F
        heights[ind.h] <- ylim.height
    }
    amt.txt <- 0
    end.y <- (-10000)
    if (plot) {
        barplot(heights, abs(diff(xbr)), space = 0, density = -1, 
            xlab = xlab, plot = TRUE, xaxt = "n", yaxt = "n")
        at <- pretty(xbr)
        axis(1, at = at - xbr[1], labels = as.character(at))
        if (lab.spikes) {
            if (sum(flag.vec) >= 1) {
                usr <- par("usr")
                for (i in seq(length(xbr) - 1)) {
                  if (!flag.vec[i]) {
                    amt.txt <- 0
                    if (xbr[i] - xbr[1] < end.y) 
                      amt.txt <- 1
                  }
                  else {
                    amt.txt <- amt.txt + 1
                    end.y <- xbr[i] - xbr[1] + 3 * par("cxy")[1]
                  }
                  if (flag.vec[i]) {
                    txt <- paste(" ", format(round(counts[i]/sum(counts) * 
                      100)), "\%", sep = "")
                    par(xpd = TRUE)
                    text(xbr[i + 1] - xbr[1], ylim.height - par("cxy")[2] * 
                      (amt.txt - 1), txt, adj = 0)
                  }
                }
            }
            else print("no spikes or more than one spike")
        }
        invisible(list(heights = heights, xbr = xbr))
    }
    else {
        return(list(heights = heights, xbr = xbr, counts = counts))
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
