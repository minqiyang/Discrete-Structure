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

## Part 1
### igraph plot.

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


### networkD3 forceNetwork

* Description

Create a D3 JavaScript force directed network graph.

* Usage

Key arguments:

forceNetwork(
  Links,
  Nodes,
  Source,
  Target,
  Value,
  NodeID,
  Nodesize,
  Group,
...
)
Arguments
Links	
a data frame object with the links between the nodes. It should include the Source and Target for each link. These should be numbered starting from 0. An optional Value variable can be included to specify how close the nodes are to one another.

Nodes	
a data frame containing the node id and properties of the nodes. If no ID is specified then the nodes must be in the same order as the Source variable column in the Links data frame. Currently only a grouping variable is allowed.

Source	
character string naming the network source variable in the Links data frame.

Target	
character string naming the network target variable in the Links data frame.

Value	
character string naming the variable in the Links data frame for how wide the links are.

NodeID	
character string specifying the node IDs in the Nodes data frame.

Nodesize	
character string specifying the a column in the Nodes data frame with some value to vary the node radius's with. See also radiusCalculation.

Group	
character string specifying the group of each node in the Nodes data frame.

...


```
library("lda")
library("networkD3")


# load samplik data

data("sampson")

samplik <- sampson$SAMPLK1

#nodes <- data.frame( name = dimnnames(samplik)[[1]])

#Create nodes from adjacency matrix
nodes <- data.frame(name = rownames(samplik))

#Create links from adjacency matrix
links <- data.frame(source = integer(), target = integer(), value = numeric())

for(i in 1:nrow(samplik)){
  for (j in 1:ncol(samplik)){
    if (samplik[i,j] > 0){
      links <- rbind(links, data.frame(source=i-1, target=j-1, value = samplik[i,j]))
    }
  }
}


forceNetwork(
  Links = links,
  Nodes = nodes,
  Source = "source",
  Target = "target",
  Value = "value",
  NodeID = "name",
  Group = "name",
  opacity = 0.9,
  linkDistance = 100,        # Distance between nodes
  charge = -200,             # Repulsion force (negative = stronger repulsion)
  fontSize = 14,             # Font size for labels
  colourScale = JS("d3.scaleOrdinal(d3.schemeCategory20);"),  # Custom color scale
  zoom = TRUE                # Enable zooming
)

```

<img width="705" height="588" alt="image" src="https://github.com/user-attachments/assets/838166c2-edee-47dd-a2b8-b13ce130a492" />












## Open Questions:
   
group dynamics    
group conflict
