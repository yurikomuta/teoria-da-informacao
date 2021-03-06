#qual regi�o do pa�s tiveram mais cliques na campanha?

#workspace
setwd("C:/Users/Hitocom/Desktop/IFN06")

#libraries

library(readr)
library(igraph)
library(dplyr)
library(utf8)

#upload data arestas
ligacoes <- read.csv("Relat�rio-de-locais.csv", header = TRUE, sep = ";", dec = ",")

View(ligacoes)

head(Local)
head(Estado)

nrow(ligacoes)

ligacoes = ligacoes [order (ligacoes$�..Local, ligacoes$Estado),]

colnames (ligacoes) [4] ="Cliques"

rownames(ligacoes) = NULL


#upload matrix
matrix <- read.csv("matrix.csv", sep = ";")

matrix = as.matrix(matrix)
View(matrix)

#GRAPH 
G1 = graph (edges = c("S�o Paulo","S�o Paulo","Campinas","S�o Paulo",
                      "Sorocaba","S�o Paulo","Guarulhos","S�o Paulo",
                      "SBC"," S�o Paulo","Rio de Janeiro"," Rio de Janeiro",
                      "Belo Horizonte"," Minas Gerais","Salvador"," Bahia",
                      "Bras�lia"," Distrito Federal","Manaus"," Amazonas","Fortaleza",
                      " Cear�","Bel�m"," Par�","Curitiba"," Paran�",
                      "Recife","Pernambuco","Campo Grande","Mato Grosso Do Sul",
                  "S�o Lu�s","Maranh�o","Goi�nia","Goi�s","Macei�","Alagoas","Porto Alegre",
                  "Rio Grande do Sul")
            ,directed = F,weighted = TRUE)
#atribuir peso de cliques


#PLOTANDO O GRAPH 
plot (G1,edge.arrow.size=.10,vertex.label.color="black",vertex.label.dist=3,
        vertex.color=c("gold")) 

#ARESTAS
E(G1)

#VERTICES
V(G1)$name

#LAYOUT
graf.tk = tkplot(G1)

#SAVE CORD.
Cord = tkplot.getcoords(graf.tk)

#exit tkplot
tk_close(graf.tk,window.close = T)

plot(G1,layout= Cord)
