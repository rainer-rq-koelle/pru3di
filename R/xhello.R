#' A friendly greeting for a person we know by name
#'
#' @param .name the name of the person we want to greet
#'
#' @return string comprising "Greeting + name provided
#' @export
#'
#' @examples
#' xhello("Stranger")
xhello <- function(.name){
  #stopifnot("Think about providing a name." = is.character(.name))
  assertthat::assert_that(is.character(.name), msg = paste("You have to provide a character vector. Your input:", .name))
  paste0("Greetings ", .name)
}
