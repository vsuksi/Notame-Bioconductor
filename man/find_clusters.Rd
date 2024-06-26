% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/feature_clustering.R
\name{find_clusters}
\alias{find_clusters}
\title{Extract the densely connected clusters}
\usage{
find_clusters(connections, d_thresh = 0.8)
}
\arguments{
\item{connections}{data frame of pairs of signals that are linked together,
output of find_connections}

\item{d_thresh}{numeric, the minimum degree required for each signal in a cluster
expressed as a percentage of the maximum degree in the cluster}
}
\value{
a list of clusters, each a list of:
\itemize{
\item features: character vector of the names of the features included in the cluster
\item graph: an igraph object of the cluster
}
}
\description{
First forms clusters of compounds that are linked together. Then the clusters are pruned
so that in the final clusters, each feature is linked to at least a set percentage
of the other features in the cluster.
}
\examples{
\dontshow{.old_wd <- setwd(tempdir())}
data <- combined_data(example_set)
features <- fData(example_set)
features$MPA <- sapply(data[, features[, "Feature_ID"]], finite_median)
conn <- find_connections(data = data, features = features,
  corr_thresh = 0.4, rt_window = 2,
  name_col = "Feature_ID", mz_col = "Mass", rt_col = "RetentionTime")
clusters <- find_clusters(connections = conn, d_thresh = 0.6)
features_clustered <- assign_cluster_id(data, clusters, features,
  name_col = "Feature_ID")
visualize_clusters(data, features, clusters, min_size = 3,
  rt_window = 2, name_col = "Feature_ID", mz_col = "Mass",
  rt_col = "RetentionTime", file_path = "./clusters")
pulled <- pull_clusters(data, features_clustered, name_col = "Feature_ID")
\dontshow{setwd(.old_wd)}

}
