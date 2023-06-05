#histograma

base_artigo_final %>% ggplot(aes(x = positive_e_ios)) + geom_histogram()

#densidade
base_artigo_final %>% ggplot(aes(x = positive_e_ios)) + geom_density()

#dispersão
base_artigo_final %>% ggplot(aes(x = positive_e_ios, y = casos)) + geom_point()

#