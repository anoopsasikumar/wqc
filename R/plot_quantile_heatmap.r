#' Plot Wavelet Quantile Correlation Heatmap
#'
#' Create a heatmap of estimated quantile-wavelet correlations with white borders
#' for cells where the estimate lies outside its 95% confidence interval.
#'
#' @param df Data frame with columns \code{Level}, \code{Quantile},
#'   \code{Estimated_QC}, \code{CI_Lower}, and \code{CI_Upper}.
#' @param label_levels Logical; if \code{TRUE}, label the y-axis with level numbers.
#' @param palette Color palette vector for \code{col.regions}; default uses
#'   \code{viridisLite::viridis(100)}.
#' @return A \code{lattice} \code{levelplot} object (invisibly).
#'
#' @examples
#' df <- data.frame(
#'   Level        = rep(1:2, each = 3),
#'   Quantile     = rep(c(0.1, 0.5, 0.9), times = 2),
#'   Estimated_QC = runif(6, -1, 1),
#'   CI_Lower     = rep(-0.5, 6),
#'   CI_Upper     = rep(0.5, 6)
#' )
#' # Use :: for namespace clarity, avoid library() calls
#' plot_quantile_heatmap(df, label_levels = TRUE, palette = viridisLite::viridis(100))
#'
#' @importFrom lattice levelplot panel.levelplot
#' @importFrom grid grid.rect unit gpar
#' @importFrom viridisLite viridis
#' @export
plot_quantile_heatmap <- function(df,
                                  label_levels = TRUE,
                                  palette = viridisLite::viridis(100)) {
  # Ensure correct ordering
  df$Quantile <- factor(df$Quantile, levels = unique(df$Quantile))
  df$Level    <- factor(df$Level,    levels = sort(unique(df$Level)))

  p <- lattice::levelplot(
    Estimated_QC ~ Quantile * Level,
    data        = df,
    col.regions = palette,
    xlab        = "Quantiles",
    ylab        = if (label_levels) "Levels" else NULL,
    main        = "Wavelet Quantile Correlation",
    panel       = function(x, y, z, subscripts, ...) {
      # Draw the heatmap cells
      lattice::panel.levelplot(x, y, z, subscripts = subscripts, ...)

      # Identify cells outside the 95% CI
      est   <- z
      lower <- df$CI_Lower[subscripts]
      upper <- df$CI_Upper[subscripts]
      outside <- which(est < lower | est > upper)

      if (length(outside)) {
        xs <- as.numeric(x[outside])
        ys <- as.numeric(y[outside])
        for (i in seq_along(xs)) {
          grid::grid.rect(
            x      = grid::unit(xs[i], "native"),
            y      = grid::unit(ys[i], "native"),
            width  = grid::unit(1, "native"),
            height = grid::unit(1, "native"),
            gp     = grid::gpar(col = "white", fill = NA, lwd = 2)
          )
        }
      }
    }
  )
  print(p)
  invisible(p)
}
