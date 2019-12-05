% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scatter.R
\name{manhattan_plot}
\alias{manhattan_plot}
\title{Manhattan plot}
\usage{
manhattan_plot(data, x, p, effect = NULL, p_fdr = NULL, color = NULL,
  p_breaks = c(0.05, 0.01, 0.001, 1e-04), fdr_limit = 0.05,
  x_lim = NULL, y_lim = NULL, color_scale = NULL,
  title = "Manhattan plot", subtitle = NULL, ...)
}
\arguments{
\item{data}{a data frame with the effect size and p-values}

\item{x, p}{the column names of effect size (x-axis) and p-values}

\item{effect}{column name of effect size (should have negative and positive values).}

\item{p_fdr}{column name of FDR corrected p-values, used to draw a line showing the fdr-corrected significance level}

\item{color}{column name used to color the plots}

\item{p_breaks}{a numerical vector of the p_values to show on the y-axis}

\item{fdr_limit}{the significance level used in the experiment}

\item{x_lim, ylim}{numerical vectors of length 2 for manually setting the axis limits}

\item{color_scale}{the color scale as returned by a ggplot function}

\item{title, subtitle}{the title and subtitle of the plot}

\item{...}{parameters passed to \code{\link[ggplot2]{geom_point}}, such as shape and alpha values. New aesthetics can
also be passed using \code{mapping = aes(...)}.}
}
\value{
a ggplot object
}
\description{
Draws a (directed) Manhattan plot of p-values and versus e.g. retention time or mass-to-charge ratio.
If effect size and direction is supplied, the -log10(p-value) on the y-axis will be multiplied
by the direction (sign) of the effect, so part of the points will "drop" from the p = 1 (-log10(p) = 0) line.
This results in a so-called directed Manhattan plot.
}