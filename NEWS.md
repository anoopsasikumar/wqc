# News

## wqc 0.2.0 (2025-06-11)

- Dropped Excel file output; results now returned as data.frames.
- Added `apply_quantile_correlation()` and `quantile_correlation_analysis()` example usage in README and vignette.
- Introduced pkgdown site and comprehensive tutorial vignette (`QuantileCorrelationTutorial.Rmd`).
- Renamed package from `wqca` to `wqc` and updated all references.
- Fixed tests to load `wqc` instead of `wqca`.

## wqc 0.1.0 (2025-05-09)

- Initial implementation of quantile correlation analysis with MODWT decomposition.
- Functions: `quantile_correlation_analysis()` and `apply_quantile_correlation()`, with bootstrap confidence intervals.
