# StatLearn

Will be using this project to test various stat and machine learning approaches on predicting economic events. 

The approaches will all deal with the same set of data, and will try and predict the same response variable. The goal is to test various algorithms, cross validation methods, packages, etc, and summarize findings in a quasi-final report. 

This is not meant to be a formal approach to research, but simply a sandbox to test things out in and play around with code. 

Warning, everything posted in this repository will be extremely messy, unorganized, and will lack any semlbance of linearity.

:)

### The Data

This may change in the future to add complexity, but for the time being will keep it pretty simple. Will download 10 variabels, including both categorical and numerical. These will be general economic variabels. Will use some type of market regime as the response (o/p of one AC vs another, or something similar). The ending bit of this section will have a dataframe with the data that will be used by all the experimentation in future scripts

The goal of the initial data is to have variabels that have monthly periodicity, have a long history, are considered either concurrent or leading indicators, And cover variosu aspects of the economy (cosumption, employment, housing, Financial Markets, Manufacturing)

Transformation will also be made to the data that are consistent with the CFNAI approach (at least for the data that overlaps what the fed uses). The transformation are in parentheses after each series following the data descriptions below. More information on that can be found on their website (https://www.chicagofed.org/publications/cfnai/index)



### Cleaning

Cleaning the data and prepping for modeling will all be done at this stage. This includes aligning all the dates, transforming categorical variables into one-hots, etc. Anything to do with models is not touched here. The resulting dataframe should be able to be plugged directly into any model after this stage is complete.


### Modeling

Model choices and cross validation choices will all be made here. So are train/test splits