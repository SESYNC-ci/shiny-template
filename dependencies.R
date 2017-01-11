requirements <- c('shiny',
                  'datasets')

missing <- setdiff(requirements, rownames(installed.packages()))
if (length(missing) != 0) {
  install.packages(missing, repos="http://cran.us.r-project.org")
}

lapply(requirements, require, character.only=TRUE)
