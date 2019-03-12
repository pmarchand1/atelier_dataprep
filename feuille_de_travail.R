# Feuille de travail pour l'atelier "Organisation des données de recherche"

## Charger le tidyverse

library(tidyverse)


## Importation de fichiers CSV dans R

inv1 <- read.csv("donnees/invent1.csv")
inv2 <- read.csv("donnees/invent2.csv", ...)


## Détecter des différences entre jeux de données

all_equal(...)

all.equal(...)


# Données ordonnées

library(readxl)
tab <- read_excel("donnees/exemple_matrice.xlsx", ...)

tab_gather <- gather(tab, key = ..., value = ..., ...)


## Opérations sur les données ordonnées

tab_gather <- group_by(tab_gather, Essence)
summarize(tab_gather, sum(Nombre))

ggplot(tab_gather, aes(x = Placette, y = Nombre, color = Essence)) +
    geom_point()


tab_spread <- spread(tab_gather, key = ..., value = ...)


## Réorganiser l'exemple d'inventaire

inv <- read_excel("donnees/exemple_inventaire2.xlsx", ...)

inv_gather <- gather(inv, key = ..., value = ..., -(Arbre:Essence))

inv_separ <- separate(..., Variable, into = ..., 
                      sep = ...)

inv_spread <- spread(inv_separ, key = ..., value = ...)

inv_final <- mutate(inv_spread, ...)


## Recoder des variables

inv_final <- mutate(inv_final, Etat = recode(Etat, ...))


## Répéter une transformation sur plusieurs fichiers de données

meteo <- read.csv("donnees/eng-hourly-06012018-06302018.csv", ...)

meteo <- group_by(meteo, Year, Month, Day)
min_max_jour <- summarize(meteo, ...)


extr_min_max <- function(fichier) {
    
    return(...)
}


list.files("donnees")

meteo_fich <- list.files("donnees", pattern = ...,
                         full.names = TRUE)

meteo_liste <- map(..., ...)
meteo_liste

map_int(..., nrow)


meteo_df <- map_df(meteo_fich, extr_min_max)


## Exercice

# Dans la section précédente, nous avions réorganisé les données de la placette "P1"
# de l'exemple d'inventaire. Pourriez-vous regrouper ces opérations dans une fonction 
# et l'appliquer aux deux placettes, "P1" et "P2"?

