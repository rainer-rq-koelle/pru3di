#' Identify legs / gaps in a trajectory
#'
#' Label legs (segments) of a trajectory (time ordered sequence of ICAO24
#' addresses). Add a colum to identify the leg.
#'
#' @param .trjs tibble/dataframe of state vectors (flight identification and 4D)
#' @param .grp_var variable in .trjs used to separate/group flights, defaults to ICAO24
#' @param .max_gap in minutes; defaults to 3 minutes (e.g. low approach)
#'
#' @return augmented state vector tibble
#'
#' @importFrom rlang .data .env
#' @export
#'
#' @examples
#' \dontrun{
#' state_vectors |> identify_trajectory_legs()
#' }
identify_trajectory_legs <- function(.trjs, .grp_var=.env$ICAO24, .max_gap=3){
  df <- .trjs |>
    dplyr::group_by({{.grp_var}}) |>
    dplyr::arrange(.data$TIME, .by_group = TRUE) |>
    dplyr::mutate(
        .data$SEQ_ID := dplyr::row_number()
      , .data$STEP   := difftime(.data$TIME, dplyr::lag(.data$TIME, default = dplyr::first(.data$TIME)), units = "sec")
      #-- add grouping for trajectory segments
      ,  .data$LEG := cumsum( .data$STEP >= .max_gap * 60)    ) |>
    dplyr::ungroup()
  return(df)
}
