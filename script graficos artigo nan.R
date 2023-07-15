##############graficos

######graficos threat

#agregando dados
dados_agregados_e <- aggregate(cbind(v_positive_e_ios, positive_e_ios, neutral_e_ios, negative_e_ios,v_negative_e_ios) ~ Ano, data = base_artigo_final_v4, FUN = mean)
dados_agregados_c1 <- aggregate(cbind(v_positive_c1_ios, positive_c1_ios, neutral_c1_ios, negative_c1_ios,v_negative_c1_ios) ~ Ano, data = base_artigo_final_v4, FUN = mean)
dados_agregados_c2 <- aggregate(cbind(v_positive_c2_ios, positive_c2_ios, neutral_c2_ios, negative_c2_ios,v_negative_c2_ios) ~ Ano, data = base_artigo_final_v4, FUN = mean)

dados_agregados_c2_pp4 <- aggregate(cbind(v_positive_c2_ios, positive_c2_ios, neutral_c2_ios, negative_c2_ios,v_negative_c2_ios) ~ Ano, data = paises_populism4, FUN = mean)
dados_agregados_c2_papp4 <- aggregate(cbind(v_positive_c2_ios, positive_c2_ios, neutral_c2_ios, negative_c2_ios,v_negative_c2_ios) ~ Ano, data = paises_ausentes_populism4, FUN = mean)
dados_agregados_c2_pp3 <- aggregate(cbind(v_positive_c2_ios, positive_c2_ios, neutral_c2_ios, negative_c2_ios,v_negative_c2_ios) ~ Ano, data = paises_populism3, FUN = mean)
dados_agregados_c2_papp3 <- aggregate(cbind(v_positive_c2_ios, positive_c2_ios, neutral_c2_ios, negative_c2_ios,v_negative_c2_ios) ~ Ano, data = paises_ausentes_populism3, FUN = mean)

#fazendo graficos threat
###paises populistas da primeira mensuração
ggplot(data = dados_agregados_c2_pp3, aes(x = Ano)) +
  geom_line(aes(y = v_positive_c2_ios), color = "red", linetype = "solid", size = 1) +
  geom_line(aes(y = positive_c2_ios), color = "orange", linetype = "solid", size = 1) +
  geom_line(aes(y = neutral_c2_ios), color = "black", linetype = "solid", size = 1) +
  geom_line(aes(y = negative_c2_ios), color = "steelblue", linetype = "solid", size = 1) +
  geom_line(aes(y = v_negative_c2_ios), color = "blue", linetype = "solid", size = 1) +
  labs(title = "IO's Threat - Populists",
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

###paises nao populistas da primeira mensuração
ggplot(data = dados_agregados_c2_papp3, aes(x = Ano)) +
  geom_line(aes(y = v_positive_c2_ios), color = "red", linetype = "solid", size = 1) +
  geom_line(aes(y = positive_c2_ios), color = "orange", linetype = "solid", size = 1) +
  geom_line(aes(y = neutral_c2_ios), color = "black", linetype = "solid", size = 1) +
  geom_line(aes(y = negative_c2_ios), color = "steelblue", linetype = "solid", size = 1) +
  geom_line(aes(y = v_negative_c2_ios), color = "blue", linetype = "solid", size = 1) +
  labs(title = "IO's Threat - Non Populists",
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

###paises populistas da segunda mensuração
ggplot(data = dados_agregados_c2_pp4, aes(x = Ano)) +
  geom_line(aes(y = v_positive_c2_ios), color = "red", linetype = "solid", size = 1) +
  geom_line(aes(y = positive_c2_ios), color = "orange", linetype = "solid", size = 1) +
  geom_line(aes(y = neutral_c2_ios), color = "black", linetype = "solid", size = 1) +
  geom_line(aes(y = negative_c2_ios), color = "steelblue", linetype = "solid", size = 1) +
  geom_line(aes(y = v_negative_c2_ios), color = "blue", linetype = "solid", size = 1) +
  labs(title = "IO's Threat - Populists (AM)",
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

###paises nao populistas da segunda mensuração
ggplot(data = dados_agregados_c2_papp4, aes(x = Ano)) +
  geom_line(aes(y = v_positive_c2_ios), color = "red", linetype = "solid", size = 1) +
  geom_line(aes(y = positive_c2_ios), color = "orange", linetype = "solid", size = 1) +
  geom_line(aes(y = neutral_c2_ios), color = "black", linetype = "solid", size = 1) +
  geom_line(aes(y = negative_c2_ios), color = "steelblue", linetype = "solid", size = 1) +
  geom_line(aes(y = v_negative_c2_ios), color = "blue", linetype = "solid", size = 1) +
  labs(title = "IO's Threat - Non Populists (AM)",
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

########## graficos enforcement

#agregando dados

dados_agregados_e_pp4 <- aggregate(cbind(v_positive_e_ios, positive_e_ios, neutral_e_ios, negative_e_ios,v_negative_e_ios) ~ Ano, data = paises_populism4, FUN = mean)
dados_agregados_e_papp4 <- aggregate(cbind(v_positive_e_ios, positive_e_ios, neutral_e_ios, negative_e_ios,v_negative_e_ios) ~ Ano, data = paises_ausentes_populism4, FUN = mean)
dados_agregados_e_pp3 <- aggregate(cbind(v_positive_e_ios, positive_e_ios, neutral_e_ios, negative_e_ios,v_negative_e_ios) ~ Ano, data = paises_populism3, FUN = mean)
dados_agregados_e_papp3 <- aggregate(cbind(v_positive_e_ios, positive_e_ios, neutral_e_ios, negative_e_ios,v_negative_e_ios) ~ Ano, data = paises_ausentes_populism3, FUN = mean)

###paises populistas da primeira mensuração
ggplot(data = dados_agregados_e_pp3, aes(x = Ano)) +
  geom_line(aes(y = v_positive_e_ios), color = "blue", linetype = "solid", size = 1) +
  geom_line(aes(y = positive_e_ios), color = "steelblue", linetype = "solid", size = 1) +
  geom_line(aes(y = neutral_e_ios), color = "black", linetype = "solid", size = 1) +
  geom_line(aes(y = negative_e_ios), color = "orange", linetype = "solid", size = 1) +
  geom_line(aes(y = v_negative_e_ios), color = "red", linetype = "solid", size = 1) +
  labs(title = "Enforcement IO's - Populists",
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

###paises nao populistas da primeira mensuração
ggplot(data = dados_agregados_e_papp3, aes(x = Ano)) +
  geom_line(aes(y = v_positive_e_ios), color = "blue", linetype = "solid", size = 1) +
  geom_line(aes(y = positive_e_ios), color = "steelblue", linetype = "solid", size = 1) +
  geom_line(aes(y = neutral_e_ios), color = "black", linetype = "solid", size = 1) +
  geom_line(aes(y = negative_e_ios), color = "orange", linetype = "solid", size = 1) +
  geom_line(aes(y = v_negative_e_ios), color = "red", linetype = "solid", size = 1) +
  labs(title = "Enforcement IO's - Non Populists",
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

###paises populistas da segunda mensuração
ggplot(data = dados_agregados_e_pp4, aes(x = Ano)) +
  geom_line(aes(y = v_positive_e_ios), color = "blue", linetype = "solid", size = 1) +
  geom_line(aes(y = positive_e_ios), color = "steelblue", linetype = "solid", size = 1) +
  geom_line(aes(y = neutral_e_ios), color = "black", linetype = "solid", size = 1) +
  geom_line(aes(y = negative_e_ios), color = "orange", linetype = "solid", size = 1) +
  geom_line(aes(y = v_negative_e_ios), color = "red", linetype = "solid", size = 1) +
  labs(title = "Enforcement IO's - Populists (AM)",
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

###paises nao populistas da segunda mensuração
ggplot(data = dados_agregados_e_papp4, aes(x = Ano)) +
  geom_line(aes(y = v_positive_e_ios), color = "blue", linetype = "solid", size = 1) +
  geom_line(aes(y = positive_e_ios), color = "steelblue", linetype = "solid", size = 1) +
  geom_line(aes(y = neutral_e_ios), color = "black", linetype = "solid", size = 1) +
  geom_line(aes(y = negative_e_ios), color = "orange", linetype = "solid", size = 1) +
  geom_line(aes(y = v_negative_e_ios), color = "red", linetype = "solid", size = 1) +
  labs(title = "Enforcement IO's - Non Populists (AM)",
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


########graficos compliance

#agregando dados

dados_agregados_c1_pp4 <- aggregate(cbind(v_positive_c1_ios, positive_c1_ios, neutral_c1_ios, negative_c1_ios,v_negative_c1_ios) ~ Ano, data = paises_populism4, FUN = mean)
dados_agregados_c1_papp4 <- aggregate(cbind(v_positive_c1_ios, positive_c1_ios, neutral_c1_ios, negative_c1_ios,v_negative_c1_ios) ~ Ano, data = paises_ausentes_populism4, FUN = mean)
dados_agregados_c1_pp3 <- aggregate(cbind(v_positive_c1_ios, positive_c1_ios, neutral_c1_ios, negative_c1_ios,v_negative_c1_ios) ~ Ano, data = paises_populism3, FUN = mean)
dados_agregados_c1_papp3 <- aggregate(cbind(v_positive_c1_ios, positive_c1_ios, neutral_c1_ios, negative_c1_ios,v_negative_c1_ios) ~ Ano, data = paises_ausentes_populism3, FUN = mean)

###paises populistas da primeira mensuração
ggplot(data = dados_agregados_c1_pp3, aes(x = Ano)) +
  geom_line(aes(y = v_positive_c1_ios), color = "blue", linetype = "solid", size = 1) +
  geom_line(aes(y = positive_c1_ios), color = "steelblue", linetype = "solid", size = 1) +
  geom_line(aes(y = neutral_c1_ios), color = "black", linetype = "solid", size = 1) +
  geom_line(aes(y = negative_c1_ios), color = "orange", linetype = "solid", size = 1) +
  geom_line(aes(y = v_negative_c1_ios), color = "red", linetype = "solid", size = 1) +
  labs(title = "Compliance IO's - Populists",
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

###paises nao populistas da primeira mensuração
ggplot(data = dados_agregados_c1_papp3, aes(x = Ano)) +
  geom_line(aes(y = v_positive_c1_ios), color = "blue", linetype = "solid", size = 1) +
  geom_line(aes(y = positive_c1_ios), color = "steelblue", linetype = "solid", size = 1) +
  geom_line(aes(y = neutral_c1_ios), color = "black", linetype = "solid", size = 1) +
  geom_line(aes(y = negative_c1_ios), color = "orange", linetype = "solid", size = 1) +
  geom_line(aes(y = v_negative_c1_ios), color = "red", linetype = "solid", size = 1) +
  labs(title = "Compliance IO's - Non Populists",
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

###paises populistas da segunda mensuração
ggplot(data = dados_agregados_c1_pp4, aes(x = Ano)) +
  geom_line(aes(y = v_positive_c1_ios), color = "blue", linetype = "solid", size = 1) +
  geom_line(aes(y = positive_c1_ios), color = "steelblue", linetype = "solid", size = 1) +
  geom_line(aes(y = neutral_c1_ios), color = "black", linetype = "solid", size = 1) +
  geom_line(aes(y = negative_c1_ios), color = "orange", linetype = "solid", size = 1) +
  geom_line(aes(y = v_negative_c1_ios), color = "red", linetype = "solid", size = 1) +
  labs(title = "Compliance IO's - Populists (AM)",
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

###paises nao populistas da segunda mensuração
ggplot(data = dados_agregados_c1_papp4, aes(x = Ano)) +
  geom_line(aes(y = v_positive_c1_ios), color = "blue", linetype = "solid", size = 1) +
  geom_line(aes(y = positive_c1_ios), color = "steelblue", linetype = "solid", size = 1) +
  geom_line(aes(y = neutral_c1_ios), color = "black", linetype = "solid", size = 1) +
  geom_line(aes(y = negative_c1_ios), color = "orange", linetype = "solid", size = 1) +
  geom_line(aes(y = v_negative_c1_ios), color = "red", linetype = "solid", size = 1) +
  labs(title = "Compliance IO's - Non Populists (AM)",
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


#correlação 
cor.test(base_artigo_final_v3$populism3, base_artigo_final_v3$v_positive_e_ios)

##qui quadrado

partylr_eios_table_1995 <- table(ZA2880$v39, ZA2880$v269)
partylr_eios_table_1995
test_partylr_eios_1995 <- chisq.test(partylr_eios_table_1995) 
test_partylr_eios_1995$expected
test_partylr_eios_1995$observed
percetual <- prop.table(partylr_eios_table_1995)*100
percetual
partylr_eios_table <- table(ZA3910_v2_1_0$v43, ZA3910_v2_1_0$party_lr)
partylr_eios_table

test_partylr_eios <- chisq.test(partylr_eios_table)
test_partylr_eios
ZA3910_v2_1_0 <- ZA3910_v2_1_0 %>%
  mutate(v39_string = as.character(v39))

ZA3910_v2_1_0 <- ZA3910_v2_1_0 %>%
  mutate(partylr_string = as.character(party_lr))

p_value <- 2.2e-16
p_value_decimal <- format(p_value, scientific = FALSE)

######realizando teste t
grupo0 <- base_artigo_final_v4$v_positive_c2_ios[base_artigo_final_v4$populism4t == 0]
grupo1 <- base_artigo_final_v4$v_positive_c2_ios[base_artigo_final_v4$populism4t == 1]

resultado <- t.test(grupo0, grupo1)
print(resultado)


######graficos para países individuais

pais <- "Hungary"
pais_filtrados <- filter(base_artigo_final_v4, casos == pais)

ggplot(data = pais_filtrados, aes(x = Ano)) +
  geom_line(aes(y = v_positive_e_ios), color = "blue", linetype = "solid", size = 1) +
  geom_line(aes(y = positive_e_ios), color = "steelblue", linetype = "solid", size = 1) +
  geom_line(aes(y = neutral_e_ios), color = "black", linetype = "solid", size = 1) +
  geom_line(aes(y = negative_e_ios), color = "orange", linetype = "solid", size = 1) +
  geom_line(aes(y = v_negative_e_ios), color = "red", linetype = "solid", size = 1) +
  labs(title = "Enforcement IO's - Hungary",
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
  ) +
  geom_vline(xintercept = 2010, linetype = "dashed", color = "gray") +
  scale_x_continuous(limits = c(1995, 2013))

####c2 hungary

ggplot(data = pais_filtrados, aes(x = Ano)) +
  geom_line(aes(y = v_positive_c2_ios), color = "red", linetype = "solid", size = 1) +
  geom_line(aes(y = positive_c2_ios), color = "orange", linetype = "solid", size = 1) +
  geom_line(aes(y = neutral_c2_ios), color = "black", linetype = "solid", size = 1) +
  geom_line(aes(y = negative_c2_ios), color = "steelblue", linetype = "solid", size = 1) +
  geom_line(aes(y = v_negative_c2_ios), color = "blue", linetype = "solid", size = 1) +
  labs(title = " Threat IO's - Hungary",
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
  ) +
  geom_vline(xintercept = 2010, linetype = "dashed", color = "gray") +
  scale_x_continuous(limits = c(2003, 2013))

#construindo gráfico causal

# Criar o grafo causal
graph <- dagitty("dag {
                   Globalization -> Rejection_to_economic_consequences
                   Rejection_to_economic_consequences -> Rising_of_Populist_Leaders
                   Rejection_to_economic_consequences -> Negative_Attitudes_to_IOs
                   Rising_of_Populist_Leaders -> Negative_Attitudes_to_IOs
                 }")

# Plotar o gráfico causal com estilo
plot(graph, node.size = 10, node.fontsize = 12, edge.arrowhead.size = 0.5, edge.width = 2, node.border = "black", node.color = "lightblue", edge.color = "gray")


library(dagitty)

# Criar o grafo causal
graph <- dagitty("dag {
                   Globalization -> Rejection_to_economic_consequences
                   Rejection_to_economic_consequences -> Rising_of_Populist_Leaders
                   Rejection_to_economic_consequences -> Negative_Attitudes_to_IOs
                   Rising_of_Populist_Leaders -> Negative_Attitudes_to_IOs
                 }")

# Plotar o gráfico causal com estilo aprimorado
plot(graph, node.size = 12, node.fontsize = 14, node.border = "black", node.color = "#A8D8E8", node.text.color = "black", edge.arrowhead.size = 0.7, edge.width = 2, edge.color = "#707070", main = "Gráfico Causal")

# Adicionar rótulos personalizados aos nós
text(x = c(0.5, 0.5, 0.15, 0.85), y = c(0.85, 0.15, 0.5, 0.5), labels = c("Globalization", "Rejection to Economic Consequences", "Rising of Populist Leaders", "Negative Attitudes to IOs"), cex = 1.2)

# Adicionar título ao gráfico
title(main = "Relações Causais", cex.main = 1.2)


