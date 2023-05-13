library(microbenchmark)

#salvando uma base em formatos diferentes

save(x, file = "base_strom.Rds")

write.csv2(x, "base_strom.csv")


# carrega base de dados em formato nativo R
basestrom <- readRDS("Documents/base_strom.Rds")

# carrega base de dados em formato tabular (.csv) - padrão para interoperabilidade
basestrom <- read.csv2('bases_tratadas/sinistrosRecife.csv', sep = ';')

# compara os dois processos de exportação, usando a função microbenchmark

microbenchmark(a <- saveRDS(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.rds"), b <- write.csv2(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.csv"), times = 30L)

microbenchmark(a <- readRDS('bases_tratadas/sinistrosRecife.rds'), b <- read.csv2('bases_tratadas/sinistrosRecife.csv', sep = ';'), times = 10L)