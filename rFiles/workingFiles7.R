# fit models to the tree
# birth-death model
# assumes complete sampling - you have evey species

# pure birth model
yule(anolisTree)

birthdeath(anolisTree)
# no support for a role of extinction

# fit models of trait evolution
svl<-log(prunedData[,1])
names(svl)<-rownames(prunedData)

fitContinuous(prunedTree, svl, model="BM")
fitContinuous(prunedTree, svl, model="lambda")
# the OU model often outperforms BM for real data
fitContinuous(prunedTree, svl, model="OU")

# fit discrete characters
svlMed<-median(svl)
isItBig<- svl>svlMed

fitDiscrete(prunedTree, isItBig)
fitDiscrete(prunedTree, isItBig, treeTransform="lambda")

