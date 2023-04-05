### Produto de matrizes 
a = c(2,-1,0,1,2,-3)
A = matrix(a, byrow = T, nrow = 2, ncol = 3)
A
b = c(1,1,1,2,1,3)
B = matrix(b, byrow = T, nrow = 3, ncol = 2)

A%*%B

## Produto de Kroncker

a = c(1,0,0,1)
A = matrix(a, byrow = T, nrow = 2, ncol = 2)
A
b = c(1,1,1, 1)
B = matrix(b, byrow = T, nrow = 2, ncol = 2)

kronecker( A, B, "*"  )


### inversa de matriz 

A = matrix( c(1,2,1,2,1,0,1,1,1), byrow = T, ncol = 3, nrow =3 )

solve(A)

### Decomposição espectral 

## Exemplo1
A = matrix( c(4,2,2,2,2,0,2,0,2), ncol = 3, nrow =3 )
A

eig = eigen(A)

lambda = eig$values
LAMBDA = diag(lambda)
U = eig$vectors

U%*%LAMBDA%*%t(U)

A


## Exemplo2
A = matrix( c(2,1,1,2), ncol = 2, nrow =2 )
A

eig = eigen(A)

lambda = eig$values
LAMBDA = diag(lambda)
U = eig$vectors

U%*%LAMBDA%*%t(U)



A
