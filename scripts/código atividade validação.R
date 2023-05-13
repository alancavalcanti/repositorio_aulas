pacman::p_load(data.table, dplyr, tidyverse, validate)

install.packages("validate")

general_data <- fread("https://covid.ourworldindata.org/data/owid-covid-data.csv") # carrega dados de covid19 no mundo

pt_countries <-c("Portugal", "Brazil", "Cape Verde")
pt_countries <- general_data %>% filter(location %in% pt_countries) # filtra casos apenas no vetor

pt_countries <- pt_countries %>% select(location, new_cases, new_deaths)

regras_pt_countries <- validator(new_cases >= 0, new_deaths >= 0)

validacaopt_countries <- confront(pt_countries, regras_pt_countries)

summary(validacaopt_countries)

plot(validacaopt_countries)
