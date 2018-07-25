


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Plot a single expresion
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
plot.expression <- function (x, ...)  {
  oldpar <- par(no.readonly = TRUE)
  on.exit(suppressWarnings(par(oldpar)))
  par(mar = c(0, 0, 0, 0))
  plot(0, 0, type = "n", axes = FALSE, ann=FALSE)
  text(0, 0, x, ...)
  invisible()
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname plot.expression
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
plot.call <- plot.expression



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname plot.expression
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
plot.character <- function(x, ...) {
  plot.expression(parse(text=x), ...)
}



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Combine multiple expressions into a single expression
#
# @param ... multiple text, expressions or calls created with bquote()
# @param sep separator. Default ' ', separated with a space. Use '' to use
#            juxtapose, use ',' fo do as a list
#
# @return the given expressions combined into a single expression
#
# @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
combine_expressions <- function(..., sep=" ") {
  exps <- list(...)
  exps <- lapply(exps, function(x) {if (is.expression(x)) {as.call(x)[[1]]} else {x}})
  if (sep == ' ') {
    exps <- Reduce(function(x, y) bquote({.(x)} ~ {.(y)}), exps[-1], init=exps[[1]])
  } else if (sep == '') {
    exps <- Reduce(function(x, y) bquote({.(x)} * {.(y)}), exps[-1], init=exps[[1]])
  } else if (sep == ',') {
    exps <- Reduce(function(x, y) bquote(list({.(x)}, {.(y)})), exps[-1], init=exps[[1]])
  }
  exps
}



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Create a parseable string from a funcmath created expression. A complete hack.
#
# @param e plotmath expression or list of expressions
#
# @return parseable string
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
as_parseable_string <- function(e) {
  if (is.list(e)) {
    vapply(e, as_parseable_string, character(1))
  } else {
    # Usually text in bquote() expression is interpreted as 'name' objects,
    # but because I pass text arguments in as character, they remain as character.
    # Unfortunately, this means that they're surrounded by double-quotes when
    # deparsed. So I'm just going to hack around it with a gsub
    x <- deparse(e, width.cutoff = 500)
    x <- paste(x, collapse="")
    x <- gsub('\\"', '', x)
    x <- gsub('\\s+','', x)
    x
  }


}



