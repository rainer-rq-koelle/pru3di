#' assign an UID for the study by attributing ICAO24 and LEG
#'
#' The difference between successive trajectory points is given. ==> identify legs.
#' It is assumed that the variable LEG is included.
#'
#'
#' @param .trjs_with_legs state vector tibble with LEG identification
#'
#' @return tibble of trajectory points appended with UID and commentary for trouble shooting.
#' @export
#'
#' @examples
#' \dontrun{legged_svs |> make_uid()
#' }
make_uid <- function(.trjs_with_legs){
  my_trjs <- .trjs_with_legs |>
    dplyr::group_by(.data$ICAO24, .data$LEG) |>
    dplyr::mutate(
      UID = paste( .data$ICAO24
                   # assign DOF to min(TIME)
                   , min(lubridate::date(.data$TIME)) |> format(format = "%Y%m%d")
                   , .data$LEG
                   , .data$FLTID      # TODO ... handle missing/weird/multiple FLTIDs
                   , sep = "-")
      # add commentary in case we have several FLTIDs
      ,COM_UID = paste(unique(.data$FLTID), collapse = ", ")
    ) |>
    dplyr::ungroup() |>
    dplyr::select(.data$UID, dplyr::everything())
  return(my_trjs)
}
