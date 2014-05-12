# load the ape library 
library(ape)

# read in the trees and stores them
anolisTrees<-read.nexus(file="anolis_mtDNA_mrb.con")

# anolisTrees is a list with two items
# if you want to access individual trees in the list
# you have to use double brackets

# this is the first tree
anolisTrees[[1]]
plot(anolisTrees[[1]])

pdf(file="tree1.pdf", width=17, height=22)
plot(anolisTrees[[1]])
dev.off()

anolisTrees[[2]]

# Make ultrametric tree using pl

anolePLTree<-chronopl(anolisTrees[[1]], lambda=1)
plot(anolePLTree)

# find things out about the tree

ltt.plot(anolePLTree, log="y")

# tree is not rooted and dichotomous, let's fix that
anoleResolved<-multi2di(anolePLTree)

balance(anoleResolved)
birthdeath(anoleResolved)
yule(anoleResolved)

gammaStat(anoleResolved)

library(laser)
mccrTest(CladeSize=400, NumberMissing=211, NumberOfReps=1000, ObservedGamma=-6.37)

randomTree<-birthdeath.tree(b=1, d=0, taxa.stop=100)
plot(randomTree)

lotsOfRandomTrees<-list()

for(i in 1:100) {
	lotsOfRandomTrees[[i]]<-randomTree<-birthdeath.tree(b=1, d=0, taxa.stop=100)
	plot(lotsOfRandomTrees[[i]])
	}

# read in some data
anoleData<-read.csv("anolis_data.csv")

# Store individual variables and associate with species names
micro<-anoleData[,2]
names(micro)<-anoleData[,1]
svl<-anoleData[,3]
names(svl)<-anoleData[,1] 
library(geiger)

# prune missing species out of the tree
nc<-name.check(anoleResolved, micro)
anolePruned<-drop.tip(anoleResolved, nc[[1]])
name.check(anolePruned, micro)

svlContrasts<-pic(svl, anolePruned)

randomCharacter<-sim.char(anolePruned, model.matrix=matrix(1.0))

randomContrasts<-pic(randomCharacter[,1,1], anolePruned)

plot(svlContrasts, randomContrasts)

fittedModel<-lm(randomContrasts~svlContrasts-1)
summary(fittedModel)

fitContinuous(anolePruned, log(svl), model="BM")
svlContrasts2<-pic(log(svl), anolePruned)
mean(svlContrasts2^2)

fitContinuous(anolePruned, log(svl), model="OU")
fitContinuous(anolePruned, log(svl), model="EB")

fitDiscrete(anolePruned, micro, model="ER")
fitDiscrete(anolePruned, micro, model="ER", treeTransform="exponentialChange")

dtt.full(anolePruned, log(svl))


