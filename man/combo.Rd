% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{combo}
\alias{combo}
\title{combo}
\usage{
combo(LL, LR, UR, UL)
}
\description{
combo
}
\examples{

x = data.table(
 LL = c('W,R', 'Y,DB', NA, 'NOBA', NA), 
 LR = c('Y', 'DB', 'c', NA, NA),
 UR = c('Y', 'W', 'G',  'R', NA)

)

x[,combo(LL, LR), by = .I ]
x[,combo(LL, LR, UR), by = .I ]



}
