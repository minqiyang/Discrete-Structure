
library('networkD3')


# Write a function that will generate a network according to the rule that each monk assigns their likes
# (or dislikes) completely at random. TTis function should be general enough to allow the user to generate
# a network of any size. (Hint: for loops can be helpful here)

#Feel free to add additional complexity into your model (for example, assigning the likes randomly but
#                                                        with unequal probabilities).


gen_network_adjacency_matrix <- function(nSize){
  # generate probabilities for each person.
  runif_nums <- runif(nSize, min = 0, max = 1)
  probs <- runif_nums /sum(runif_nums)
  
  probs <- round(probs, 2)
  #print(probs)
  cat("Sum: ", sum(probs))
  
  mat <- matrix(data = rep(0, nSize * nSize), 
                nrow = nSize, 
                dimnames = list(paste("MONK", 1:nSize, sep="_"), paste("MONK", 1:nSize, sep="_")))
  for (i in 1:ncol(mat)){
    top_three <- sample((1:nSize)[-i], 3, replace = TRUE, prob = probs[-i])
    mat[i, top_three[1]] <- 3
    mat[i, top_three[2]] <- 2
    mat[i, top_three[3]] <- 1
  }              
              
  mat
}

samplik_sim <- gen_network_adjacency_matrix(18)
#print(samplik_sim)

#Create nodes from adjacency matrix
nodes <- data.frame(name = rownames(samplik_sim))

#Create links from adjacency matrix
links <- data.frame(source = integer(), target = integer(), value = numeric())

for(i in 1:nrow(samplik_sim)){
  for (j in 1:ncol(samplik_sim)){
    if (samplik[i,j] > 0){
      links <- rbind(links, data.frame(source=i-1, target=j-1, value = samplik[i,j]))
    }
  }
}


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
  arrows = TRUE,
  zoom = TRUE                # Enable zooming
)

print(plot)

