set.seed(3897) # matrícula como seed
df <- data.frame( # dataframe com as temperaturas das cidades
  x1 = rnorm(200,30,10), # ( n, média, desvio padrão  )
  x2 = rnorm(200,15,5),  # ( 200 valores, média 15 e desvio padrão 5 ) 
  x3 = rnorm(200,0,15)
)
head(df)

table1 <- data.table(
  cidades = c(
    "x1", "x2", "x3",
    "x1", "x2", "x3",
    "x1", "x2", "x3",
    "x1", "x2", "x3"
  ),  
  campos = c(
    "média", "média", "média",  
    "mediana", "mediana", "mediana",   
    "1o Quartil", "1o Quartil", "1o Quartil",
    "3o Quartil", "3o Quartil", "3o Quartil"
  ),  
  valores = c(
    mean(x = df$x1), mean(x = df$x2), mean(x = df$x3),
    median(x = df$x1), median(x = df$x2), median(x = df$x3), 
    quantile(df$x1,.25), quantile(df$x2,.25), quantile(df$x3,.25),
    quantile(df$x1,.75), quantile(df$x2,.75), quantile(df$x3,.75)
  )
) 

# muda formato da tabela de “long” para “wide”
newtable1 <- reshape(data = table1, idvar = "cidades", timevar = "campos", direction = "wide")
# muda o nome das colunas
colnames(newtable1) <- c("cidades", "média", "mediana","1o Quartil","3o Quartil")
print(newtable1)

table2 <- data.table(
  cidades = c(
    "x1", "x2", "x3",
    "x1", "x2", "x3",
    "x1", "x2", "x3"
  ),  
  campos = c(
    "variância", "variância", "variância",
    "desvio padrão", "desvio padrão", "desvio padrão",
    "coeficiente de variação", "coeficiente de variação", "coeficiente de variação"
  ),  
  valores = c(
    var(df$x1), var(df$x2), var(df$x3),
    sd(df$x1), sd(df$x2), sd(df$x3),
    100*sd(df$x1)/mean(x = df$x1), 100*sd(df$x2)/mean(x = df$x2), 100*sd(df$x3)/mean(x = df$x3)
  )
) 
# muda formato da tabela de “long” para “wide”
newtable2<- reshape(data = table2, idvar = "cidades", timevar = "campos", direction = "wide")
# muda o nome das colunas
colnames(newtable2) <- c("cidades","variância","desvio padrão","coeficiente de variação")
print(newtable2)

### Cidade 1 (x1)
summary(df$x1)

### Cidade 2 (x2)
summary(df$x2)

### Cidade 3 (x3)
summary(df$x3)

hist(df$x1, main = "Histograma da Cidade 1")
hist(df$x2, main = "Histograma da Cidade 2")
hist(df$x3, main = "Histograma da Cidade 3")

### Cidade 1
boxplot(df$x1)

### Cidade 2
boxplot(df$x2)

### Cidade 3
boxplot(df$x3)