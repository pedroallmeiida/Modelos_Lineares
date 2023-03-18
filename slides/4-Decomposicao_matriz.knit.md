---
title: "Decomposição de matrizes"
title-slide-attributes:
  data-background-image: Marca_UEPB.png
  data-background-size: contain
  data-background-opacity: "0.1"
author: "Pedro Almeida"
format: 
  revealjs: 
    logo: Marca_UEPB.png
    theme: solarized
    transition: slide
    background-transition: fade
    smaller: false
    scrollable: true
knitr:
  opts_chunk:
    message: false
    warning: false
css: hscroll.css
editor: 
  markdown: 
    wrap: 72
---


::: {style="height:1000px; font-size:25px; margin-left: 5px; margin-right: 5px"}

# Decomposição de matrizes

-   A decomposição de matrizes pode ser considerada como processos que
    consistem em representar uma matriz em termos de outras matrizes
    mais simples ou em uma forma mais conveniente para determinadas
    operações matemáticas.

-   Existem várias formas de decomposição de matrizes, a seguir vamos ver uma das decomposições mais importante, decomposição espectral.

:::

## Decomposição espectral

- Essa técnica é usada para encontrar os autovalores e autovetores de uma matriz. 

- Uma das áreas de aplicação é o **processamento de sinais**. A decomposição espectral pode ser usada para reduzir [dimensionalidade da matriz de pixels]{.underline}. 



::: {style="height:1000px; font-size:31px; margin-left: 5px; margin-right: 5px"}

## Definição 

- Seja a matriz $\boldsymbol A_{nn}$, real e simétrica, com autovalores $\left(\{ \lambda_i  \}\right)$ e autovetores associados $\left(\{ \boldsymbol u_i  \}\right)$, tais que $\boldsymbol u_i^{\top}\boldsymbol u_i = 1$ ($i = 1, \ldots, n$). Então $\boldsymbol A_{nn}$ pode ser escrita como


$$
\boldsymbol A_{nn} = \boldsymbol U \Lambda \boldsymbol U^{\top} = \sum\limits_{i=1}^{n} \lambda_i \boldsymbol u_i\boldsymbol u_i^{\top}
$$

em que, $\Lambda = diag\{ \lambda_1, \ldots, \lambda_n \}$ e $\boldsymbol U = [\boldsymbol u_1, \ldots, \boldsymbol u_n ]$.


**Observação:** A matriz $\boldsymbol U$ é ortogonal, visto que $\boldsymbol U \boldsymbol U^{\top} = \boldsymbol U^{\top} \boldsymbol U = \boldsymbol I$.
:::

::: {style="height:1000px; font-size:31px; margin-left: 5px; margin-right: 5px"}
## Exemplo

Seja $\boldsymbol A = \left(  \begin{array}{ccc} 4 & 2 & 2 \\ 2 & 2 & 0 \\ 2 & 0 & 2 \\ \end{array} \right)$.

[a] obtenha os autovalores e autovetores (normalizado) de $\boldsymbol A$.

[b] Obtenha a decomposição espectral da matriz $\boldsymbol A$. 

:::

