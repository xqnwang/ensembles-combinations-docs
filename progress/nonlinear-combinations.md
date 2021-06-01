# Articles on nonlinear combinations



## A list of articles on nonlinear combinations

| Reference          | Dataset                    | Linear combinations | Statistical test | Performance                      |
| ------------------ | -------------------------- | ------------------- | ---------------- | -------------------------------- |
| Shi and Liu (1993)[^1] | A series (IBM stock price) | No                  | No               | Better than individual forecasts |
| Donaldson and Kamstra (1996)[^2] | Four series (volatility in daily stock returns) | SA; OLS; MAD | Encompassing test | Significantly preferred to other combinations (not improved in terms of RMSE and RMAE) |
| Harrald and Kamstra (1997)[^3] | A series (S&P 500 index) | SA; Kernel; OLS | Encompassing test | Significantly preferred to other combinations (not improved in terms of RMSE and RMAE) |
| Krasnopolsky and Lin (2012)[^4] | Three cases for 24-hour precipitation forecasts | SA; OLS | No | Improved forecasts over linear combinations |
| Babikir and Mwambi (2016)[^5] | Three financial variables | SA; Performance-based methods (MSE and DMSFE) | Diebold–Mariano test (only test the differences between ANN combined forecasts and AR model) | Improved forecasts over linear combinations in terms of RMSE |
| Freitas and Rodrigues (2006)[^6] | Nine time series are simulated | OLS | No | Improved forecasts over linear combinations in terms of RMSE |
| Adhikari and Agrawal (2012)[^7] | Three real-world time series | SA | No | Improved forecasts over SA in terms of MAE, MSE and ARV |
| Adhikari (2015)[^8] | Six real-world time series | SA; Median; OLS; Performance-based method; Outperformance method | No | Improved forecasts over SA in terms of MAE, MSE, ARV, and mean ranks. |



## Encompassing test

- The test for encompassing-in-forecast.

- **Intuition**: model $j$ should be preferred to model $k$ if model $j$ can explain what model $k$ cannot explain, without model $k$ being able to explain what model $j$ cannot explain.

- The formal test for encompassing in forecast is based on a set of OLS regressions of the forecast error from one model on the forecast from the other model.

- Thus, letting $E_{j}$ be model j's forecast error and $F_{k}$ be model $k$ 's forecast, the tests for encompassing involve testing for significance of the $\theta_{1}$ parameter in the regression
  $$
  E_{j t}=\theta_{0}+\theta_{1} F_{k t}+\eta_{t}.
  $$
  
- Null hypothesis: neither model encompasses the other.



## Diebold–Mariano test

The Diebold and Mariano test statistic is given by
$$
S=\frac{\bar{d}}{\sqrt{\hat{V}(\bar{d})}},
$$
where $\bar{d}=\frac{1}{T} \sum_{t=1}^{T}\left(e_{1 t}^{2}-e_{2 t}^{2}\right)$ is the mean difference of the squared prediction error and $\hat{V}(\bar{d})$ is the estimated variance. The $S$ statistic follows a standard normal distribution asymptotically.



## References

[^1]: Shi, S. and Liu, B. (1993), Nonlinear combination of forecasts with neural networks, in *Proceed- ings of 1993 International Conference on Neural Networks (IJCNN-93-Nagoya, Japan)*, Vol. 1, ieeexplore.ieee.org, pp. 959–962 vol.1.

[^2]: Donaldson, R. G. and Kamstra, M. (1996), *Forecast combining with neural networks*, Journal of Forecasting .

[^3]: Harrald, P. G. and Kamstra, M. (1997), *Evolving artificial neural networks to combine financial forecasts*, IEEE Transactions on Evolutionary Computation 1(1), 40–52.

[^4]: Krasnopolsky, V. M. and Lin, Y. (2012), *A neural network nonlinear multimodel ensemble to improve precipitation forecasts over continental US*, Advances in Meteorology 2012.

[^5]: Babikir, A. and Mwambi, H. (2016), *Evaluating the combined forecasts of the dynamic factor model and the artificial neural network model using linear and nonlinear combining methods*, Empirical Economics .

[^6]: Freitas, P. S. A. and Rodrigues, A. J. L. (2006), *Model combination in neural-based forecasting*, European Journal of Operational Research 173(3), 801–814.

[^7]: Adhikari, R. and Agrawal, R. (2012), A novel weighted ensemble technique for time series forecasting, in *Pacific-Asia Conference on Knowledge Discovery and Data Mining*, Springer, pp. 38–49.

[^8]: Adhikari, R. (2015), *A mutual association based nonlinear ensemble mechanism for time series forecasting*, Applied Intelligence .

