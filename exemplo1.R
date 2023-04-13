summary(iris)


#criando data frame

#primeiro, vamos instalar um novo pacote: eeptools
install.packages('eeptools')

#depois, vamos chamar o pacote
library(eeptools)

# vetor com nome dos alunos
nomeAluno <- c("Alan", "Rayanne", "Rennan", "Renata", "Eveline", "Isabela")


# vetor com datas de nascimento
nascimentoAluno <- as.Date(c("2000-07-28", "1992-03-21", "1993-07-20", "1989-07-20", "1994-01-25", "1985-12-15"))

# vetor com as idades
idadeAluno <- round( age_calc( nascimentoAluno, units = 'years')) # Idade usando a função age_calc do pacote eeptools e a função round (arredondar)

# data.frame com base nos vetores
listaAlunos <- data.frame(
  nome = nomeAluno,      # Nome 
  dataNascimento = nascimentoAluno, # Data de nascimento
  idade = idadeAluno) # idade

save(listaAlunos, file = "exemplo_listaAlunos.Rda")  




#utilizando função apply para construir histograma da base de dados de um artigo que estou escrevendo
sapply(base_artigo[ , 16:18], hist)
