\name{summarize.result}
\alias{summarize.result}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
summarize.result(result)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{result}{
%%     ~~Describe \code{result} here~~
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
function (result) 
{
    ans1 <- ddply(result[result$n == 1, ], .(citation_id, site_id, 
        trt_id, control, greenhouse, date, time, cultivar_id, 
        specie_id), summarise, n = length(n), mean = mean(mean), 
        statname = ifelse(length(n) == 1, "none", "SE"), stat = sd(mean)/sqrt(length(n)))
    ans2 <- result[result$n != 1, which(colnames(result) \%in\% 
        colnames(ans1))]
    return(rbind(ans1, ans2))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
