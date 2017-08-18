# List the package and version as below
dependencies <- read.csv(textConnection("
  Package,     Min.Version
  dplyr,       0.5.0
  raster,      2.5.8
  ggplot2,     2.0.1
  "), stringsAsFactors = FALSE, strip.white = TRUE)

## No changes necessary below. ##

# Import installed package versions
pkgs <- installed.packages()
rownames(pkgs) <- c()
pkgs <- data.frame(pkgs, stringsAsFactors = FALSE)

# Compare requirements to installed packages
pkgs <- merge(dependencies, pkgs, by="Package", all.x=TRUE)

# Filter out packages meeting minimum version requirement
pkgs <- pkgs[mapply(compareVersion, pkgs$Min.Version, pkgs$Version) > 0, ]

# Install missing and newer packages
lapply(pkgs$Package, install.packages, repos="http://cran.us.r-project.org")

# Require dependencies [optional]
lapply(dependencies$Package, require, character.only=TRUE)
