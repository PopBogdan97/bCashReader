% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/addr_unconfirmedBalance.R
\name{addr_unconfirmedBalance}
\alias{addr_unconfirmedBalance}
\title{The unconfirmed balance of an address.}
\usage{
addr_unconfirmedBalance(address)
}
\arguments{
\item{string}{input Bitcoin Cash address}
}
\value{
data frame with the unconfirmed balance of the the address in both, Bitcoin Cash and Satoshi.
}
\description{
Get the unconfirmed balance of a Bitcoin Cash address.
}
\examples{
addr_unconfirmedBalance(address)
addr_unconfirmedBalance("address string here")
}
\author{
Vasile Adrian Bogdan Pop
}
