library(dplyr)
source("Scripts/Functions.R")


# Combine all the data ----------------------------------------------------

# First step is to combine all the data into a single dataframe and make it tidy
# Initialize the dataframe with the first symbol
tdata <- xts_to_df(get(FRED_symbols[1,1]))
names(tdata) <- c("temp","date")

# Create the rest
for(i in FRED_symbols[,1]) {
  tdata <- merge(tdata, xts_to_df(get(i)))
}
#### PROBLEM HERE. tdata should be the fully loaded datafrmae, but is returning with
#### 0 rwos :(


# Transform and Lag the Independent Variables -------------------------------------

# HEre we are transforming numerical variabels to coincide with CFNAI convention
# or something related if it's not used in their model. Categorical variables 
# will be changed into one-hot encodings.
# 
# The 5 transformations are:
#   LV: NO changes
#   LN: Log the data
#   DLV: Change in the level (m/m)
#   DLN: Change in the log level
#   Factor: This is the one-hot encoding. Three codings - rising, falling, level
# 
# And then lagging
# Some of the data is released with a lag (e.g. housing starts)
# Some is concurrent (e.g. Baa spreads)
# some is released with a lag, but barely (e.g. nonfarm payrolls)
# NEed to adjust all of those here on a case by case basis




# Unemployment Rate (Transformation: DLV, Lag: None)
UNRATE <- diff(UNRATE)
UNRATE <- xts_to_df(UNRATE)

# Philly Fed New Orders(Transformation: None, Lag: None)
# Comes out mid-month for its forecast month
NOCDFSA066MSFRBPHI <- xts_to_df(NOCDFSA066MSFRBPHI)

# Yield Curve Slope (Transformation: None, Lag: None)
T10Y2Y <- xts_to_df(T10Y2Y)

# Fed Funds Rate (Transformation: None, Lag: None)
FEDFUNDS <- xts_to_df(FEDFUNDS)
FEDFUNDS$delta_12m <- c(rep(NA, 12), diff(FEDFUNDS$FEDFUNDS, lag = 12))
FEDFUNDS$regime <- "Flat"
FEDFUNDS$regime[FEDFUNDS$delta_12m >= 0.5] <- "Rising"
FEDFUNDS$regime[FEDFUNDS$delta_12m <= 0.5] <- "Falling"

# Payrolls (Transformation: None, Lag: None)


# Industrial Production (Transformation: None, Lag: None)


# Income (Transformation: None, Lag: None)


# Average Weekly Hours (Transformation: None, Lag: None)


# Housing Starts (Transformation: None, Lag: None)


# Housing Permits (Transformation: None, Lag: None)


# Core Consumption Expenditure (Transformation: None, Lag: None)


# Business Loans (Transformation: None, Lag: None)


# BAA Spread (Transformation: None, Lag: None)


# Lagging the Data --------------------------------------------------------

# Some of the data is released with a lag (e.g. housing starts)
# Some is concurrent (e.g. Baa spreads)
# some is released with a lag, but barely (e.g. nonfarm payrolls)
# NEed to adjust all of those here on a case by case basis



# Response Variable --------------------------------------------------------

# Currently using the S&P 500 and a corporate bond index. 
# For classification problems, this will be a o/p, u/p variable
# For regression, it will be degree of outperformance

# Note the convention will be that the risk asset will always be the primary asset.
# i.e. outperformane means the risk asset o/p, and the relative performance is
# perf(risk asset) - perf(safe asset)



# Combining Data ----------------------------------------------------------

# This will create the final dataframe and align all the dates
