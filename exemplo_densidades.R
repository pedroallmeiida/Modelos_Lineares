
## funcao de densidade marginal da distribuição normal

fdp_norm <- function( x, sigma2, mu ){
  n = 1  
  fx = ( (2*pi*sigma2)^(-n/2) )*exp(  (-1/(2*sigma2))*( (x - mu)^2  )   )
  return(fx)
}

## Visualizando a curva de densidade

## gerando dados normais
par(mfrow = c(1, 2))

x <- seq(70, 130, length.out = 100)
ver <- fdp_norm( x, sigma2 = 10^2, mu = 100  )
plot(x, ver, type = "l")


x <- seq(70, 130, length.out = 100)
fx <- dnorm(x, mean = 100, sd = 10)
plot(x, fx, type = "l")



## funcao de densidade conjunta de variaveis aleatorias independentes N(mu, sigma2):

dens_conj_norm <- function( x, sigma2, mu ){
  n = length(x)  
  fx = ( (2*pi*sigma2)^(-n/2) )*exp(  (-1/(2*sigma2))*sum( (x - mu)^2  )   )
  return(fx)
}

logveros_norm <- function( x, sigma2, mu ){
  n = length(x)  
  fx = ( (2*pi*sigma2)^(-n/2) )*exp(  (-1/(2*sigma2))*sum( (x - mu)^2  )   )
  return(fx)
}












