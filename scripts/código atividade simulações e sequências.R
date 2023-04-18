tarefaSemente <- addTaskCallback(function(...) {set.seed(123);TRUE})
tarefaSemente


distNormalSimulacao <- rnorm(200)
summary(distNormalSimulacao)


distBinominalSimulacao <- rbinom(200, 1, 0.7)
distBinominalSimulacao

indexSimulacao <- seq(1, length(distNormalSimulacao))
indexSimulacao
