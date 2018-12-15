

# Transform and Lag the Independent Variables -------------------------------------

# HEre we are transforming numerical variabels to coincide with CFNAI convention
# or something related if it's not used in their model. Categorical variables 
# will be changed into one-hot encodings.
# 
# And then lagging
# Some of the data is released with a lag (e.g. housing starts)
# Some is concurrent (e.g. Baa spreads)
# some is released with a lag, but barely (e.g. nonfarm payrolls)
# NEed to adjust all of those here on a case by case basis

# Unemployment Rate (Transformation: DLV, Lag: None)
UNRATE <- diff(UNRATE)

# Philly Fed New Orders(Transformation: None, Lag: None)
# Comes out mid-month for its forecast month
NOCDFSA066MSFRBPHI <- NOCDFSA066MSFRBPHI

# Yield Curve Slope (Transformation: None, Lag: None)


# Fed Funds Rate (Transformation: None, Lag: None)


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
