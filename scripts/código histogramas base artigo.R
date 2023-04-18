#utilizando função apply para construir histograma da base de dados de um artigo que estou escrevendo
sapply(base_artigo[ , 16:18], hist)

#fazendo centralização de uma variável de uma base de dados

hist(x$dispersive_nm_IDC)

simulacaoDispersive <- x$dispersive_nm_IDC
hist(simulacaoDispersive)

SimulacaoDispersiveCentral <- simulacaoDispersive - mean(simulacaoDispersive)
hist(SimulacaoDispersiveCentral)




