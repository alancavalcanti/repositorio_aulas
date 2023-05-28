pacman::p_load(data.table, Hmisc, VIM)

#imputação numérica
ZA2880$v39 <- impute(ZA2880$v39, fun = median) # mediana
##imputei com mediana pois a variável de interess é character 


#testes de imputação
is.imputed(ZA2880$v39)
table(is.imputed(ZA2880$v39))

# imputação por instâncias /semelhança
#recarreguei a base
ZA2880v2 <- kNN(ZA2880)
