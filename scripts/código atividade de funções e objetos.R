#atitivade de objetos e funções no R

#criando um vetor

vetorExemplo <- c(1:200)
str(vetorExemplo) #mostrando a complexidade do vetor

#criando um objeto através de uma função de regressão. Usei uma base de dados específica e uma variável dela

regExemplo <- lm(dispersive_nm_IDC ~ ., x)
str(regExemplo) #mostrando a complexidade do objeto criado pela função de regressão
