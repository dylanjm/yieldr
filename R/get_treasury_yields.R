#' @title Fetch Treasury Yield Data
#' @description Returns data in either tidy or time-series format
#' @param from A character vector containing a starting date of desired rates. Defaults to \code{"1990-01-01"} (the beginning of the data).
#' @param to A character vector containing an ending date of desired rates. Defaults to \code{\link[Sys.time]{Sys.Date}}
#' @param tidy A boolean value to determine if the tibble should be returned wide (time-series) or long (tidy) depending on the preferences of the user. Defaults to \code{FALSE}.
#' @return A tibble containing datetime and numeric values
#' @importFrom stats setNames
#' @import dplyr
#' @import rvest
#' @import xml2
#' @export get_treasury_yields
#' @examples
#' \donttest{dat <- get_treasury_yields(from = "2017-01-01", to = "2018-01-01")}
#'
#' \donttest{dat <- get_treasury_yields(tidy = TRUE)}
get_treasury_yields <- function(from = "1990-01-01", to = Sys.Date(), tidy = FALSE){

  # This is currently the URL where the data resides
  yield_xml <- read_xml("https://data.treasury.gov/feed.svc/DailyTreasuryYieldCurveRateData")

  # This is where all the data in the XML resides.
  # We'll use this prefix several times, so we'll assign it.
  # Potential Future Breakpoint - incase default XML namespace changes
  # from "d1" to something else, the "d1" in the xpath is important here!
  xml_content <- xml_nodes(yield_xml, xpath = "//d1:entry/d1:content/m:properties")

  # Gives us column names - Potential Future Breakpoint
  dat_names <- xml_name(xml_children(xml_content[[1]]))

  # Gives us matrix dim for constructing tibble
  dat_cols <- length(dat_names)

  # This section actually delivers us the data in useable format
  # although it's not pretty
  raw_dat <- xml_content %>%
    xml_contents() %>%
    xml_text() %>%
    matrix(ncol = dat_cols, byrow = T) %>%
    tibble::as_tibble() %>%
    setNames(dat_names)

  # Make the data pretty and correct the data types across the board
  # Potetntial Break Point - if column names ever change to not use "BC"
  clean_yield_data <- raw_dat %>%
    mutate(NEW_DATE = lubridate::date(NEW_DATE)) %>%
    mutate_at(vars(matches("BC")), as.numeric) %>%
    arrange(NEW_DATE) %>%
    select(-Id) %>%
    mutate(ID = 1:nrow(.)) %>%
    select(ID, everything()) %>%
    filter(between(NEW_DATE, lubridate::as_date(from),
                   lubridate::as_date(to)))

  # If user wants the data in tidy, we'll give it to them.
  if(tidy){
    clean_yield_data <- clean_yield_data %>%
      tidyr::gather(key = "duration", value = "rate", 3:15) %>%
      arrange(NEW_DATE)
  }

  return(clean_yield_data)
}

