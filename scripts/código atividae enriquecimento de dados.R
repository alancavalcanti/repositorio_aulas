#### CARREGANDO PACOTES ####
pacman::p_load(dplyr, tidyverse)

#### LENDO AS BASES PARA O R ####
vdem <- `V-Dem-CY-Full+Others-v12`
base <- x

base <- select(base, ccode, year, dispersive_nm_IDC, inclusive_nm_IDC, constraining_nm_IDC)
vdem <- select(vdem, country_name, year, COWcode, e_boix_regime, v2x_polyarchy)

basefinal <- left_join(base, vdem, by = c('ccode' = 'COWcode'))
