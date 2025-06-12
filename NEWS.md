# wqc 0.1.1 (2025-06-15)

- Fixed DOI/URL syntax in the DESCRIPTION (angle-bracketed URLs, `<doi:…>`).  
- Added a `.Rbuildignore` to exclude `.github/` and `cran-comments.md` from the CRAN tarball.  
- Wrapped the slow `apply_quantile_correlation()` example in `\donttest{}` so it doesn’t time out.  
- Added a package vignette and updated the pkgdown site under `docs/`.

# wqc 0.1.0 (2025-06-10)

- Initial CRAN submission.
