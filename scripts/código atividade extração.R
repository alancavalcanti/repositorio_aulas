ls() # lista todos os objetos no R

# vamos ver quanto cada objeto está ocupando
itm <- "sinistrosRecifeRaw"

for (itm in ls()) { 
  print(formatC(c(itm, object.size(get(itm))), 
                format="d", 
                width=30), 
        quote=F)
}

# deletando todos os elementos, menos os listados: 
rm(list=(ls()[ls()!="sinistrosRecifeRaw"]))

save(sinistrosRecifeRaw, file = "sinistros_Recife.Rda")
