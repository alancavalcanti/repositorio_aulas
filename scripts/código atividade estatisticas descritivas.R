library(gmodels)
library(tidyverse)

install.packages("fBasics")

library(fBasics)

#analisando variável de enforcement de organizações internacionais


#frequências e %
table(ZA2880$v39)
prop.table(table(ZA2880$v39))

#média calculada tirando os na's pois a variável é character
#valor próximo de dois significa que a média das respostas se encaixa na resposta 2 (visão positiva de enforcement de organizações internacionais nesse caso)
mean(ZA2880$v39, na.rm = T)

#mediana
median(ZA2880$v39, na.rm = T)

#separatrizes
quantile(ZA2880$v39, probs=0.75, na.rm= T)
quantile(ZA2880$v39, probs=0.10, na.rm=T)
quantile(ZA2880$v39, probs=0.95, na.rm= T)

#boxplot
boxplot(ZA2880$v39, na.rm= T) 

#desvio padrão
sd(ZA2880$v39, na.rm = T)
plot(ZA2880$v39, na.rm = T) #por se tratar de uma variável character o gráfico ficou estranho

#summary
summary(ZA2880)

## Sumário descritivo completo das variáveis usando o pacote fBasics
pacman::p_load(fBasics)
basicStats(ZA2880[ , c(1:4)])

hist(ZA2880$v39, na.rm = T) # histograma - gráfico que permite conhecer a curva dos dados
