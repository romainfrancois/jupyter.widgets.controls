jupyter.widget.DOMWidget <- R6Class("jupyter.widget.DOMWidget",
  inherit = jupyter.widget.CoreWidget,

  public = list(
    initialize = function(layout = Layout(), style = NULL, tabbable = NULL, tooltip = "", ..., comm_description = "", error_call = caller_env()) {
      private$layout_ <- layout
      private$style_  <- style

      private$state_ <- update_list(private$state_,
        tabbable = tabbable,
        tooltip  = ensure(tooltip, null_or(is.string)),
        layout   = glue("IPY_MODEL_{layout$comm$id}"),
        style    = glue("IPY_MODEL_{style$comm$id}")
      )

      super$initialize(
        ...,
        comm_description = comm_description,
        error_call = error_call
      )
    }
  ),

  active = list(
    layout = function() layout_,
    style  = function() style_,

    tabbable = read_only_state("tabbable"),
    tooltip = read_only_state("tooltip")
  ),

  private = list(
    layout_ = NULL,
    style_  = NULL
  )
)
