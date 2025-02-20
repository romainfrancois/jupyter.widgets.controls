#' @import hera
#' @import jsonlite
#' @import R6
NULL

.onLoad <- function(libname, pkgname) {
  # ultimately this should go to a jupyter.widget package
  if (is_xeusr()) {
    CommManager$register_comm_target("jupyter.widget", handler_jupyter.widget)
  }
}
