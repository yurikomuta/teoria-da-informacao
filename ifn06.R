#quais cidade tiveram mais cliques na campanha?

#dados extraidos campanha de Google Ads - Hitocom Produtos Industriais 2022

#workspace
setwd("C:/Users/Hitocom/Desktop/IFN06")

#libraries

library(readr)
library(igraph)
library(dplyr)
library(utf8)

#upload data
dados <- read.csv("base.csv", header = TRUE, sep = ";", dec = ",")

#view data
View(dados)

#types data
glimpse(dados)

#graph
g1 = graph (edges = c("Santo André","SBC","Diadema","São Caetano do Sul",
                       "Santo André","São Caetano do Sul","Diadema","SBC","Santo André","SP",
                       "SBC","SP")
            ,vertex.label=dados$Cliques ,directed = F)

plot (g1, edge.arrow.size=.2,vertex.label.color="black",vertex.label.dist=4,
      verte.color=c("gold"))

#ARESTAS
E(g1)

#VERTICES
V(g1)$name

#matrix
g1[]





