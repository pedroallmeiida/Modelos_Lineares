
### Experimento Monte Carlo

## Avaliar os estimadores de MV da normal

# Amostra pequena n = 10
# Parametros: 
mu = 10
sigma2 = 1
n = 100
M = 10000 # quantidade de MC

EST = matrix( NA, nrow = M, ncol = 3 )


for( i in 1:M){

x = rnorm( n = n, mean = mu, sd = sqrt(sigma2)   ) # gerador da normal
n = length(x) # tamanho do vetor de dados

## Estimador de mu
muhat = mean(x)
sigma2hat = sum( (x-muhat)^2 )/n
sigma2_hat = sum( (x-muhat)^2 )/(n-1)

## Criterios de avaliacao dos estimadores
eam_mu = abs(muhat - mu)
eqm_mu = (muhat - mu)^2

eam_sigma2 = abs(sigma2hat - sigma2)
eqm_sigma2 = (sigma2hat - sigma2)^2

## EST: matriz com as estimativas dos parametros
EST[i,] = c(muhat, sigma2hat, sigma2_hat)


}

colMeans(EST)
