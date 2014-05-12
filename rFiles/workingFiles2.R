# reading in your data
# the working directory
# two strategies for getting files into r
# set the working directory
setwd("/Users/lukeh/Documents/teaching/rWorkshop/calgary/stuff/filesForStudents/")
# what is in the working directory?
dir()

# now I can read in the anolis file
anolisData<-read.csv("anolisraw.csv")
mode(anolisData)
dim(anolisData)
class(anolisData)
#data.frame contains a mix of colums: numeric, character, logical, etc.
anolisData[,1]

# OR you can just use the complete path
anolisData<-read.csv("/Users/lukeh/Documents/teaching/rWorkshop/calgary/stuff/filesForStudents/anolisraw.csv")

# reshape our data to prepare for comparative analysis
# species names to be rownames
# this means all rows and NOT column 1
aData<-anolisData[,-1]
rownames(aData)<-anolisData[,1]

# now read in a phylogenetic tree
# this one is in newick format so use read.tree
library(ape)
anolisTree<-read.tree("anolis.phy")
anolisTree
plot(anolisTree)
add.scale.bar()

# can't read the tips!
# this is better
pdf(file="bigTree.pdf", width=18, height=35)
plot(anolisTree)
add.scale.bar()
dev.off()

class(anolisTree)
attributes(anolisTree)
# we can interact with anolisTree as a list
anolisTree$tip.label
anolisTree$edge.length
anolisTree$edge

# create cophenetic matrix
# patristic distances between all tips
cophenetic(anolisTree)

# tree manipulations
# dropping tips
anolisTree2<-drop.tip(anolisTree, "aeneus")
anolisTree
anolisTree2

# drop more than one species
anolisTree3<-drop.tip(anolisTree, c("aeneus", "griseus", "trinitat"))
anolisTree3

crapSpecies<-anolisTree$tip.label[20:40]
anolisTree4<-drop.tip(anolisTree, crapSpecies)

# other good tree functions
# branching times from root to present day
branching.times(anolisTree)
# do the tips all line up?
is.ultrametric(anolisTree)
# is the tree fully resolved? 
is.binary.tree(anolisTree)

# check monophyly of clades
putativeClade<-c("agassizi", "microtus", "casildae")
is.monophyletic(anolisTree, putativeClade)
?is.monophyletic

# reading in many tree
manyTrees<-read.tree("multiple_trees.phy")
manyTrees
class(manyTrees)

# access individual trees using [[ ]]
# first tree is 
manyTrees[[1]]
class(manyTrees[[1]])
plot(manyTrees[[1]])
plot(manyTrees[[45]])

# create a loop to plot all trees
pdf(file="multiTree.pdf")
for(i in 1:10) {
	plot(manyTrees[[i]])
}
dev.off()

# reroot the tree
rer<-root(anolisTree, outgroup="sabanus")
plot(rer)

# combine tree and data
dim(aData)
anolisTree

name.check(anolisTree, aData)
# match tree and tip data
matchedData<-treedata(anolisTree, aData)
# pull out pruned tree
prunedTree<-matchedData$phy
prunedData<-matchedData$data

prunedTree
dim(prunedData) 