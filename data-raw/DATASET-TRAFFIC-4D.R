## code to prepare `TRAFFIC-4D-EIDW-EGLL` dataset goes here

# used the data Quinten extracted with the traffic library from OSN.
# data is subset to 4D positions.
# files are stored as rda and pushed to this folder

# read the data
load(file = "./data-raw/x-eidw-egll-4D.rda")   # stored with object name rqq
load(file = "./data-raw/x-essa-ekch-4D.rda")   # stored as fbb

# some helper functions
reverse_names <- function(.trafficlib){
  .trafficlib |>
    dplyr::rename(
        callsign = FLTID
      , icao24   = ICAO24
      , timestamp = TIME
      , altitude = ALT
      , latitude = LAT
      , longitude = LON
      )
}

downsample_traffic <- function(.onesecds_with_leg_seqid, .freq = 5){
  .onesecds_with_leg_seqid |>
    dplyr::group_by(ICAO24, LEG) |>
    dplyr::mutate(CHECK = SEQ_ID %% .freq)

}

# with helper - prepare dataset

prep_sample <- function(.rqq){
  .rqq |>
  dplyr::group_by(ICAO24, TIME) |>
  dplyr::arrange(TIME, .by_group = TRUE) |>
  identify_trajectory_legs() |>
  downsample_traffic() |>
  dplyr::ungroup() |>
  dplyr::filter(TIME %in% c(min(TIME), max(TIME)) | CHECK == 0) |>
  dplyr::select(FLTID:LON) |> dplyr::select(-FL)
}


eidw_egll <- rqq |> prep_sample() |> reverse_names()
essa_ekch <- fbb |> prep_sample() |> reverse_names()

# make available in package
usethis::use_data(eidw_egll, overwrite = TRUE)
usethis::use_data(essa_ekch, overwrite = TRUE)
