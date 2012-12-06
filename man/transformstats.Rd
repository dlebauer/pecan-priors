\name{transformstats}
\alias{transformstats}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
transformstats(data)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
%%     ~~Describe \code{data} here~~
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
function (data) 
{
    if (!"SE" \%in\% levels(data$statname)) {
        data$statname <- factor(data$statname, levels = c(levels(data$statname), 
            "SE"))
    }
    if (max(c("SD", "sd") \%in\% data$statname)) {
        sdi <- which(data$statname \%in\% c("SD", "sd"))
        data$stat[sdi] <- data$stat[sdi]/sqrt(data$n[sdi])
        data$statname[sdi] <- "SE"
    }
    if ("MSE" \%in\% data$statname) {
        msei <- which(data$statname == "MSE")
        data$stat[msei] <- sqrt(data$stat[msei]/data$n[msei])
        data$statname[msei] <- "SE"
    }
    if ("95\%CI" \%in\% data$statname) {
        cii <- which(data$statname == "95\%CI")
        data$stat[cii] <- data$stat[cii]/qt(0.975, data$n[cii])
        data$statname[cii] <- "SE"
    }
    if ("LSD" \%in\% data$statname) {
        lsdi <- which(data$statname == "LSD")
        data$stat[lsdi] <- data$stat[lsdi]/(qt(0.975, data$n[lsdi]) * 
            sqrt((2 * data$n[lsdi])))
        data$statname[lsdi] <- "SE"
    }
    if ("HSD" \%in\% data$statname) {
        hsdi <- which(data$statname == "HSD")
        n = data$n[hsdi]
        n[is.na(n)] = 2
        data$stat[hsdi] <- data$stat[hsdi]/(qtukey(0.975, n, 
            df = 2))
        data$statname[hsdi] <- "SE"
        data$n[hsdi] <- n
    }
    if ("MSD" \%in\% data$statname) {
        msdi <- which(data$statname == "MSD")
        data$stat[msdi] <- data$stat[msdi] * data$n[msdi]/(qt(0.975, 
            2 * data$n[msdi] - 2) * sqrt(2))
        data$statname[msdi] <- "SE"
    }
    if (FALSE \%in\% c("SE", "none") \%in\% data$statname) {
        print(paste(trait, ": ERROR!!! data contains untransformed statistics"))
    }
    return(data)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
