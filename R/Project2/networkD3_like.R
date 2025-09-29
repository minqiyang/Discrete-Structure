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

#Loop without using rbind.
# links <- data.frame(source = integer(), target = integer(), value = numeric())
# count = 1
# for(i in 1:nrow(samplik)){
#   for (j in 1:ncol(samplik)){
#     if (samplik[i,j] > 0){
#       #links <- rbind(links, data.frame(source=i-1, target=j-1, value = samplik[i,j]))
#       links[count,] <- c(i-1, j-1, samplik[i,j])
#       count <- count + 1
#     }
#   }
# }

# Recycling & subsetting.
# indx <- which(samplik != 0, arr.ind = TRUE, useNames = FALSE)
# links <- data.frame(source = indx[,1] -1, target = indx[,2] -1, value = samplik[indx])

plot <- forceNetwork(
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

print(plot)
