pacman::p_load(data.table, funModeling, tidyverse) 

#identificando e removendo valores ausentes
status(ZA2880)

# Complete-case analysis – listwise deletion
dim(za2880Completo <- na.omit(ZA2880)) # deixa apenas os casos completos, mas vale a pena?
#####não valeu a pena pois fiquei com 0 observações


# Variação de Complete-case analysis – listwise deletion
dim(za2880Completo <- ZA2880 %>% filter(!is.na(ZA2880$v39)))

#matriz sombra
ZA2880Sombra <- as.data.frame(abs(is.na(ZA2880))) 

ZA2880Sombra <- ZA2880Sombra[which(sapply(ZA2880Sombra, sd) > 0)] # mantém variáveis com NA
round(cor(ZA2880Sombra), 3) # calcula correlações

#chamando variavel pais de volta
ZA2880Sombra <- cbind(ZA2880Sombra, pais = ZA2880$v3) # trazemos uma variável de interesse (pais) de volta pro frame
ZA2880final <- ZA2880Sombra %>% group_by(pais) %>% summarise(across(everything(), list(sum))) # onde os NAs se concentram por pais
