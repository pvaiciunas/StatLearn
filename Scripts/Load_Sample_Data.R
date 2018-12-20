
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
library(dplyr)
source("Scripts/Functions.R")


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

# To add a new variable, add it to the FRED_symbols table
# Currently using the read.table function. It sucks, but it helps organize
# the data in a row-wise fashion better than a straight dataframe does.
# Ends up being a bit messy, but you can add data easier, and see what's already
# there much easier this way:
FRED_symbols <- read.table(col.names = c("Code","Name","Transform"),
                           text = 
"UNRATE             u_rate            DLV
NOCDFSA066MSFRBPHI  philly_new_orders LV
T10Y2Y              slope_10_2        LV
FEDFUNDS            fed_funds         Factor
PAYEMS              payrolls          DLN
INDPRO              industrial_prod   DLN 
DSPIC96             income            DLN 
AWHMAN              avg_wkly_hours    DLV
HOUST               housing_starts    LN 
PERMIT              housing_permits   LN
DPCCRC1M027SBEA     core_pc_exp       DLN     
BUSLOANS            business_loans    DLV
BAA10YM             baa_spread        LV",
stringsAsFactors = FALSE)





# Quantmod is all about creating the variabels in the environmnet.
# So will load in a loop to get it into a table automatically
rawdata <- data.frame(value = NA, date = NA, symbol = NA)

for (i in FRED_symbols[,1]) {
  temp <- getSymbols(i, src = "FRED", from = "1900-01-01", auto.assign = FALSE)
  temp <- xts_to_df(temp)
  rawdata <- bind_rows(rawdata, temp)
}
rawdata <- rawdata[-1,]


# US recession indicator as determined by the NBER, 1 or 0
# Not using here, but could be useful
#recession_indicator <- "USREC"



# Response Variable ------------------------------------------------------

# This is still up for debate. At this point (PV: 12.19.2018), we'll use a 
# simple stock/bond relative performance target. Will def want to improve or 
# change in the future

# Download S&P 500 data
sp_500 <- getSymbols("^GSPC", from="1900-01-01", auto.assign = FALSE)
sp_500 <- sp_500[,6]
names(sp_500) <- "sp_500"

# Download Bond Index Data
# Currently this is the BAML total corp bond index return, whihc is the longest
# publicly avilable bond index series I could find. A new source, and one
# concentrated on treasuries would be much better
corp_bond <- getSymbols("BAMLCC0A0CMTRIV", src = "FRED", from = "1900-01-01", auto.assign = FALSE)
names(corp_bond) <- "corp_bonds"
