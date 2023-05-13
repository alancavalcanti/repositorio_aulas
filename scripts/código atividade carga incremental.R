library(dplyr)

# carrega base de dados original
chamadosTempoReal <- read.csv2('http://dados.recife.pe.gov.br/dataset/99eea78a-1bd9-4b87-95b8-7e7bae8f64d4/resource/079fd017-dfa3-4e69-9198-72fcb4b2f01c/download/sedec_chamados_tempo_real.csv', sep = ';', encoding = 'UTF-8')

#tira uma observação
chamadosTempoReal <- chamadosTempoReal[-3,]

# carrega base de dados para atualização
chamadosTempoRealNew <- read.csv2('http://dados.recife.pe.gov.br/dataset/99eea78a-1bd9-4b87-95b8-7e7bae8f64d4/resource/079fd017-dfa3-4e69-9198-72fcb4b2f01c/download/sedec_chamados_tempo_real.csv', sep = ';', encoding = 'UTF-8')

# comparação linha a linha
setdiff(chamadosTempoRealNew, chamadosTempoReal)

# retorna vetor com incremento
chamadosTempoReal[chamadosTempoRealIncremento,]

# junta base original e incremento
chamadosTempoReal <- rbind(chamadosTempoReal, chamadosTempoReal[chamadosTempoRealIncremento,])
