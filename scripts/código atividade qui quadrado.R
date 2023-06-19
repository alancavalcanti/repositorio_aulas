#usando qui quadrado para bases nativas
pacman::p_load(data.table, ggplot2)

ios_table <- table(as.factor(ZA3910_v2_1_0$v37), as.factor(ZA3910_v2_1_0$party_lr))
ios_table

# dispersão
ggplot(ZA3910_v2_1_0) + aes(x = as.factor(v37), fill = as.factor(party_lr)) + geom_bar(position = "fill")


# TESTE QUI QUADRADO #
ios_table_test <- chisq.test(ios_table)
ios_table_test
ios_table_test$observed
ios_table_test$expected

# CORRPLOT DAS VARIÁVEIS #
corrplot(ios_table_test$residuals, is.cor = FALSE)

