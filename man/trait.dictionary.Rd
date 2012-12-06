\name{trait.dictionary}
\alias{trait.dictionary}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
trait.dictionary(traits = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{traits}{
%%     ~~Describe \code{traits} here~~
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
function (traits = NULL) 
{
    defs <- data.frame(id = c("plant_min_temp", "c2n_leaf", "dark_respiration_factor", 
        "f_labile", "growth_resp_factor", "leaf_turnover_rate", 
        "leaf_width", "mort2", "nonlocal_dispersal", "fineroot2leaf", 
        "quantum_efficiency", "root_respiration_rate", "root_turnover_rate", 
        "SLA", "stomatal_slope", "Vcmax", "Vm_low_temp", "water_conductance", 
        "cuticular_cond", "seedling_mortality", "r_fract", "storage_turnover_rate", 
        "T", "agf_bs"), figid = c("Plant Minimum Temperature", 
        "Leaf C:N", "Dark Respiration Rate", "Litter\% Labile C", 
        "Growth Respiration", "Leaf Turnover Rate", "Leaf Width", 
        "Mortality Coefficient", "Seed Dispersal", "Fine Root Allocation", 
        "Quantum Efficiency", "Root Respiration Rate", "Root Turnover Rate", 
        "Specific Leaf Area", "Stomatal Slope", "Vcmax", "Photosynthesis min temp", 
        "Water Conductance", "Cuticular Conductance", "Seedling Mortality", 
        "Reproductive Allocation", "Storage Turnover Rate", "Transpiration", 
        "Abovground fraction of structural biomass"), units = c("Celsius", 
        "ratio", "fraction", "fraction", "fraction", "yr-1", 
        "mm", "dimensionless", "fraction", "ratio", "fraction", 
        "umol CO2 kg-1 s-1", "yr-1", "m2 kg-1", "ratio", "umol CO2 m-2 s-1", 
        "Celsius", "mm", "umol H2O m-2 s-1", "fraction", "fraction", 
        "yr-1", "mm  H2O m-1s-1", "fraction"))
    if (is.null(traits)) {
        trait.defs <- defs
    }
    else {
        trait.defs <- defs[match(traits, defs$id), ]
    }
    return(trait.defs)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
