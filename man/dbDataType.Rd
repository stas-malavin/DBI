% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DBDriver.R
\name{dbDataType}
\alias{dbDataType}
\title{Determine the SQL data type of an object}
\usage{
dbDataType(dbObj, obj, ...)
}
\arguments{
\item{dbObj}{A object inheriting from \code{\linkS4class{DBIDriver}}
or \code{\linkS4class{DBIConnection}}}

\item{obj}{An R object whose SQL type we want to determine.}

\item{...}{Other arguments passed on to methods.}
}
\value{
A character string specifying the SQL data type for \code{obj}.
}
\description{
This is a generic function. The default method determines the SQL type of an
R object according to the SQL 92 specification, which may serve as a starting
point for driver implementations. The default method also provides a method
for data.frame which will return a character vector giving the type for each
column in the dataframe.
}
\details{
The data types supported by databases are different than the data types in R,
but the mapping between the primitve types is straightforward:  Any of the
many fixed and varying length character types are mapped to character
vectors. Fixed-precision (non-IEEE) numbers are mapped into either numeric or
integer vectors.

Notice that many DBMS do not follow IEEE arithmetic, so there are potential
problems with under/overflows and loss of precision.
}
\examples{
dbDataType(ANSI(), 1:5)
dbDataType(ANSI(), 1)
dbDataType(ANSI(), TRUE)
dbDataType(ANSI(), Sys.Date())
dbDataType(ANSI(), Sys.time())
dbDataType(ANSI(), Sys.time() - as.POSIXct(Sys.Date()))
dbDataType(ANSI(), c("x", "abc"))
dbDataType(ANSI(), list(raw(10), raw(20)))
dbDataType(ANSI(), I(3))

dbDataType(ANSI(), iris)

con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbDataType(con, 1:5)
dbDataType(con, 1)
dbDataType(con, TRUE)
dbDataType(con, Sys.Date())
dbDataType(con, Sys.time())
dbDataType(con, Sys.time() - as.POSIXct(Sys.Date()))
dbDataType(con, c("x", "abc"))
dbDataType(con, list(raw(10), raw(20)))
dbDataType(con, I(3))

dbDataType(con, iris)

dbDisconnect(con)
}
\seealso{
Other DBIDriver generics: \code{\link{DBIDriver-class}},
  \code{\link{dbConnect}}, \code{\link{dbDriver}},
  \code{\link{dbGetInfo}}, \code{\link{dbIsValid}},
  \code{\link{dbListConnections}}

Other DBIConnection generics: \code{\link{DBIConnection-class}},
  \code{\link{dbDisconnect}}, \code{\link{dbExecute}},
  \code{\link{dbExistsTable}},
  \code{\link{dbGetException}}, \code{\link{dbGetInfo}},
  \code{\link{dbGetQuery}}, \code{\link{dbIsValid}},
  \code{\link{dbListFields}}, \code{\link{dbListResults}},
  \code{\link{dbListTables}}, \code{\link{dbReadTable}},
  \code{\link{dbRemoveTable}}, \code{\link{dbSendQuery}},
  \code{\link{dbSendStatement}}
}
