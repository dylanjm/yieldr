% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_treasury_yields.R
\name{get_treasury_yields}
\alias{get_treasury_yields}
\title{Fetch Treasury Yield Data}
\usage{
get_treasury_yields(from = "1990-01-01", to = base::Sys.Date(),
  tidy = FALSE)
}
\arguments{
\item{from}{A character vector containing a starting date of desired rates. Defaults to \code{"1990-01-01"} (the beginning of the data).}

\item{to}{A character vector containing an ending date of desired rates. Defaults to \code{\link[Sys.time]{Sys.Date}}}

\item{tidy}{A boolean value to determine if the tibble should be returned wide (time-series) or long (tidy) depending on the preferences of the user. Defaults to \code{FALSE}.}
}
\value{
A tibble containing datetime and numeric values
}
\description{
Returns data in either tidy or time-series format
}
\examples{
\donttest{dat <- get_treasury_yields(from = "2017-01-01", to = "2018-01-01")}

\donttest{dat <- get_treasury_yields(tidy = TRUE)}
}
