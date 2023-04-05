
library(maxLik)

## Funcao de logverossimilhanca

logveros_norm <- function( x, par ){
  # Inputs
  # x: vetor de dados
  # par: vetor de parametros da distribuicao
  
  mu = par[1]
  sigma2 = par[2]
  
  n = length(x)  
  lv = (-n/2)*log(2*pi*sigma2) - (1/(2*sigma2))*sum( (x - mu)^2  )  
  
  return(lv)

}



### Experimento Monte Carlo
## Avaliar os estimadores de MV da normal

# Parametros: 
mu = 10
sigma2 = 4
par = c(mu, sigma2)

n = 25
M = 1000 # quantidade de MC

RESULT = matrix( NA, nrow = M, ncol = 3 )

i=1

for( i in 1:M){
  
  x = rnorm( n = n, mean = mu, sd = sqrt(sigma2)   ) # gerador da normal
  n = length(x) # tamanho do vetor de dados
  
  lk_new = function(par)  logveros_norm(x, par)
  chute_inicial = c(100, 100)
  res_maxlik = maxLik(lk_new, grad = NULL, hess = NULL, start=chute_inicial, method="BFGS")
  Estimate = res_maxlik$estimate 
  Code = res_maxlik$code
  
  
  ## RES: matriz com as estimativas dos parametros
  RESULT[i,] = c(Estimate, Code)
  
  
}

colMeans(RESULT)



### Exemplos de chutes iniciais
## Escolher aquele que tiver a maior verossimilhança 
## Construa uma função que escolha o melhor chute inicial 

logveros_norm( x, par=c(10,4)  )

logveros_norm( x, par=c(100,50)  )

logveros_norm( x, par=c(9.5,4.24)  )

vec_mu = c(10, 50, 100, 111, .... )
vec_sigma = c(1, 5, 10, 20 , ....)






