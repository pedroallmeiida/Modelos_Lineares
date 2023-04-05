
### Experimento Monte Carlo
## Avaliar os estimadores de MV da normal

# Amostra pequena n = 10
# Parametros: 
mu = 10
sigma2 = 4
n = 25
M = 100 # quantidade de MC

EST = matrix( NA, nrow = M, ncol = 3 )


for( i in 1:M){

x = rnorm( n = n, mean = mu, sd = sqrt(sigma2)   ) # gerador da normal
n = length(x) # tamanho do vetor de dados

## Estimador da media (mu)
muhat = mean(x)

## Estimadores da variancia
sigma2hat = sum( (x-muhat)^2 )/n # EMV
sigma2_hat = sum( (x-muhat)^2 )/(n-1) # estimador da var amostral

## EST: matriz com as estimativas dos parametros
EST[i,] = c(muhat, sigma2hat, sigma2_hat)


}

## Media dos estimadores

MEAN = colMeans( EST  )
MEAN

## Criterios de avaliacao dos estimadores

var_mu = var( EST[,1] )
var_sigma2 = var( EST[,2] )
var_sigma2_amost = var( EST[,3] )

eam_mu = mean( abs(EST[,1] - mu) )
eqm_mu = mean( (muhat - mu)^2 )

eam_sigma2 = mean( abs(EST[,2] - sigma2) )
eqm_sigma2 = mean( (EST[,2] - sigma2)^2 )

eam_sigma2_amost = mean( abs(EST[,3] - sigma2) )
eqm_sigma2_amost = mean( (EST[,3] - sigma2)^2 )



EAM = c(eam_mu, eam_sigma2, eam_sigma2_amost)
EQM = c(eqm_mu, eqm_sigma2, eqm_sigma2_amost)
VAR = c(var_mu, var_sigma2, var_sigma2_amost)

EAM
EQM
VAR

## Comparacao variancias
# 
# 

bd = data.frame( index = 1:M, sigma2 =  EST[,2], sigma2_amost =  EST[,3] )
bd = reshape2::melt(data = bd, id = 'index')


#Gráfico de dispersao
library(ggplot2)
ggplot(bd, aes(y = value, x = index, color = variable)) +
  geom_point(size = 3, alpha = .7) +
  #scale_y_continuous(limits = c(0,7), breaks = seq(0,6,1)) +
  theme_classic(base_size = 18) +
  theme(legend.position = "top") +
  geom_hline( yintercept =  4 ) +  
  xlab("index") + 
  ylab("Variância estimada") 



