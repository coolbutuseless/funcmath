


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Render a single expression
#
# @param e the expression to render
# @param cex size of the rendered text
#
# @importFrom graphics plot text
# @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
mplot <- function(e, cex=5, xlim=c(0, 1), ylim=c(0, 1), ...) {
  plot(0, type='n', ann = FALSE, axes = FALSE, xlim=xlim, ylim=ylim)
  text(x=0.5, y=0.5, labels=e, cex=cex, ...)
  invisible()
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
    exps <- Reduce(function(x, y) bquote(.(x) ~ .(y)), exps[-1], init=exps[[1]])
  } else if (sep == '') {
    exps <- Reduce(function(x, y) bquote(.(x) * .(y)), exps[-1], init=exps[[1]])
  } else if (sep == ',') {
    exps <- Reduce(function(x, y) bquote(list(.(x), .(y))), exps[-1], init=exps[[1]])
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
    gsub('\\"', '', rlang::expr_deparse(e, width=1000))
  }


}



