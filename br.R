#qual região do país tiveram mais cliques na campanha?

#workspace
setwd("C:/Users/Hitocom/Desktop/IFN06")

#libraries

library(readr)
library(igraph)
library(dplyr)
library(utf8)

#upload data arestas
ligacoes <- read.csv("Relatório-de-locais.csv", header = TRUE, sep = ";", dec = ",")

View(ligacoes)

head(Local)
head(Estado)

nrow(ligacoes)

ligacoes = ligacoes [order (ligacoes$ï..Local, ligacoes$Estado),]

colnames (ligacoes) [4] ="Cliques"

rownames(ligacoes) = NULL


#upload matrix
matrix <- read.csv("matrix.csv", sep = ";")

matrix = as.matrix(matrix)
View(matrix)

#GRAPH 
G1 = graph (edges = c("São Paulo","São Paulo","Campinas","São Paulo",
                      "Sorocaba","São Paulo","Guarulhos","São Paulo",
                      "SBC"," São Paulo","Rio de Janeiro"," Rio de Janeiro",
                      "Belo Horizonte"," Minas Gerais","Salvador"," Bahia",
                      "Brasília"," Distrito Federal","Manaus"," Amazonas","Fortaleza",
                      " Ceará","Belém"," Pará","Curitiba"," Paraná",
                      "Recife","Pernambuco","Campo Grande","Mato Grosso Do Sul",
                  "São Luís","Maranhão","Goiânia","Goiás","Maceió","Alagoas","Porto Alegre",
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
