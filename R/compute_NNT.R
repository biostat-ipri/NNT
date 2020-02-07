#' Compute Number Needed to treat
#'
#' @details confidence 
#' @param e a bivariate numeric vector of counts of events in the two treatment groups
#' @param n a bivariate numeric vector of size of the two treatment groups
#' @param alpha a numeric valie between 0 and 1 so as to obtain 1-alpha confidence interval
#'
#' @return estimate of absolute risk reduction ARR, number needed to treat NNT and 1-alpha confidence intervals
#' @export
#'
#' @examples
compute_NNT <- function(e,n,alpha)
{
  z = qnorm(p=1-alpha/2)
  p = e/n
  phi = (2*e+z^2)/(2*(n+z^2))
  psi = (e^2)/(n^2+n*z^2)
  l = phi - sqrt(phi^2-psi)
  u = phi + sqrt(phi^2-psi)
  delta = sqrt( (p[1] - l[1])^2 + (u[2]-p[2])^2 )
  eps =   sqrt( (u[1] - p[1])^2 + (p[2]-l[2])^2 )
  ARR = p[1]-p[2] # Absolute Risk Reduction
  LL_ARR = ARR - delta
  UL_ARR = ARR + eps
  NNT = 1/ARR 
  LL_NNT = UL_NNT = LLT_neg = LL_NNT_neg = UL_NNT_neg = LL_NNT_pos = UL_NNT_pos = NA
  if((LL_ARR<0 & UL_ARR<0) | (LL_ARR>0 & UL_ARR>0))
  {
    LL_NNT = 1/UL_ARR
    UL_NNT = 1/LL_ARR
    CI_NNT = c(LL_NNT,UL_NNT)
  }else
  {
    LL_NNT_neg = -Inf
    UL_NNT_neg = 1/LL_ARR
    LL_NNT_pos = 1/UL_ARR
    UL_NNT_pos = Inf
    CI_NNT = c(LL_NNT_neg,UL_NNT_neg, LL_NNT_pos,UL_NNT_pos)
  }
  return(list(ARR=ARR,
              LL_ARR=LL_ARR,
              UL_ARR=UL_ARR,
              CI_ARR = c(LL_ARR,UL_ARR), 
              NNT=NNT,
              LL_NNT=LL_NNT,
              UL_NNT=UL_NNT,
              LL_NNT_neg=LL_NNT_neg,
              UL_NNT_neg=UL_NNT_neg,
              LL_NNT_pos=LL_NNT_pos,
              UL_NNT_pos=UL_NNT_pos,
              CI_NNT = CI_NNT))
}

{
  
}