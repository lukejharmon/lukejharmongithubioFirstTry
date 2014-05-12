# Welcome! Please make sure you have the latest version of r installed (2.13.0)
# you will also need the packages ape, geiger, and (maybe) laser 
# we will install picante at the beginning of one exercise
# the course has a website: 
# http://www.webpages.uidaho.edu/~lukeh/rFiles.html

4+4
65-3

1+2*3

# how does r store data
x=6
x
x<-7
x
8->y
y
x^y

# modes
x<-25
mode(x)

name<-"Luke"
mode(name)

isItCloudy<-T
mode(isItCloudy)

# vectors, matrices, arrays, dataframes, lists
x<-c(1, 2, 3, 4)
x
mode(x)
length(x)

y<-c(5, 6, 7, 8)
x*y

mean(x)

?mean

# matrices
z<-cbind(x, y)
z
mode(z)
length(z)
dim(z)
class(z)
class(x)

z[1,1]
z[1,2]
# everything in the first row
z[1,]
# everything in the second column
z[,2]

x
names(x)<-c("anole", "skink", "gecko", "snake")
x

# not a good idea
names(z)<-c("anole", "skink", "gecko", "snake")
z

# different function for matrix names

rownames(z)<-c("anole", "skink", "gecko", "snake")
z

colnames(z)<-c("nLegs", "nHeads")
z

# the colon: key to happiness in r
x<-1:100
x
y<-101:200*3
y
v<-10:1
v
r<-1:10/1000
r
length(x)
length(y)
length(r)

bigMatrix<-cbind(x, y)
bigMatrix<-cbind(x, r)

# more about indexing
x[40]
x[10:30]
x[1:10*3]
# first ten rows, all columns
bigMatrix[1:10,]
# all rows, last column
bigMatrix[,2]

# plotting
x<-1:1000
y<-rnorm(1000)
plot(x, y)

z<-rep(c("Blue", "Red", "Green", "Purple"), each=250)
# change to a factor
z<-as.factor(z)
# because z is a factor, this is a boxplot
plot(z, y)

# common errors in r syntax
# these are not the same
length=6
lengths=6
Lengths=6

# difference between [] and ()
# [] are for indexing vectors and matrices
# () are for functions

# first element of x
x[1]
# error
x(1)

mean(x)
mean[x]

# commas
bigMatrix[1,1]
# errors
bigMatrix[1 1]
bigMatrix[1,1,]
bigMatrix[1,1]

x<-1:4 /10
