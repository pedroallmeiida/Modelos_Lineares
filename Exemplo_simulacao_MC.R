
### Experimento Monte Carlo
## Avaliar os estimadores de MV da normal

# Amostra pequena n = 10
# Parametros: 
mu = 10
sigma2 = 4
n = 25
M = 100 # quantidade de MC

EST = matrix( NA, nrow = M, ncol = 3 )
EAM = matrix( NA,nrow = M, ncol = 3   )
EQM = matrix( NA,nrow = M, ncol = 3   )

for( i in 1:M){

x = rnorm( n = n, mean = mu, sd = sqrt(sigma2)   ) # gerador da normal
n = length(x) # tamanho do vetor de dados

## Estimador da media (mu)
muhat = mean(x)

## Estimadores da variancia
sigma2hat = sum( (x-muhat)^2 )/n # EMV
sigma2_hat = sum( (x-muhat)^2 )/(n-1) # estimador da var amostral

## Criterios de avaliacao dos estimadores
eam_mu = abs(muhat - mu)
eqm_mu = (muhat - mu)^2

eam_sigma2 = abs(sigma2hat - sigma2)
eqm_sigma2 = (sigma2hat - sigma2)^2

eam_sigma2_amost = abs(sigma2_hat - sigma2)
eqm_sigma2_amost = (sigma2_hat - sigma2)^2


## EST: matriz com as estimativas dos parametros
EST[i,] = c(muhat, sigma2hat, sigma2_hat)
EAM[i,] = c(eam_mu, eam_sigma2, eam_sigma2_amost)
EQM[i,] = c(eqm_mu, eqm_sigma2, eqm_sigma2_amost)

print(EST[i,])
}

## MEdia das estimativas
colMeans(EST)

##  Erro absoluto medio 
colMeans(EAM)

## Erro quadrático medio
colMeans(EQM)




