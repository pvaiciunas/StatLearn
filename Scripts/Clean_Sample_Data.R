

# Transform the Independent Variables -------------------------------------

# HEre we are transforming numerical variabels to coincide with CFNAI convention
# or something related if it's not used in their model. Categorical variables 
# will be changed into one-hot encodings.

# TODO: transform, and deal with naming the existing variabels in the system




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
