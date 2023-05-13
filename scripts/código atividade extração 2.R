# extraindo arquibo uci
census_income <- read.table("https://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.data", header = FALSE, sep = ',', dec = '.', col.names	= c('age', 'workclass', 'fnlwgt', 'education', 'education-num', 'marital-status', 'occupation', 'relationship', 'race', 'sex', 'capital-gain', 'capital-loss', 'hours-per-week', 'native-country', 'class')
)
# arquivo cidade do recife
MalhaCicloviariaRecife2019Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/667cb4cf-fc93-4687-bb8f-431550eeb2db/resource/575613ac-9660-4210-989c-eed4255d400c/download/malha-cicloviaria-do-recife-dezembro-2022.csv', sep = ';', encoding = 'UTF-8'
)

# arquivo XML da aiweb
library(XML)

CoursesWSU <- xmlToDataFrame("http://aiweb.cs.washington.edu/research/projects/xmltk/xmldata/data/courses/wsu.xml")
