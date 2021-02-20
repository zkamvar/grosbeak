#' Nest flat data given a template. 
#'
#' @param x a character vector of data that matches keys in a template
#' @param template a nested list with keys corresponding to matching data
#' @param prefix a prefix to add to the template keys to match the data in x
#'
#' @return the template filled with the matching keys in x
#' @export
#' @details This is a toy implementation of Nested Template Data:
#' <https://rosettacode.org/wiki/Nested_templated_data#R>
#'
#' @examples
#' if (requireNamespace("jsonlite")) {
#'   # You can use JSON data
#'   template <- jsonlite::read_json(system.file("extdata", "template1.json", package = "grosbeak"))
#' } else {
#'   template <- list(list(c(1, 2), c(3, 4), 5))
#' }
#' payload  <- paste0("Payload#", 0:6)
#' make_nest(payload, template, prefix = "Payload#") 
make_nest <- function(x, template, prefix = "") {
  stopifnot(
    "x must be a character vector" = (length(x) && is.character(x)),
    "template must be a list" = (is.list(template))
  )
  fill_template(x, template, prefix)

}

fill_template <- function(x, template, prefix = "Payload#") {
  for (i in seq_along(template)) {
    temp_slice <- template[[i]]
    if (is.list(temp_slice)) {
      template[[i]] <- fill_template(x, temp_slice, prefix)
    } else {
      temp_slice <- paste0(prefix, temp_slice)
      template[[i]] <- x[match(temp_slice, x)]
    }
  }
  return(template)
}

