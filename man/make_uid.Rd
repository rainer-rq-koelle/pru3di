% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/trj_make_uid.R
\name{make_uid}
\alias{make_uid}
\title{assign an UID for the study by attributing ICAO24 and LEG}
\usage{
make_uid(.trjs_with_legs)
}
\arguments{
\item{.trjs_with_legs}{state vector tibble with LEG identification}
}
\value{
tibble of trajectory points appended with UID and commentary for trouble shooting.
}
\description{
The difference between successive trajectory points is given. ==> identify legs.
It is assumed that the variable LEG is included.
}
\examples{
\dontrun{legged_svs |> make_uid()
}
}
