library(geiger)
# stop at 100 taxa
t1<-birthdeath.tree(b=1, d=0, taxa.stop=100)
t1
plot(t1)
# stop at time 6
t2<-birthdeath.tree(b=1, d=0, time.stop=6)
t2
# with extinction
t3<-birthdeath.tree(b=1, d=0.5, taxa.stop=100)
plot(t3)
t4<-prune.extinct.taxa(t3)
plot(t4)
ltt.plot(t4, log="y")

# higher extinction
t5<-birthdeath.tree(b=1, d=0.9, taxa.stop=100, return.all.extinct=F)
plot(t5)
t6<-prune.extinct.taxa(t5)
plot(t6)
ltt.plot(t6, log="y")

# simulate some traits
singleCharBMModel<-matrix(1)
bmsim<-sim.char(t1, model.matrix=singleCharBMModel, nsims=1000)
# sim.char creates a 3d array: n taxa by k traits by m simulations
dim(bmsim)

# look at one simulation
bmsim[,1,1]
hist(bmsim[,1,1])

twoCharModel<-cbind(c(1, -0.5), c(-0.5, 1))
bmsim2d<-sim.char(t1, model.matrix= twoCharModel, nsims=1000)
dim(bmsim2d)

# look at one simulation
bmsim2d[,,1]
plot(bmsim2d[,,1])

# discrete character simulations
discreteModel<-cbind(c(-1,1), c(1,-1)) # this is a Q-matrix; see Yang of Felsenstein books for more details
dsim<-sim.char(t1, model.matrix=list(discreteModel), model="discrete")
dim(dsim)
dsim[,,1]