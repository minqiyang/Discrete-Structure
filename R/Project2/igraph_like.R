library("lda")
library("igraph")


# load samplik data

data("sampson")

samplik <- sampson$SAMPLK1

g_samplik <- graph_from_adjacency_matrix(samplik, mode = "directed", diag = FALSE, weighted = NULL)


  
plot(g_samplik, vertex.label = V(g_samplik)$name)