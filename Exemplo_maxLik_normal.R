
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

## Funcao para chute inicial 

chute_inicial <- function(x){
  
  mu = seq(1,100,10) # candidatos para chute inicial do parametro mu
  sigma2 = seq(1,100,10) # candidatos para chute inicial do parametro sigma2
  
  par = tidyr::crossing(mu = mu, sigma2 = sigma2) # Combinacoes possiveis de mu e sigma2
  
  ## calculo da log-verossimilhança para todas as combinaçoes de mu e sigma2
  # A ideia é que o par de parametros que apresentar o maior valor da logverossimilhança será o melhor chute inicial
  lk=c()
  for(i in 1:dim(par)[1]) lk[i] = as.numeric(logveros_norm( x, par[i,]  ))
  
  ## Criando dataset com os pares de parametros e seu respectivo valor da logverossimilhança
  lk_por_parametro = cbind( par, lk)
  
  ## Ordenando pelo maior valor da logverossimilhanca 
  chute = dplyr::arrange( .data = lk_por_parametro, desc(lk)   )
  chute = chute[1,1:2] # selecionando o par com o maior valor de parametro 
  return(chute)
  
}


### Experimento Monte Carlo
## Avaliar os estimadores de MV da normal

# Parametros: 
mu = 10
sigma2 = 1
par = c(mu, sigma2)

n = c(25, 50, 100, 500)
M = 100 # quantidade de MC

MATRIZ_FINAL = matrix( NA, nrow = length(n), ncol = 5 )

for(j in 1:length(n)){

RESULT = matrix( NA, nrow = M, ncol = 3)
cont_falha=c()

for( i in 1:M){
  
  conv = 1 
  
  while(conv != 0){  
  x = rnorm( n = n[j], mean = mu, sd = sqrt(sigma2)   ) # gerador da normal
  lk_new = function(par)  logveros_norm(x, par)
  chute = as.numeric(chute_inicial(x))
  res_maxlik = maxLik(lk_new, grad = NULL, hess = NULL, start=chute, method="BFGS")
  Estimate = res_maxlik$estimate 
  conv = res_maxlik$code
  cont_falha = c(cont_falha, conv)
  }
  
  ## RES: matriz com as estimativas dos parametros
  RESULT[i,] = c(Estimate, conv)
  
}

MEDIA = colMeans(RESULT)
EQM_MU = mean( (RESULT[,1] - mu)^2 )  
EQM_SIGMA2 = mean( (RESULT[,2] - sigma2)^2 )  

MATRIZ_FINAL[j,] = c( MEDIA, EQM_MU, EQM_SIGMA2)
print( MATRIZ_FINAL[j,]  )
}





