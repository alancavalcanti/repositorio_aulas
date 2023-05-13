library(dplyr)

load("base_strom.Rda")
base <- x
  
# sumários
count(base, gdp_grow) 

# sumários com agrupamentos
base %>% group_by(constraining_nm_IDC) %>% summarise(avg = mean(gdp_grow))

# ordenar casos
arrange(base, constraining_nm_IDC) # ascendente

# seleção de colunas
base %>% select(ccode, constraining_nm_IDC, dispersive_nm_IDC, inclusive_nm_IDC, gdp_grow) 

