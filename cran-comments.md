Package: wqc
Version: 0.2.0
Date: 2025-06-11
Maintainer: Anoop S Kumar <akumar.sasikumar@gmail.com>
URL: https://github.com/anoopsasikumar/wqc
BugReports: https://github.com/anoopsasikumar/wqc/issues

This submission (version 0.2.0) introduces the following updates since version 0.1.0:

- Removed Excel file output; functions now return data frames for easier programmatic use.
- Added comprehensive examples for `apply_quantile_correlation()` and `quantile_correlation_analysis()` in both the README and vignette.
- Included a pkgdown site at `https://anoopsasikumar.github.io/wqc/` to host online reference documentation.
- Renamed the package from `wqca` to `wqc` to simplify naming and address past inconsistencies.
- Updated all internal references, test scripts, and documentation to reflect the new name.

\subsection{Testing and Compatibility}
- All package checks pass on R-hub (Linux, Windows, macOS) with zero errors or warnings.
- A lone NOTE regarding "unable to verify current time" appears on Windows; this is a known platform behavior and harmless.

\subsection{Dependencies}
- Imports: waveslim (>= 1.2-8), QCSIS (>= 0.1.5), openxlsx (>= 4.2.5), stats.
- No Suggests beyond testthat and knitr for vignette building.

\subsection{Additional Information}
- The pkgdown documentation and tutorial vignette provide detailed usage guidance and theoretical background.
- The NEWS.md file documents changes in version 0.2.0 and initial release v0.1.0.
- `cran-comments.md` itself can be updated to reflect further CRAN feedback if needed.

We look forward to feedback and thank the CRAN team for their time and consideration.
