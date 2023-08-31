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
  paste0("Greetings ", .name)
}
