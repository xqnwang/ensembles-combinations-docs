## QRA (quantile regression averaging)

- Proposed by Nowotarski and Weron (2015, Computational Statistics)
- Involve applying **quantile regression** to the **point forecasts** of a small number of individual forecasting models. More precisely, they use the individual point forecasts as independent variables and the corresponding observed spot price as the dependent variable in a standard quantile regression setting. 
- The method yields an interval forecast of the spot price, but does not use the PI of the individual methods

- > Chernozhukov, V, I Fernández-Val, and A Galichon (2010). Quantile and probability curves without crossing. Econometrica: Journal of the Econometric Society 78(3), 1093–1125.



## Quantile forecast combinations

### Model-free ensemble heuristics for quantiles

- Naive sorting and median value based sorting
  - These heuristics, to some extent, treat the $N \times Q$ quantiles as point forecasts, and stack them to draw probabilistic forecasts issued as quantiles.
  - Naturally, averaging blocks of $N$ forecasts is also another option.

- Other six simple heuristics

- From a statistical point of view, these heuristics involve **pooling** together quantiles derived from individual forecast distributions that are assumed to have the same values of characteristics (e.g., the quantile function at different quantile levels) and using the **stacked larger pool** to draw more precise estimates of those characteristics **without training**.

### Comments on flexible ensembles

- The **number of weights** to be learned **scales** with the number of quantile levels considered, which makes it challenging to achieve forecast improvements.
- The **datasets** involved in their empirical studies are **not large enough** to demonstrate the potential benefits of estimating such a large number of weights.
- As has been discussed previously in the literature on **point forecast combinations**, the **error on the estimation of optimal weights** often exacerbates out-of-sample combined forecasts. The issue would be even more problematic when it comes to quantile ensembles because it is a much more challenging task to estimate ensemble weights for a collection of quantiles, especially in the tails of forecast distributions, than merely for point forecasts defined mainly by the means of distributions.
- Looking back, though aggregating quantiles tightly connects with aggregating probability distributions, there has been **little theoretical work** in this area compared to ensembles of probability forecasts with considerable theoretical advances.
- The **choice of the ensemble weights has only been explored empirically**, mainly in the context of energy forecasting and epidemiological forecasting. Some of them are practical and beneficial, while some of them seem like ineffective and worthless. Large datasets should be applied to further investigate their utility.

### KDE (kernel density estimation)

- A technique that creates a smooth curve given a set of data.

- The bandwidth parameter affects how “smooth” the resulting curve is.
  - A lower bandwidth means only points very close to the current position are given any weight, which leads to the estimate looking squiggly; a higher bandwidth means a shallow kernel where distant points can contribute.
  
- The KDE is calculated by **weighting the distances of the observations from a particular point**, $x$, using certain kernel function:

  .

$$
\widehat{f}_{h}(x)=\frac{1}{n} \sum_{i=1}^{n} K_{h}\left(x-x_{i}\right)=\frac{1}{n h} \sum_{i=1}^{n} K\left(\frac{x-x_{i}}{h}\right).
$$

Zhang et al. (2020, Applied Energy)

- Based on the quantile forecasting results, transform a series of quantiles into a continuous density curve. The KDE result can be expressed as:
	$$
	\hat{k}_{n, t}(x)=\frac{1}{Q w} \sum_{q=1}^{Q} K\left(\frac{x-\hat{y}_{n, t, q}}{w}\right),
	$$
	where $w$ is bandwidth; $\hat{y}_{n, t, q}$ is the quantile forecasting result; $K(\cdot)$ is the kernel function.

### Interval forecast combinations



## Horizon-optimized weights

> Valle dos Santos, R. D. O., Araujo F, C. F., Accioly, R., & Oliveira, F. L. C. (2021). Horizon-optimized weights for forecast combination with cross-learning. *Pesquisa Operacional*, *41*.

**Data**: M1, M3, M4 (104,004)

**Method pool**: ETS, ARIMA, Theta, TBATS, SNaive (5)

**For each data frequency...**

**Clustering**

- ETS model forms (15 possible clusters)

**Training**

- training data: taking a $q\%$ sample out the complete set ($q\%$ samples over each cluster ́s subset).
- rolling origin cross-validation scheme ($p$ successive in-sample forecasts for each horizon $h$).
- $p_{min}$ the minimum number of rolling origins to be accepted. If not reached, simple average weighting matrix is considered.
- $p \text{ (number of rolling origins)} \times H \text{ (forecast horizon)} \times K \text{ (number of individual method)}$ forecasts per training series.
- weight estimation (based on sMAPE): weighting matrix of size $H \times K$ per training series.
- for each cluster: simple mean of weighting matrices.

$$
\begin{aligned}
&\text { Table } \text { - User-defined hyperparameters. }\\
&\begin{array}{|c|c|c|c|c|}
\hline \text { Dataset } & q \% & p & p_{\min } & N t \\
\hline \text { M1 } & 100 \% & 10 & 5 & 1,001 \\
\text { M3 } & 100 \% & 10 & 5 & 3,003 \\
\text { M4 } & 10 \% & 10 & 5 & 10,030 \\
\hline
\end{array}
\end{aligned}
$$

**Test**

- If time series $\in$ training set & the number rolling origins $r \geq p_{\min }$:

  - use the series own weighting matrix calculated in the training phase
  - weights based on out-of-sample forecast performance in cross-validation framework
- If series $\notin$ training set OR $1 \leq r < p_{\min }$ :

  - use the mean weighting matrix for the series cluster
  - very simple cross-learning
- If series was too small (e.g., $<2 H$ ) for reliable calculations:

  - use a simple average (static-equal) weighting matrix
  - simple average
- Prediction intervals: 
  - use combined point forecasts as the center
  - use upper and lower radii of ETS forecasts as the radius


**Summary**

- They claim

> The results shall be helpful to support future research on how horizon-optimized weights can be used interchangeably with static ones. 

- Haven't compared forecast performance with horizon-optimized weights and that with static optimized weights.
- Haven't obtained consistently improved forecasts over individuals and simple averages.



## Introduction

Title: **Forecast combinations: Using multiple models to improve forecasts**

1. An increasing size of the toolbox of forecasting models is available. How to best exploit information from the model pool?
   - Model-based, subjective or judgment-based forecasts, etc.
2. Combining forecasts is often considered as a successful alternative to identifying a single 'best model'.
   - Challenges associated with model selection.
   - The idea of combining forecasts (quotation).
   - Research and empirical evidence in favor of forecast combination over selection.
3. Success of forecast combinations.
   - Forecast combinations have been around for nearly 50 years now, since the seminal work of Bates and Granger (1969).
   - Different terminologies (combination, ensemble, aggregation, etc.).
   - Forecast combinations improve forecasting accuracy is near unanimous (empirical evidence).
   - Research on why and when combinations improve forecast accuracy.
   - Wide applications in a variety of areas, e.g., energy, economics and finance, environmental applications.
   - The proportion of the forecast combination in forecasting papers/journal.
4. The success of the approach relies on both the quality of the pool of forecasts being combined and the combination weights.
   - The pool of forecasts: accuracy, diversity, reduce number of forecasts being combined...
  - Combination weighting schemes vary across studies and range from simple averaging to complex approaches.
  - Forecast combination puzzle.
  - Linear VS. nonlinear; static VS. time-varying; correlations among forecasts; features.
5. Timeline.
   - Initial work on forecast combination focused on the combination of point forecasts.
   - In recent years attention has shifted towards probabilistic forecasts. Shape, sharpness, calibration problem.
6. The aim and purpose.
   - A review of how various combination strategies have been used in the past**, **the advantages and disadvantages, and how the various ideas have developed in parallel but are related.
   - 
7. The scope (we should clarify).
   - Only focus on combinations of multiple forecasts from different models for one series.
   - We take the forecasts to be combined essentially as given, and do not discuss in detail important issues around how the individual or component forecasts themselves should be produced.
   - Bagging generates multiple versions of a time series, multiple models are fitted, each corresponding to each of those separate time series. Various combination methods can be applied in this particular context.
8. Conclude with a brief paragraph that describes the organization of the rest of the paper.



## Conclusions and a look to the future

- A brief summary of the scope and coverage of our review. Other combinations that are not covered: manipulate and transform one series to multiple series and combine generated forecasts
- Now nearly 50 years on from the seminal work of Bates and Granger (1969), **simple averaging** still dominates more refined combinations for both point and probabilistic forecasts.
- Importance and challenge of the selection of the model pool. Accuracy, diversity, calibration.
- Developments mainly focus on linear combinations, while nonlinear combinations need to be further investigated and deserve further attention and development.

- Combining probability distributions and combining quantile functions represent two different ways of thinking. Further theoretical and empirical development on probabilistic forecast combinations, especially on quantile combinations.
- Correlation among individual forecasts is rarely considered in probabilistic forecast combinations, mainly developed from a Bayesian perspective.
- Cross-learning. Time series features helps to the weight determination with cross-learning. Feature engineering for different types of data.
- Pursue computationally effective combination algorithm and explore in depth why various combination algorithms work.
- Large, diverse time series datasets to demonstrate the benefits of forecast combinations and open source software.
- There are other ways that multiple forecasts, multiple models get used in forecasting, such as in theta, bagging, boosting, temporal aggregation, hierarchical aggregation.



## A little section on software implementations

- focus on forecast combinations
- open source dataset?
