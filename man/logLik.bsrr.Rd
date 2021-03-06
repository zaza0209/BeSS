% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/logLik.bsrr.R
\name{logLik.bsrr}
\alias{logLik.bsrr}
\title{Extract the log-likelihood from a "bsrr.one" object.}
\usage{
\method{logLik}{bsrr}(object, best.model = TRUE, ...)
}
\arguments{
\item{object}{A "\code{bsrr}" object.}

\item{best.model}{Whether only return the log-likelihood of the best model. Default is \code{TRUE}.
If \code{best.model = FALSE}, the log-likelihood of the best models with model size and
 \eqn{\lambda} in the original \code{s.list} and \code{lambda.list} (for \code{method = "sequential"})
 or in the iteration path (for \code{method = "gsection"}, \code{method = "pgsection"},
 and \code{method = "psequential"}) is returned.}

\item{\dots}{additional arguments}
}
\value{
A matrix or vector containing the log-likelihood for each model is returned.
For \code{bsrr} objects fitted by \code{sequantial} method, values in each row in the
returned matrix corresponding to the model size in \code{s.list}, and each column the shrinkage parameters
in \code{lambda.list}.

For \code{bsrr} objects fitted by \code{gsection}, \code{pgsection} and \code{psequential}, the returned vector
contains log-likelihood for fitted models in each iteration. The coefficients of those model can be extracted
from \code{beta.all} and \code{coef0.all} in the \code{bsrr} object.
}
\description{
This function returns the log-likelihood for the fitted models.
}
\details{
The log-likelihood for the best model chosen by a certain information criterion
or cross-validation corresponding to the call in \code{bsrr} or the best models
with model size and \eqn{\lambda} in the original \code{s.list} and \code{lambda.list}
(or the in the iteration path) can be returned.
For "lm" fits it is assumed that the scale has been estimated
 (by maximum likelihood or REML),
 and all the constants in the log-likelihood are included.
}
\examples{

# Generate simulated data
n <- 200
p <- 20
k <- 5
rho <- 0.4
SNR <- 10
cortype <- 1
seed <- 10
Tbeta <- rep(0, p)
Tbeta[1:k*floor(p/k):floor(p/k)] <- rep(1, k)
Data <- gen.data(n, p, k, rho, family = "gaussian", cortype = cortype, snr = SNR, seed = seed)
lm.bsrr <- bsrr(Data$x, Data$y, method = "sequential")

logLik(lm.bsrr, best.model = FALSE)

}
\seealso{
\code{\link{bsrr}}, \code{\link{summary.bsrr}}.
}
\author{
Liyuan Hu, Kangkang Jiang, Yanhang Zhang, Jin Zhu, Canhong Wen and Xueqin Wang.
}
