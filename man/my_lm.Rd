% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/my_lm.R
\name{my_lm}
\alias{my_lm}
\alias{my_lm.default}
\alias{my_lm.formula}
\alias{my_lm.matrix}
\title{Custom Linear Regression Estimation}
\usage{
my_lm(x, ...)

\method{my_lm}{default}(x, ...)

\method{my_lm}{formula}(formula, data = list(), ...)

\method{my_lm}{matrix}(x, y, ...)
}
\arguments{
\item{x}{Either a design matrix with dimensions \eqn{n \times p}{n x p} or \code{\link{formula}} with the \code{data} parameter specified}

\item{...}{Not used.}

\item{formula}{An object of class \code{\link[=formula]{formula()}} which provides a symbolic description of the model to be fitted.}

\item{data}{An optional data frame, list or environment.}

\item{y}{A \code{vector} of responses with dimensions \eqn{n \times 1}{n x 1}.}
}
\value{
An object of class \code{my_lm} that contains:
\itemize{
\item \code{coefficients}: Estimated parameter values of \eqn{\hat{\beta}}{beta_hat}
with dimensions \eqn{p \times 1}{p x 1}
\item \code{cov_mat}: Covariance matrix of estimated parameter values
with dimensions \eqn{p \times p}{p x p}.
\item \code{sigma}: Standard deviation of residuals
\item \code{df}: Degrees of Freedom given by \eqn{df = N - p}
\item \code{fitted.values}: Fitted Values given by \eqn{\hat{y} = X\hat{\beta}}{y_hat = X*beta_hat}
\item \code{residuals}: Residuals given by \eqn{e = y - \hat{y}}{e = y - y_hat}
\item \code{call}: Information on how the \code{\link[=my_lm]{my_lm()}} function was called.
}
}
\description{
Provides a custom implementation of \emph{R}'s \code{\link[stats:lm]{stats::lm()}} linear regression
function that uses the S3 system.
}
\details{
Given a response vector \eqn{y} with dimensions \eqn{n \times 1}{n x 1},
a design matrix \eqn{X} with dimensions \eqn{n \times p}{n x p},
a vector of parameters \eqn{\beta}{beta} with dimensions \eqn{p \times 1}{p x 1},
and an error vector \eqn{\epsilon}{e} with dimensions \eqn{n \times 1}{n x 1} from \eqn{\epsilon \sim N\left( {0,{\sigma ^2}} \right)}{e ~ N(0, sigma^2)},
the standard linear regression model can be stated as:

\deqn{y  = {X'}\beta + \epsilon}{y = X'beta + e}

The least ordinary squares (OLS) solutions are then:

\deqn{\hat \beta  = {\left( {{X'}X} \right)^{ - 1}}{X'}y}{beta_hat = (X'X)^(-1) X' y}
\deqn{cov\left( {\hat \beta } \right) = {\sigma ^2}{\left( {{X^T}X} \right)^{ - 1}}}{cov(beta_hat) = sigma^2 * (X' X)^(-1)}
}
\examples{
## Matrix interface

# Create a design matrix
x = cbind(1, mtcars$disp)

# Extract response
y = mtcars$mpg

# Calculate outcome
my_model = my_lm(x, y)

## Formula interface

# Calculate 
my_model = my_lm(mpg ~ disp, data = mtcars)

}
\seealso{
\code{\link[=summary.my_lm]{summary.my_lm()}}, \code{\link[=print.my_lm]{print.my_lm()}}
}
