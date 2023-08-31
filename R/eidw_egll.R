#' 4D state vectors for flights between EIDW-EGLL
#'
#' A subset of the data extracted for a period in 2023 from OSN using the
#' traffic-library. These data were subset to FLTID & 4D.
#'
#' @format ## `traffic state vector`
#' A data frame with 655693 rows and 6 columns:
#' \describe{
#'   \item{callsign}{flight identification}
#'   \item{icao24}{ModeS airframe address}
#'   \item{timestamp}{date time of position report}
#'   \item{altitude}{reported altitude in ft (traffic lib converts m to ft)}
#'   \item{latitude}{latitude of pasition}
#'   \item{longitude}{longitude of position}
#' }
#' @source PRU internal dataset, http unknown
"eidw_egll"
