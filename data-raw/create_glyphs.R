

suppressPackageStartupMessages({
  library(devtools)
  library(purrr)
  library(dplyr)
})


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Create all the glyphs and store them in a list called 'g'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
capitalize <- function(x) {gsub('^(.)', '\\U\\1', x, perl=TRUE)}

greek_         <- c('alpha', 'beta', 'gamma', 'delta', 'epsilon', 'zeta', 'eta', 'theta',
                    'iota', 'kappa', 'lambda', 'mu', 'nu', 'xi', 'omicron', 'pi', 'rho',
                    'sigma', 'tau', 'upsilon', 'phi', 'chi', 'psi', 'omega')
greek_         <- c(greek_, capitalize(greek_))
cursive_greek_ <- c('theta1', 'phi1', 'sigma1', 'omega1')
misc_          <- c('Upsilon1', 'aleph', 'infinity', 'partialdiff', 'nabla')
ellipses       <- c('cdots', 'ldots')
angles         <- c('degree', 'minute', 'second')

g <- c(greek_, cursive_greek_, misc_, ellipses, angles)
g <- setNames(g, g)
g <- g %>% purrr::map(~as.name(.x))

# manual
g$ellipsis <- as.name('...')
g$ellipses <- as.name('...')

g$degrees  <- as.name('degree')
g$minutes  <- as.name('minute')
g$seconds  <- as.name('second')

# devtools::use_data(g, internal=FALSE, overwrite=TRUE)


sink("./R/symbols.R")
for (i in seq_along(g)) {
  m <- sprintf("%-12s <- as.name('%s')", names(g)[i], as.character(g[[i]]))
  cat(m, "\n")
}
sink()


for (n in names(g)) {
  cat("\\alias{", n, "}\n", sep='')
}

for (n in names(g)) {
  cat(sprintf("  %-23s,", n), "\n")
}
