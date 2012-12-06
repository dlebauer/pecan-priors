\name{write.ma.model}
\alias{write.ma.model}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
write.ma.model(modelfile, outfile, reg.model, pr.dist, pr.param.a, pr.param.b, n, trt.n, site.n, ghs.n, tauA, tauB)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{modelfile}{
%%     ~~Describe \code{modelfile} here~~
}
  \item{outfile}{
%%     ~~Describe \code{outfile} here~~
}
  \item{reg.model}{
%%     ~~Describe \code{reg.model} here~~
}
  \item{pr.dist}{
%%     ~~Describe \code{pr.dist} here~~
}
  \item{pr.param.a}{
%%     ~~Describe \code{pr.param.a} here~~
}
  \item{pr.param.b}{
%%     ~~Describe \code{pr.param.b} here~~
}
  \item{n}{
%%     ~~Describe \code{n} here~~
}
  \item{trt.n}{
%%     ~~Describe \code{trt.n} here~~
}
  \item{site.n}{
%%     ~~Describe \code{site.n} here~~
}
  \item{ghs.n}{
%%     ~~Describe \code{ghs.n} here~~
}
  \item{tauA}{
%%     ~~Describe \code{tauA} here~~
}
  \item{tauB}{
%%     ~~Describe \code{tauB} here~~
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
function (modelfile, outfile, reg.model, pr.dist, pr.param.a, 
    pr.param.b, n, trt.n, site.n, ghs.n, tauA, tauB) 
{
    model.text <- scan(file = modelfile, what = "character", 
        sep = "@")
    model.text <- gsub("\%_\%", "", model.text)
    model.text <- gsub("REGMODEL", reg.model, model.text)
    model.text <- gsub("PRIORDIST", paste("d", pr.dist, sep = ""), 
        model.text)
    model.text <- gsub("PRIORPARAMA", pr.param.a, model.text)
    model.text <- gsub("PRIORPARAMB", pr.param.b, model.text)
    model.text <- gsub("LENGTHK", n, model.text)
    model.text <- gsub("LENGTHJ", trt.n, model.text)
    model.text <- gsub("LENGTHG", site.n, model.text)
    model.text <- gsub("TAUA", format(signif(tauA, 2), scientific = FALSE), 
        model.text)
    model.text <- gsub("TAUB", format(signif(tauB, 2), scientific = FALSE), 
        model.text)
    if (ghs.n == 1) 
        model.text <- gsub("\\#GGG", "\\#", model.text)
    if (site.n == 1) 
        model.text <- gsub("\\#SSS", "\\#", model.text)
    if (trt.n == 1) 
        model.text <- gsub("\\#TTT", "\\#", model.text)
    if (ghs.n > 1) 
        model.text <- gsub("\\#GGG", "", model.text)
    if (site.n > 1) 
        model.text <- gsub("\\#SSS", "", model.text)
    if (trt.n > 1) 
        model.text <- gsub("\\#TTT", "", model.text)
    if (pr.dist == "beta" & pr.param.b < 1) {
        model.text <- gsub("\\#BBB", "T(,0.9999)", model.text)
    }
    writeLines(model.text, con = outfile)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
