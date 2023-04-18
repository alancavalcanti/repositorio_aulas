#bootstraping

sample(x$gdp_grow, 100, replace = FALSE)

set.seed(412)

bootstrapGDP <- replicate(10, sample(x$gdp_grow, 10, replace = TRUE))
bootstrapGDP


mediaBootsGDP10 <- replicate(10, mean(sample(x$gdp_grow, 10, replace = TRUE))) 
mediaBootsGDP50 <- replicate(50, mean(sample(x$gdp_grow, 10, replace = TRUE)))
mediaBootsGDP100 <- replicate(100, mean(sample(x$gdp_grow, 10, replace = TRUE))) 


#calculando médias finais da variável com na.rm pois possuem missings
mean(mediaBootsGDP100, na.rm = TRUE)
mean(mediaBootsDispersive50, na.rm = TRUE)
mean(mediaBootsDispersivel10, na.rm = TRUE)
