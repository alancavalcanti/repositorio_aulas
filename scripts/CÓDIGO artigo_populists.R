install.packages("gmodels")
library(gmodels)
library(tidyverse)

#pegando porcentagens da variável de enforcment 
tab_v36_1995 <- with(ZA2880, table(ZA2880$v3, ZA2880$v39))
prop.table(tab_v36_1995, 1)*100

tab_v37_2003 <- with(ZA3910_v2_1_0, table(ZA3910_v2_1_0$C_ALPHAN, ZA3910_v2_1_0$v37))
prop.table(tab_v37_2003, 1)*100

tab_v36_2013 <- with(ZA5950_v2_0_0, table(ZA5950_v2_0_0$C_ALPHAN, ZA5950_v2_0_0$V36))
prop.table(tab_v36_2013, 1)*100

#pegando porcentagens das variáveis de compliance 
tab_v43_2003 <- with(ZA3910_v2_1_0, table(ZA3910_v2_1_0$C_ALPHAN, ZA3910_v2_1_0$v43))
prop.table(tab_v43_2003, 1)*100

tab_v44_2003 <- with(ZA3910_v2_1_0, table(ZA3910_v2_1_0$C_ALPHAN, ZA3910_v2_1_0$v44))
prop.table(tab_v44_2003, 1)*100

tab_v42_2013 <- with(ZA5950_v2_0_0, table(ZA5950_v2_0_0$C_ALPHAN, ZA5950_v2_0_0$V42))
prop.table(tab_v42_2013, 1)*100

tab_v43_2013 <- with(ZA5950_v2_0_0, table(ZA5950_v2_0_0$C_ALPHAN, ZA5950_v2_0_0$V43))
prop.table(tab_v43_2013, 1)*100


tab_v43_2003

save(base_artigo_v1, file = "artigo_populists_v2.Rda")


plot(tab_v36_1995)

