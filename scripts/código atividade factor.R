#criando fatores de países democráticos

democratic <- c(0, 1, 1, 0, 0, 1, 1, 0, 0, 1)
recode <- c(democracy = 1, autocracy = 0)
(democratic <- factor(democratic, levels = recode, labels = names(recode)))

democratic


