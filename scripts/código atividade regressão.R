### CARREGANDO PACOTES ###
pacman::p_load(car, gvlma, lm.beta, lmtest, MASS, sandwich)
library(pacman)
install.packages("pacman")

### REGRESSÃO FERTILIDADE - BASE SWISS
regAss <- lm(Assault ~ ., data = USArrests) # ESTIMANDO A REGRESSÃO
summary(regAss) # SUMÁRIO
regrAss <- rlm(Assault ~ . -Examination, data = USArrests)
summary(regAss) # SUMÁRIO
lm.beta(regAss) # COEFICIENTES PADRONIZADOS

# Stepwise #
regAssBack <- step(lm(Assault ~ ., data = USArrests), direction = 'backward') # de trás pra frente
summary(regSwissBack)
regAssForw <- step(lm(Assault ~ ., data = USArrests), direction = 'forward') # do início pro fim
summary(regSwissForw)
regAssBoth <- step(lm(Assault ~ ., data = USArrests), direction = 'both') # nos dois sentidos
summary(regSwissBoth)

### VERIFICAÇÃO DOS PRESSUPOSTOS ###
# normalidade dos resíduos
shapiro.test(residuals(regAss))
plot(regAss, which=1, col=c("blue")) # resíduos x ajuste
plot(regAss, which=2, col=c("red")) # Q-Q Plot
plot(regAss, which=5, col=c("blue"))  # Observações Influentes

#= Correção seria retirar as observações influentes =#

# inflação da variância / multicolinearidade
vif(regAss)
barplot(vif(regAss), main = "VIF Values", horiz = FALSE, col = "steelblue", ylim = c(0,5))
abline(h = 5, lwd = 3, lty = 2)

#= Correção seria usar apenas uma das variáveis correlacionadas =#

# homocedasticidade (H0 = homocedasticidade)
bptest(regAss) # teste de homocedasticidade
plot(regAss, which=3, col=c("blue"))  # Scale-Location Plot

#= Correção seria usar estimativas robustas =#
regAss$robse <- vcovHC(regAss, type = "HC1")
coeftest(regAss, regAss$robse)