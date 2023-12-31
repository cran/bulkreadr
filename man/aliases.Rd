% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/aliases.R
\name{pull_out}
\alias{pull_out}
\title{Extract or replace parts of an object}
\value{
\code{pull_out()} will return an object of the same class as the input object.
}
\description{
\code{pull_out()} is similar to \code{[}. It acts on vectors, matrices, arrays and lists to extract or replace parts. It is pleasant to use with the magrittr (\verb{\%>\%}) and base (\verb{|>}) operators.
}
\examples{

good_choice <- letters \%>\%
  pull_out(c(5, 2, 1, 4))

good_choice

iris \%>\%
  pull_out(, 1:4) \%>\%
  head()

}
