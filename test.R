#testing functions

library(devtools)
library(fs)
library(tidyverse)
library(testthat)
library(roxygen2)
library(knitr)


#use_r("function name") to create a new .r for new function

#use_test() to create matching test file

#make sure to create documentation file

#load_all() to simulate package installation

#document() to create documentation for the new function

#use_readme_rmd() (this is for the whole pacakge)
#build_readme() is the best way to render the readme_rmd


#use_package("ggplot2", type = "Imports")
#use_package("tidyverse", type = "Imports")
#use_package("janitor", type = "Imports")
#use_package("lubridate", type = "Imports")

#add logo?

#use_logo("./ratlogo.png")

#usethis::use_logo("./ratlogo.png", geometry = "240x278", retina = TRUE)

#usethis::use_data(jj_data)

#usethis::use_data()
