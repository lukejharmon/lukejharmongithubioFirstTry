# for this part you need prunedTree and prunedData

plot(prunedData[,1:2], log="xy")

svl<-log(prunedData[,1])
names(svl)<-rownames(prunedData)
svl

weight<-log(prunedData[,2])
names(weight)<-rownames(prunedData)

# standard regression in r
# does not account for the tree

linearModel<-lm(weight~svl)
summary(linearModel)

# we can do this with contrasts too
svlpic<-pic(svl, prunedTree)
wtpic<-pic(weight, prunedTree)
plot(svlpic, wtpic)

# regression with contrasts has NO intercept (-1)
picmodel<-lm(wtpic~svlpic-1)
summary(picmodel)

# test for phylogenetic signal
library(picante)
phylosignal(svl, prunedTree)
