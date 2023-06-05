library(dplyr)
library(ggplot2)
#salvando a base
save(base_artigo_final, file = "base_populists_final.Rda")

#transformando os casos em fatores
base_artigo_final$casos <- as.factor(base_artigo_final$casos)

#fazendo gráficos individuais
pais_desejado <- "Hungary"

dados_artigo <- subset(base_artigo_v1, casos==pais_desejado)

ggplot(data = dados_artigo, aes(x = Ano, y = v_negative_e_ios)) +
  geom_line() +
  labs(x = "Data", y = "Enforcment") +
  ggtitle("Enforcment muito negativo hungria") +
  theme_minimal()

ggplot(data = dados_artigo, aes(x = Ano, y = positive_e_ios)) +
  geom_line() +
  labs(x = "Data", y = "Enforcment") +
  ggtitle("Enforcment positivo hungria") +
  theme_minimal()

###agregando países baseados na dummie de populismo

#países governados pela m1 de populismo

paises_populism1 <- subset(base_artigo_final, populism1 == 1)$casos
paises_ausentes_populism1 <- subset(base_artigo_final, populism1 == 0)$casos

#países governados pela m2 de populismo

paises_populism2 <- subset(base_artigo_final, populism2 == 1)$casos
paises_ausentes_populism2 <- subset(base_artigo_final, populism2 == 0)$casos
paises_populism2

####OU
paises_populism1 <- filter(base_artigo_final, populism1 == 1)
paises_ausentes_populism1 <- filter(base_artigo_final, populism1 == 0)
paises_populism1
paises_ausentes_populism1

paises_populism1 <- subset(base_artigo_final, populism1==1)

###OU
paises_populism2 <- filter(base_artigo_final, populism2 == 1)
paises_ausentes_populism2 <- filter(base_artigo_final, populism2 == 0)
paises_populism2
paises_ausentes_populism2


#tirando médias da mensuração 1 de populismo
     ###very positive enforcement
mean(paises_populism1$v_positive_e_ios)
mean(paises_ausentes_populism1$v_positive_e_ios, na.rm = T)
     ###positive enforcement
mean(paises_populism1$positive_e_ios)
mean(paises_ausentes_populism1$positive_e_ios, na.rm = T)
     ###neutral enforcement
mean(paises_populism1$neutral_e_ios)
mean(paises_ausentes_populism1$neutral_e_ios, na.rm = T)
     ###negative enforcement
mean(paises_populism1$negative_e_ios)
mean(paises_ausentes_populism1$negative_e_ios, na.rm = T)
     ###very negative enforcement
mean(paises_populism1$v_negative_e_ios)
mean(paises_ausentes_populism1$v_negative_e_ios, na.rm = T)


#tirando medias mensuração 2 de populismo
mean(paises_populism2$positive_e_ios)
mean(paises_ausentes_populism2$positive_e_ios, na.rm = T)

#graficos para países especificos

dados_slovakia <- subset(paises_populism1, casos == "Slovakia")

ggplot(data = dados_slovakia, aes(x = Ano, y = v_negative_e_ios)) +
  geom_line() + scale_x_continuous(limits = c(1995, 2013)) +
  scale_y_continuous(limits = c(0, 50))


#tentando criar gráficos

paises_populism1$casos <- as.factor(paises_populism1$casos)

ggplot(data = base_artigo_final, aes(x = Ano, y = v_negative_e_ios, color = casos, group = casos)) +
  geom_line()

ggplot(data = paises_populism1, aes(x = Ano, y = v_negative_e_ios, color = casos, group = casos)) +
  geom_line()

ggplot(data = paises_populism1, aes(x = Ano, y = v_negative_e_ios, color = casos, group = casos)) +
  geom_path() +
  scale_x_continuous(limits = c(1995, 2013)) +
  scale_y_continuous(limits = c(0, 50))

#construindo gráficos gerais da base

dados_agregados <- aggregate(v_positive_e_ios ~ Ano, data = base_artigo_final, FUN = mean)

ggplot(data = dados_agregados, aes(x = Ano, y = v_positive_e_ios)) +
  geom_line() + scale_x_continuous(limits = c(1995, 2013)) +
  scale_y_continuous(limits = c(0, 50))


#deixando o gráfico mais bonito
ggplot(data = dados_agregados, aes(x = Ano, y = v_positive_e_ios)) +
  geom_line(color = "blue") + 
  labs(title = "Very Positive Enforcement Attitudes - General Pattern",
       x = "Ano",
       y = "% Very Positive Enforcement to IO's Attitudes") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        legend.position = "bottom") +scale_x_continuous(limits = c(1995, 2013)) +
  scale_y_continuous(limits = c(0, 50))


 ####positive enforcement attitudes

dados_agregados <- aggregate(v_negative_e_ios ~ Ano, data = base_artigo_final, FUN = mean)

ggplot(data = dados_agregados, aes(x = Ano, y = v_negative_e_ios)) +
  geom_line(color = "red") + 
  labs(title = "Very Negative Enforcement Attitudes - General Pattern",
       x = "Ano",
       y = "% Very Negative Enforcement to IO's Attitudes") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        legend.position = "bottom") +scale_x_continuous(limits = c(1995, 2013)) +
  scale_y_continuous(limits = c(0, 50))


#grafico unico com várias variáveis agregadas

library(ggplot2)

# Agregar as médias das variáveis por ano
dados_agregados <- aggregate(cbind(v_positive_e_ios, positive_e_ios, neutral_e_ios, negative_e_ios,v_negative_e_ios) ~ Ano, data = base_artigo_final, FUN = mean)


# Plotar o gráfico de linha com várias variáveis agregadas
ggplot(data = dados_agregados, aes(x = Ano)) +
  geom_line(aes(y = v_positive_e_ios), color = "purple") +
  geom_line(aes(y = positive_e_ios), color = "blue") +
  geom_line(aes(y = neutral_e_ios), color = "black") +
  geom_line(aes(y = negative_e_ios), color = "orange") +
  geom_line(aes(y = v_negative_e_ios), color = "red") +
  labs(title = "Enforcement to IO's - General Pattern",
       x = "Ano",
       y = "%") + theme_minimal()

