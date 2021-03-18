**Ensembles and combinations: using multiple models to improve forecasts**



1. Different ways of using multiple models

- Combinations: A (usually linear) combination of forecasts from multiple models are used for one series. This includes combining point forecasts, quantile forecasts or full distributional forecasts. It covers simple averaging, weighted averaging, and sometimes combinations based on ML algorithms. e.g., FFORMA and related methods.
- Ensembles: Although "ensembles" has been used in different ways in different literatures, we will use "ensemble" to mean a mixture of the forecast distributions from multiple models. In many ways this is simpler than combinations as the relationship between the methods can be ignored. Need to discuss when they are equivalent.
- Boosting: Multiple models used for one series in sequence. Equivalent to hybrid forecasting where residuals from one method are modelled using a different method.
- Bagging: One or more models applied to multiple similar series, and then a combination or ensemble is taken. Bagging requires a method for generating multiple series. Some possibilities are STL-ETS and GRATIS.
- Stacking.

Simple example to illustrate differences. Suppose we have one series and two methods: an ARIMA model and a CNN.

- A combination would apply both to the same series and average the results. Unless we are only interested in point forecasting, the averaging would need to take account of the correlation between the forecast errors.
- An ensemble would apply both to the same series and generate forecast distributions from each. These would then be mixed (possibly with weighting) to form the final forecast distribution.
- Boosting would apply the ARIMA model to the series, and then apply the CNN to the residuals. The final forecasts would be the forecasts from the ARIMA model plus the forecasts from the CNN.
- Bagging would generate multiple series like the series of interest, and apply one of the methods to all the generated series. These could then be combined, or ensembled.

2. Point forecast combinations

- Simple combinations: cover historical uses, and discuss mean, median, trimmed mean, etc.
- Weighted combinations: different linear weighting methods, nonlinear combinations, relevant theory.
- Forecast combination puzzle: why don't weights work?

3. Probabilistic forecast combinations

- Combining quantiles and prediction intervals.
- Combining distributions as in fable.

4. Probabilistic ensembles

- Meteorological ensembles.
- True ensembles in other areas (i.e., not papers that use the word "ensemble" but papers that use mixtures when forecasting).
- When is an ensemble equivalent to combination?
- When do point forecasts from an ensemble equal point forecasts from a combination?

5. Boosting in forecasting
6. Bagging in forecasting
7. Stacking in forecasting