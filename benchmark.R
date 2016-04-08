library(microbenchmark)
library(glmnet)
library(hdm)

set.seed(12345)
n <- 1000
p <- 100
s <- 10

beta <- c(rep(1,s), rep(0, p-s))
X <- matrix(rnorm(n*p), ncol=p); eps <- rnorm(n)
y <- X%*%beta + eps

MB <- microbenchmark(glmnet(X,y, alpha=0), rlasso.fit(X,y, post=FALSE),  
               rlasso.fit(X,y, post=TRUE), rlasso(y~X, post=TRUE), rlasso(y~X, post=FALSE), cv.glmnet(X,y))

MB
str(MB)
