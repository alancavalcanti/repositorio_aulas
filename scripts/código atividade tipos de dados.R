
vrFactor <- factor(c("democratic", "autocratic"))
levels(vrFactor)

#base foi aberta pelo file e possuia uma variável dummie de democracia ou autocracia

recode <- c(democratic = 1, autocratic = 0)

(democracy_v4_0$democracy <- factor(democracy_v4_0$democracy, levels = recode, labels = names(recode)))

