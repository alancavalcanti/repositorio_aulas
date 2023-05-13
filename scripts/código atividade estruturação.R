library(data.table)
library(dplyr)
library(tidyverse)

latin_america_countries<-c("Argentina", "Brazil", "Bolivia", "Chile", "Colombia", "Costa Rica", "Cuba", "Dominican Republic", "Ecuador", "El Salvador", "Guatemala", "Haiti", "Honduras", "Mexico", "Nicaragua", "Panama", "Paraguay", "Peru", "Uruguay", "Venezuela") # vetor que identifica países latino americanos

latin_america<- base %>% filter(country_name %in% latin_america_countries) 

mlatin <- latin_america %>% group_by(country_name) %>% mutate(row = row_number()) %>% select(country_name, year, v2x_polyarchy) # cria matriz dos países, agrupando por local, criando uma nova linha com index e selecionando apenas algumas variáveis

# filtra dados para garantir que todos os países tenham mesmo nro de casos
result <- mlatin %>% group_by(country_name) %>% filter(v2x_polyarchy == max(v2x_polyarchy))
mlatin <- mlatin %>% filter(v2x_polyarchy<=min(result$v2x_polyarchy)) 

# pivota o data frame de long para wide
mlatinw <- mlatin %>% pivot_wider(names_from = year, values_from = v2x_polyarchy)%>% remove_rownames %>% column_to_rownames(var="country_name")
