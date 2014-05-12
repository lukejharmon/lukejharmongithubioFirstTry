svl<-prunedData[,1]
names(svl)<-rownames(prunedData)
svl

# this does not work
svlAncestors<-ace(log(svl), prunedTree)
attributes(svlAncestors)
range(log(svl))
svlAncestors$ace
range(svlAncestors$ace)

# these are better
svlAncestors<-ace(log(svl), prunedTree, method="pic")
range(log(svl))
svlAncestors$ace
range(svlAncestors$ace)
svlAncestors$CI95
exp(svlAncestors$CI95)

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

swData<-data.frame(svl, weight)
pglsModel<-gls(weight~svl, correlation=corBrownian(1, prunedTree), data=swData)
summary(pglsModel)

