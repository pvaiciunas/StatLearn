
# Load the initial data you'll be using for all of the work.

# This may change in the future to add complexity, but for the time being
# will keep it pretty simple. Will download 10 variabels, including both 
# categorical and numerical. These will be general economic variabels.
# Will use some type of market regime as the response (o/p of one AC vs another,
# or something similar). The ending bit of this section will have a dataframe
# with the data that will be used by all the experimentation in future scripts
# 
# The goal of the initial data is to have variabels that have monthly periodicity,
# have a long history, are considered either concurrent or leading indicators,
# And cover variosu aspects of the economy (cosumption, employment, housing,
# Financial Markets, Manufacturing)
# 
# Transformation will also be made to the data that are consistnet with the
# CFNAI approach. The transformation are in parentheses after each series
# following the data descriptions below
# 


library(quantmod)

# Download data from FRED
# UNRATE: US Civilian Unemployment Rate (DLV)
# NOCDFSA066MSFRBPHI: Current New Orders, Philly Fed Index (LV)
# T10Y2Y: SLope of the yield curve (LV)
# FEDFUNDS: Effective Fed Funds Rate. This will be categorical (Hiking, flat or 
#   easing)
# PAYEMS: Total Nonfarm Payrolls (DLN)
# INDPRO: Industrial Production (DLN)
# DSPIC96: Real Disposable Income, billions 2012 dollars (DLN)
# AWHMAN: Average weekly hours of prod and nonsuper positions, Manufacturing (DLV)
# HOUST: Housing Starts (LN)
# PERMIT: Building Permits (LN)
# DPCCRC1M027SBEA: Core PCE (not inflation) (DLN)
# BUSLOANS: Commercial and Industiral loans (not CFNAI based, but still DLV or DLN)
# BAA10YM: Baa-10Y Spread (goes back further than HY indices) (not CFNAi, but LV)



# Choose and Load Independent Variables -----------------------------------

# These are all coming from FRED right now using quantmod
FRED_symbols <- c("UNRATE", 
  "NOCDFSA066MSFRBPHI",
  "T10Y2Y",
  "FEDFUNDS",
  "PAYEMS",
  "INDPRO",
  "DSPIC96",
  "AWHMAN",
  "HOUST",
  "PERMIT",
  "DPCCRC1M027SBEA",
  "BUSLOANS",
  "BAA10YM")
FRED_names <- c("u_rate", 
                "philly_new_orders",
                "slope_10_2",
                "fed_funds",
                "payrolls",
                "industrial_prod",
                "income",
                "avg_wkly_hours",
                "housing_Starts",
                "housing_permits",
                "core_pc_exp",
                "businesS_loans",
                "baa_spread")



# Quantmod is all about creating the variabels in the environmnet
getSymbols(FRED_symbols, src = "FRED", from = "1900-01-01")

# US recession indicator as determined by the NBER, 1 or 0
# Not using here, but could be useful
#recession_indicator <- "USREC"


# Download S&P 500 data
getSymbols("^GSPC", from="1900-01-01")

# Download Bond Index Data
# Currently this is the BAML total corp bond index return, whihc is the longest
# publicly avilable bond index series I could find. A new source, and one
# concentrated on treasuries would be much better
getSymbols("BAMLCC0A0CMTRIV", src = "FRED", from = "1900-01-01")
