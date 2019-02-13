library(reticulate)

unc <- import("uncurl_cluster")

apply_uncurl <- function(sce, params, k) {
    # TODO: return 3 elements: st, with timing info,
    # cluster, a named vector of cluster assignments,
    # est_k, estimated number of clusters
    dat <- counts(sce)
    st <- system.time({
        cluster <- unc$uncurl_cluster(dat, k)
    })
    names(cluster) = colnames(dat)
    st <- c(user.self = st[["user.self"]], sys.self = st[["sys.self"]],
            user.child = st[["user.child"]], sys.child = st[["sys.child"]],
            elapsed = st[["elapsed"]])
    # return...
    list(st=st, cluster=cluster, est_k=NA)
}
