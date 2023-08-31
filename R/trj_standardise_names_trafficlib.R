#' Standardise trajectory state vectors from traffic library.
#'
#' Ensure consistent naming conventions and data types
#'
#' @param .svs_tfclib tibble with state vectors for flights
#'
#' @return standard named tibble
#'
#' @importFrom rlang .data
#' @export
#'
#' @examples
#' \dontrun{
#' state_vector_sample |> standardise_traj_from_trafficlib()
#' }
standardise_traj_from_trafficlib <- function(.svs_tfclib){
  .svs_tfclib |>
  dplyr::rename(
      FLTID  = .data$callsign
    , ICAO24 = .data$icao24
    , TIME   = .data$timestamp
    , ALT    = .data$altitude
    , LAT    = .data$latitude
    , LON    = .data$longitude) |>
    dplyr::mutate(FL = (.data$ALT / 100) |> round(digits = 2) )
}
