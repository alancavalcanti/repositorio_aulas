library(data.table)
library(dplyr)
library(tidyverse)
library(funModeling) 

general_data <- fread("https://covid.ourworldindata.org/data/owid-covid-data.csv") # carrega dados de covid19 no mundo

pt_countries <-c("Portugal", "Brazil", "Cape Verde")

pt_countries <- general_data %>% filter(location %in% pt_countries) # filtra casos apenas no vetor

pt_countries <- pt_countries %>% select(location, new_cases, new_deaths)

status(pt_countries) # estrutura dos dados (missing etc)
freq(pt_countries) # frequência das variáveis fator
plot_num(pt_countries) # exploração das variáveis numéricas
profiling_num(pt_countries) # estatísticas das variáveis numéricas

pt_countries %>% filter(new_cases < 0)

pt_countries <- pt_countries %>% filter(new_cases>=0)


#limpando missings da base principal

install.packages(tidyr)
library(tidyverse)

status(general_data)
missmap(general_data)
base_sem_na <- drop_na(general_data$new_cases)
