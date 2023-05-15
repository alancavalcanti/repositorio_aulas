library(microbenchmark)

#salvando em outro formato

save(sinistrosRecifeRaw, file = "sinistrosRecifeRaw.Rda")

#exportando de outra maneira
load("sinistrosRecifeRaw.Rda")

# carrega base de dados em formato nativo R
sinistrosRecife <- readRDS('sinistrosRecife.rds')

# carrega base de dados em formato tabular (.csv) - padrão para interoperabilidade
sinistrosRecife <- read.csv2('sinistrosRecife.csv', sep = ';')

# compara os dois processos de exportação, usando a função microbenchmark

microbenchmark(a <- saveRDS(sinistrosRecife, "sinistrosRecife.rds"), b <- write.csv2(sinistrosRecife, "sinistrosRecife.csv"), times = 10L)

microbenchmark(a <- readRDS('sinistrosRecife.rds'), b <- read.csv2('sinistrosRecife.csv', sep = ';'), times = 10L)
