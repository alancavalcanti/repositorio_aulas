install.packages("ade4")
install.packages("arules")
install.packages("forcats")

library(ade4)
library(arules)
library(forcats)

#vendo estrutura da base
str(dataset_Facebook)


# converte elementos em fatores
for(i in 2:7 ) {
  dataset_Facebook[,i] <- as.factor(dataset_Facebook[,i])
}


#checando

str(dataset_Facebook)

# filtragem dos fatores

factor_face <- unlist(lapply(dataset_Facebook, is.factor))
face_factor <- dataset_Facebook[ , factor_face]

str(face_factor)

# One Hot Enconding
face_binary <- acm.disjonctif(face_factor)

#visualização da base 
View(face_binary)

#discretização: 
dataset_Facebook$like<- discretize(dataset_Facebook$like, method = 'interval', breaks = 3, labels = c('poucos', 'médios', 'muitos'))

#verificação 
View(dataset_Facebook)
