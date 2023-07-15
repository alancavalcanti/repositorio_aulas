library(tidyverse)
library(dplyr)
library(readr)
install.packages("pacman")
library(sjPlot)
library(pacman)
install.packages("VIM")
library(ordinal)
pacman:: p_load(car, gvlma, lm.beta, lmtest, MASS, sandwich)
install.packages("ordinal")


#selecionando variáveis da base

ZA3910_v2_1_0 <- select(ZA3910_v2_1_0, C_ALPHAN, COUNTRY, party_lr, wrkst, educyrs, age, sex, income, rincome, v56, v37)

#criando variável de mensuração 1 de populismo


ZA3910_v2_1_0 <- ZA3910_v2_1_0 %>% 
  mutate(populism1 = ifelse(COUNTRY %in% c("23", "22", "24", "21", "27", "42", "41", "36"), 1, 0))

#criando variável de mensuração 2 de populismo

ZA3910_v2_1_0 <- ZA3910_v2_1_0 %>% 
  mutate(populism2 = ifelse(COUNTRY %in% c("23", "14", "22", "24", "21", "27", "42", "41", "36"), 1, 0))


#salvando base
save(ZA3910_v2_1_0, file = "base_atividade_ad.Rda")

#imputando os valores NA na base
base_limpa<- na.omit(ZA3910_v2_1_0)
base_imputada <- kNN(ZA3910_v2_1_0)


#regressão linear 

regEnfor <- lm(v37 ~ populism1 + sex + party_lr+ wrkst+ educyrs+ age+ income+ rincome+ v56, data = ZA3910_v2_1_0)
summary(regEnfor)

regEnfor2 <- lm(v37 ~ populism1 + sex + party_lr+ wrkst+ educyrs+ age+ income+ rincome+ v56, data = base_limpa)


#plotando gráfico de coeficientes
plot_model(regEnfor)

#fazendo regressão beta
regEnfor_beta <- lm.beta(regEnfor)
regEnfor_beta


#fazendo regressão ordinal

regEnfor_ord <- clm(v37 ~ populism1 + sex + party_lr+ wrkst+ educyrs+ age+ income+ rincome+ v56, data = ZA3910_v2_1_0)
summary(regEnfor_ord)

shapiro.test(residuals(ZA3910_v2_1_0))
