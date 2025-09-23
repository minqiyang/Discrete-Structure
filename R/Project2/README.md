# Lab Project 2: Sampson's Monks

## Setup

Install package lda, igraph and networkD3.

* Igraph (network analysis & static plots)
  * Accepts adjacency matrics.

* networkD3 (interactive plots) 
  * Expects data frames of nodes and edges.
  * Nodes
  * edges.
    
* lda Sampson Dataset is stored in lda package (as list of matrices).
  


## Understand dataset "Sampson monk data"

### Description

Various relationships between several monks at a monastery collected over time.

### Usage

```
data(sampson)
```
### Format

sampson is a list whose entries are 18x18 matrices representing the pairwise relationships between 18 monks. The names of the monks are given as the row/column names of each matrix.
Each matrix encodes a different relationship (there are a total of 10) described by the corresponding name field of the list.

<img width="1527" height="418" alt="image" src="https://github.com/user-attachments/assets/a269cedf-5198-47cd-b405-ded0a52b7a83" />
18x18 matrices are basically adjacency matrices.

## igraph plot.

* Description
plot.igraph() is able to plot graphs to any R device. It is the non-interactive companion of the tkplot() function.

* Usage
```
## S3 method for class 'igraph'
plot(
  x,
  axes = FALSE,
  add = FALSE,
  xlim = c(-1, 1),
  ylim = c(-1, 1),
  mark.groups = list(),
  mark.shape = 1/2,
  mark.col = rainbow(length(mark.groups), alpha = 0.3),
  mark.border = rainbow(length(mark.groups), alpha = 1),
  mark.expand = 15,
  loop.size = 1,
  ...
)
```
So, we need to convert the 18x18 adjacency matrics to graph class defined by igraph.
when we call generic function plot with graph defined by igraph,  plot.igraph would be called.

```
library("lda")
library("igraph")


# load samplik data

data("sampson")

samplik <- sampson$SAMPLK1

g_samplik <- graph_from_adjacency_matrix(samplik, mode = "directed", diag = FALSE, weighted = NULL)


  
plot(g_samplik, vertex.label = V(g_samplik)$name)
```

<img width="771" height="648" alt="image" src="https://github.com/user-attachments/assets/eca0717e-b6df-49a4-8a2b-394562cbad1a" />














## Open Questions:
Adjacency matrics.
group dynamics
group conflict
