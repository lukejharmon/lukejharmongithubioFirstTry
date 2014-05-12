library(ape)
setwd("/Users/lukeh/Documents/teaching/rWorkshop/calgary/stuff/filesForStudents/")
# read in DNA - format follows phylip conventions
geckoDNA<-read.dna("12s_seq.txt")
geckoDNA

# find things out
base.freq(geckoDNA)
phelDist<-dist.dna(geckoDNA)
phelDist
rawDist<-dist.dna(geckoDNA, model="raw")

plot(phelDist, rawDist)

crapPhelTree<-bionj(phelDist)
plot(crapPhelTree)

ultrametricCrapPhelTree<-chronoMPL(crapPhelTree)

