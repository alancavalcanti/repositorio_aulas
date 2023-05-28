library(tidyverse)


# Gráfico de Caixas Multivariado
base_artigo_v1 %>% ggplot(aes(y = casos, x = v_positive_e_ios)) + geom_boxplot()

# Histograma
base_artigo_v1 %>% ggplot(aes(x = v_positive_e_ios)) + geom_histogram()


# Séries Temporais
base_artigo_v1 %>% group_by(casos) %>% summarise(v_positive_e_ios = sum(v_positive_e_ios)) %>% ggplot(aes(x = Ano, y = v_positive_e_ios)) + geom_line()

# Barras
defesaBrasilLong %>% ggplot(aes(x = Ano, y = Valor)) + geom_bar(stat = "identity")

# Dispersão
defesaBrasilLong %>% ggplot(aes(x = Ano, y = Valor)) + geom_point()