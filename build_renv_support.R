# This script will setup an project library with required packages from scratch
# particularly in settings where you are having a hard time either pulling a
# copy of the github repo, or getting it to rebuild the packages library.

# Run this script from a new session in R and inside RStudio in a project!

# Install our common packages and check that we are inside a project, abort if not
if (!require("rstudioapi")) install.packages("rstudioapi")
if(is.null(rstudioapi::getActiveProject())) {
  stop("This script should be run in a RStudio Project - please create a new project first!")
}

install.packages("renv")

# Create a renv environment
print("Creating renv environment")
renv::init(bare = T, force = T, restart = F)

# Install our core packages and dependencies
renv::install(packages = c("tidyverse", 
                           "RPostgres", "RMariaDB", 
                           "rmarkdown", "keyring",
                           "ggwordcloud",
                           "RStudio/Connections"),
              prompt = F)

# Snapshot and we are done!
renv::snapshot()
