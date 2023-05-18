install.packages("doParallel")
install.packages("foreach")

library(doParallel)
library(foreach)

cl <- makeCluster(4)
registerDoParallel(cl)
result <- foreach(i = 1:1e6, .combine = c) %dopar% {
  i^2
}
stopCluster(cl)
