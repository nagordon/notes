
# packages to install to run DOE in R

install.packages("DoE.base")
install.packages("FrF2")
install.packages("DoE.wrapper")
install.packages("RcmdrPlugin.DoE")
install.packages("RcmdrPlugin.Export") # Graphically export objects to LaTeX or HTML
install.packages("RcmdrPlugin.FactoMineR") # Graphical User Interface for FactoMineR
install.packages("RcmdrPlugin.HH") # Rcmdr support for the HH package
install.packages("RcmdrPlugin.IPSUR") # Introduction to Probability and Statistics Using R
install.packages("RcmdrPlugin.SurvivalT") # Rcmdr Survival Plug-In
install.packages("RcmdrPlugin.TeachingDemos") # Rcmdr Teaching Demos Plug-In
install.packages("RcmdrPlugin.epack") # Rcmdr plugin for time series
install.packages("RcmdrPlugin.orloca") # orloca Rcmdr Plug-in 
install.packages("Rcmdr") # at the R prompt
install.packages("conf.design")
install.packages("lhs")
install.packages("AlgDesign")
install.packages("DiceDesign")
install.packages("rsm")

# to launch R Commander without DOE Design, run this. The first time this is launched, 
#   it will likely require some packages to be installed
library(Rcmdr) 

## launches Rcmdr with DOE. Ensure this is the first imported library
library(RcmdrPlugin.DoE)
# or 
require(RcmdrPlugin.DoE)

