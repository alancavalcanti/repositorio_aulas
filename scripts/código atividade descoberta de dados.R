library(tidyverse) 
install.packages("funModeling")
library(funModeling)


glimpse(base) # olhada nos dados
status(base) # estrutura dos dados (missing etc)
freq(base) # frequência das variáveis fator
plot_num(base$gdp_grow) # exploração das variáveis numéricas
profiling_num(base) # estatísticas das variáveis numéricas
