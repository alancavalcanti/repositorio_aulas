library(dplyr)
library(ggplot2)
#salvando a base
save(base_artigo_final_v2, file = "base_populists_final_v2.Rda")
save(base_artigo_final_v4, file = "base_populists_final_v4.Rda")

#transformando os casos em fatores
base_artigo_final_v4$casos <- as.factor(base_artigo_final_v4$casos)
base_artigo_final_v4$populism4 <- as.double(base_artigo_final_v4$populism4)

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

paises_populism1 <- subset(base_artigo_final_v2, populism1 == 1)$casos
paises_ausentes_populism1 <- subset(base_artigo_final_v2, populism1 == 0)$casos

#países governados pela m2 de populismo

paises_populism2 <- subset(base_artigo_final_v2, populism2 == 1)$casos
paises_ausentes_populism2 <- subset(base_artigo_final_v2, populism2 == 0)$casos
paises_populism2

####OU
paises_populism4 <- filter(base_artigo_final_v4, populism4 == 1)
paises_ausentes_populism4 <- filter(base_artigo_final_v4, populism4 == 0)
paises_populism3 <- filter(base_artigo_final_v4, populism3 == 1)
paises_ausentes_populism3 <- filter(base_artigo_final_v4, populism3 == 0)
paises_populism3
paises_ausentes_populism3

#####removendo bulgaria
base_artigo_final_v2 <- base_artigo_final_v2 %>%
  mutate(populism3 = ifelse(casos == "Poland" & Ano %in% c(1995, 2003), 0, populism3))

base_artigo_final_v2 <- base_artigo_final_v2 %>%
  mutate(populism4 = ifelse(casos == "Poland" & Ano %in% c(1995, 2003), 0, populism4))

###OU
paises_populism2 <- filter(base_artigo_final_v2, populism2 == 1)
paises_ausentes_populism2 <- filter(base_artigo_final_v2, populism2 == 0)
paises_populism2
paises_ausentes_populism2

###separando bases com mensuração de populismo de países completos


#tirando médias da mensuração 1 de populismo
     ###very positive enforcement
mean(paises_populism3$v_positive_e_ios, na.rm = T)
mean(paises_ausentes_populism3$v_positive_e_ios, na.rm = T)
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

ggplot(data = base_artigo_final_v2, aes(x = Ano, y = v_negative_e_ios, color = casos, group = casos)) +
  geom_line()

ggplot(data = paises_populism1, aes(x = Ano, y = v_negative_e_ios, color = casos, group = casos)) +
  geom_line()

ggplot(data = paises_populism3, aes(x = Ano, y = v_negative_e_ios, color = casos, group = casos)) +
  geom_path() +
  scale_x_continuous(limits = c(1995, 2013)) +
  scale_y_continuous(limits = c(0, 50))

#construindo gráficos gerais da base

dados_agregados_pp3 <- aggregate(v_negative_e_ios ~ Ano, data = paises_populism3, FUN = mean)
dados_agregados_papp3 <- aggregate(v_positive_e_ios ~ Ano, data= paises_ausentes_populism3, FUN = mean)

ggplot(data = dados_agregados_pp3, aes(x = Ano, y = positive_e_ios)) +
  geom_line() + scale_x_continuous(limits = c(1995, 2013)) +
  scale_y_continuous(limits = c(0, 50))

    ######deixando gráfico geral mais bonito
ggplot(data = dados_agregados_papp3, aes(x = Ano, y = v_positive_e_ios)) +
  geom_line(color = "red", size = 1) + 
  scale_x_continuous(limits = c(1995, 2013)) +
  scale_y_continuous(limits = c(0, 100)) +
  labs(x = "Ano", y = "Very Positive EA", title = "Enforcement to IO's - Non Populist Countries") +
  theme_minimal() +
  theme(plot.title = element_text(size = 16, face = "bold"),
        axis.text = element_text(size = 12),
        axis.title = element_text(size = 14),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())


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
dados_agregados_papp4 <- aggregate(cbind(v_positive_e_ios, positive_e_ios, neutral_e_ios, negative_e_ios,v_negative_e_ios) ~ Ano, data = paises_ausentes_populism4, FUN = mean)
dados_agregados_c1_papp3 <- aggregate(cbind(v_positive_c1_ios, positive_c1_ios, neutral_c1_ios, negative_c1_ios,v_negative_c1_ios) ~ Ano, data = paises_ausentes_populism3, FUN = mean)
dados_agregados_c2 <- aggregate(cbind(v_positive_c2_ios, positive_c2_ios, neutral_c2_ios, negative_c2_ios,v_negative_c2_ios) ~ Ano, data = base_artigo_final_v2, FUN = mean)

dados_agregados_c1_pp4 <- aggregate(cbind(v_positive_c1_ios, positive_c1_ios, neutral_c1_ios, negative_c1_ios,v_negative_c1_ios) ~ Ano, data = paises_populism4, FUN = mean)
dados_agregados_c1_papp4 <- aggregate(cbind(v_positive_c1_ios, positive_c1_ios, neutral_c1_ios, negative_c1_ios,v_negative_c1_ios) ~ Ano, data = paises_ausentes_populism4, FUN = mean)
dados_agregados_c2_pp4 <- aggregate(cbind(v_positive_c2_ios, positive_c2_ios, neutral_c2_ios, negative_c2_ios,v_negative_c2_ios) ~ Ano, data = paises_populism4, FUN = mean)
dados_agregados_c2_papp4 <- aggregate(cbind(v_positive_c2_ios, positive_c2_ios, neutral_c2_ios, negative_c2_ios,v_negative_c2_ios) ~ Ano, data = paises_ausentes_populism4, FUN = mean)



dados_agregados_c1 <- aggregate(cbind(v_positive_c1_ios, positive_c1_ios, neutral_c1_ios, negative_c1_ios,v_negative_c1_ios) ~ Ano, data = base_artigo_final_v2, FUN = mean)

#consertando gráfico c2

ggplot(data = dados_agregados_c2_papp4, aes(x = Ano)) +
  geom_line(aes(y = v_positive_c2_ios), color = "red", linetype = "solid", size = 1) +
  geom_line(aes(y = positive_c2_ios), color = "orange", linetype = "solid", size = 1) +
  geom_line(aes(y = neutral_c2_ios), color = "black", linetype = "solid", size = 1) +
  geom_line(aes(y = negative_c2_ios), color = "steelblue", linetype = "solid", size = 1) +
  geom_line(aes(y = v_negative_c2_ios), color = "blue", linetype = "solid", size = 1) +
  labs(title = "IO's Threat - Non Populists (AM)",
       x = "Ano",
       y = "%") +
  theme_minimal() +
  scale_color_manual(
    values = c("blue", "steelblue", "black", "orange", "red"),
    labels = c("V. Positive", "Positive", "Neutral", "Negative", "V. Negative"),
    name = "Categorias"
  ) +
  theme(
    plot.title = element_text(size = 16, face = "bold"),
    axis.text = element_text(size = 12),
    axis.title = element_text(size = 14),
    legend.title = element_text(size = 14, face = "bold"),
    legend.text = element_text(size = 12),
    legend.position = "bottom"
  )

# Plotar o gráfico de linha com várias variáveis agregadas
ggplot(data = dados_agregados_c1, aes(x = Ano)) +
  geom_line(aes(y = v_positive_e_ios), color = "blue") +
  geom_line(aes(y = positive_e_ios), color = "steelblue") +
  geom_line(aes(y = neutral_e_ios), color = "black") +
  geom_line(aes(y = negative_e_ios), color = "orange") +
  geom_line(aes(y = v_negative_e_ios), color = "red") +
  labs(title = "Compliance with IO's - General Pattern",
       x = "Ano",
       y = "%") + theme_minimal()

#########deixando ele mais bonit
ggplot(data = dados_agregados_c2, aes(x = Ano)) +
  geom_line(aes(y = v_positive_c2_ios), color = "blue", linetype = "solid", size = 1) +
  geom_line(aes(y = positive_c2_ios), color = "steelblue", linetype = "solid", size = 1) +
  geom_line(aes(y = neutral_c2_ios), color = "black", linetype = "solid", size = 1) +
  geom_line(aes(y = negative_c2_ios), color = "orange", linetype = "solid", size = 1) +
  geom_line(aes(y = v_negative_c2_ios), color = "red", linetype = "solid", size = 1) +
  labs(title = "Threat IO's - General Pattern",
       x = "Year",
       y = "%") +
  theme_minimal() +
  scale_color_manual(
    values = c("blue", "steelblue", "black", "orange", "red"),
    labels = c("V. Positive", "Positive", "Neutral", "Negative", "V. Negative"),
    name = "Categorias"
  ) +
  theme(
    plot.title = element_text(size = 16, face = "bold"),
    axis.text = element_text(size = 12),
    axis.title = element_text(size = 14),
    legend.title = element_text(size = 14, face = "bold"),
    legend.text = element_text(size = 12),
    legend.position = "bottom"
  )



#tentando criar graficos de países individuais
pais <- "Czech Republic"
pais_filtrados <- filter(base_artigo_final_v2, casos == pais)

grafico <- ggplot(data = pais_filtrados, aes(x = Ano, y = neutral_e_ios)) +
  geom_line()

print(grafico)


ano_tratamento <- 2005

grafico <- ggplot(data = pais_filtrados, aes(x = Ano, y = neutral_e_ios)) +
  geom_line() +
  geom_vline(xintercept = ano_tratamento, linetype = "dashed", color = "red", size = 1)


ggplot(data = pais_filtrados, aes(x = Ano)) +
  geom_line(aes(y = v_positive_e_ios), color = "blue", linetype = "solid", size = 1) +
  geom_line(aes(y = positive_e_ios), color = "steelblue", linetype = "solid", size = 1) +
  geom_line(aes(y = neutral_e_ios), color = "black", linetype = "solid", size = 1) +
  geom_line(aes(y = negative_e_ios), color = "orange", linetype = "solid", size = 1) +
  geom_line(aes(y = v_negative_e_ios), color = "red", linetype = "solid", size = 1) +
  labs(title = "Eforcement - Czech Republic",
       x = "Ano",
       y = "%") +
  theme_minimal() +
  scale_color_manual(
    values = c("blue", "steelblue", "black", "orange", "red"),
    labels = c("V. Positive", "Positive", "Neutral", "Negative", "V. Negative"),
    name = "Categorias"
  ) +
  theme(
    plot.title = element_text(size = 16, face = "bold"),
    axis.text = element_text(size = 12),
    axis.title = element_text(size = 14),
    legend.title = element_text(size = 14, face = "bold"),
    legend.text = element_text(size = 12),
    legend.position = "bottom"
  )


######### grafico de pais individual com ano de tratamento
ggplot(data = pais_filtrados, aes(x = Ano)) +
  geom_line(aes(y = v_positive_c2_ios), color = "red", linetype = "solid", size = 1) +
  geom_line(aes(y = positive_c2_ios), color = "orange", linetype = "solid", size = 1) +
  geom_line(aes(y = neutral_c2_ios), color = "black", linetype = "solid", size = 1) +
  geom_line(aes(y = negative_c2_ios), color = "steelblue", linetype = "solid", size = 1) +
  geom_line(aes(y = v_negative_c2_ios), color = "blue", linetype = "solid", size = 1) +
  labs(title = "Compliance (SM) with IO's - Czech Republic",
       x = "Ano",
       y = "%") +
  theme_minimal() +
  scale_color_manual(
    values = c("blue", "steelblue", "black", "orange", "red"),
    labels = c("V. Positive", "Positive", "Neutral", "Negative", "V. Negative"),
    name = "Categorias"
  ) +
  theme(
    plot.title = element_text(size = 16, face = "bold"),
    axis.text = element_text(size = 12),
    axis.title = element_text(size = 14),
    legend.title = element_text(size = 14, face = "bold"),
    legend.text = element_text(size = 12),
    legend.position = "bottom"
  ) +
  geom_vline(xintercept = 2002, linetype = "dashed", color = "gray") +
  scale_x_continuous(limits = c(2001, 2013))


####teste de hipótese de correlação 



