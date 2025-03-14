#' @import hera
#' @import jsonlite
#' @import R6
#' @import glue
#' @import assertthat
#' @importFrom purrr map_chr walk
#' @importFrom rlang current_env check_dots_empty caller_env arg_match is_true list2
#' @importFrom fontawesome fa_metadata
#' @importFrom cli cli_abort
NULL

namedlist <- function() {
  `names<-`(list(), character())
}

.onLoad <- function(libname, pkgname) {
  # ultimately this should go to a jupyter.widget package
  if (is_xeusr()) {
    CommManager$register_comm_target("jupyter.widget", handler_jupyter.widget)
  }
}
