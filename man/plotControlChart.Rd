\docType{methods}
\name{plotControlChart}
\alias{plotControlChart}
\alias{plotControlChart,Appac,character,character,numeric,list-method}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Plot the raw and fitted area vs. time of a peak of a sample
}
\description{
The control chart is a plot of the raw and the fitted (pressure corrected and 
drift compensated) areas vs. time. It is a variant of a Shewart control chart.
}
\usage{
\S4method{plotControlChart}{Appac,character,character,numeric,list}(object, sample, peak, size, colors)
}
\arguments{
  \item{object}{
an object of class \code{\link{Appac}}
}
  \item{sample}{
a character value representing the name of the sample
}
  \item{peak}{
a character value representing the name of the peak
}
  \item{size}{
a numeric value which controls the size of the axis labels and titles
}
  \item{colors}{
    a list containing the colors of the color scheme to be used in the plot:
    \describe{
%      \itemize{
        \item{highlight_color:}{the color in which the datapoints of the
        corrected areas are represented}
        \item{lowlight_color:}{the color in which the datapoints of the raw
        areas are represented}
        \item{line_color:}{the color of the fitted function line}
        \item{fill_color:}{the color in which the standard uncertainties of the
        fitted function line are plotted}
%      }
    }
  }
}
\value{
a ggplot object
}

\seealso{
\code{\link{plotLocalFit}}
}
\examples{
## Please be patient, the calculation takes a while.

## Not run:
library(appac)

data("PGC_TCD")

## define P.ref as the median of the measured ambient pressures at injection time
## data set contains some NA, because of missing peaks
P.ref <- median(PGC_TCD$air.pressure, na.rm = TRUE)

## define the column names of the dataset
appac.colnames <- list(
  sample.col    = "sample.name",
  peak.col      = "peak.name",
  date.col      = "injection.date",
  pressure.col  = "air.pressure",
  area.col      = "raw.area"
)

appac.control <- list(min.data.points = 5, drift.model = "linear")

## appac will throw warnings that sample and peak names have been changed
x <- appac(data = PGC_TCD, 
           P.ref = P.ref, 
           appac.control = appac.control, 
           appac.colnames = appac.colnames)

## View results
s <- "X17k"          
p <- "iso.Butan"
colors <- list(highlight_color="black", lowlight_color="darkgrey", 
               line_color="darkblue", fill_color="lightblue")

plotControlChart ( object = x, sample = s, peak = p, size = 4, colors = colors)
}

\keyword{plots}