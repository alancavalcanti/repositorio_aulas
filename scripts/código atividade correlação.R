library(tidyverse)
pacman::p_load(corrplot, dplyr, ggplot2)

#retirando ano e o nome dos casos

base22 <- base_artigo_final_v4 %>% select(-casos)
base22 <- base22 %>% select(-Ano)

#selecionando apenas variaveis numericas

base22 <- base22[, sapply(base22, is.numeric)]

#plotando corrrelação
cor(base22, na.rm = T)


pairs(base22)

#plotando

baseCor <- cor(base22)
corrplot(baseCor, method = "number", order = 'alphabet')
corrplot(baseCor, order = 'alphabet') 
