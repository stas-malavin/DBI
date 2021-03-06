% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DBResult.R
\name{dbHasCompleted}
\alias{dbHasCompleted}
\title{Completion status}
\usage{
dbHasCompleted(res, ...)
}
\arguments{
\item{res}{An object inheriting from \code{\linkS4class{DBIResult}}.}

\item{...}{Other arguments passed on to methods.}
}
\value{
a logical vector of length 1
}
\description{
This method returns if the operation has completed.
A \code{SELECT} query is completed if all rows have been fetched.
A data manipulation statement is completed if it has been executed.
}
\examples{
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "mtcars", mtcars)
rs <- dbSendQuery(con, "SELECT * FROM mtcars")

dbHasCompleted(rs)
ret1 <- dbFetch(rs, 10)
dbHasCompleted(rs)
ret2 <- dbFetch(rs)
dbHasCompleted(rs)

dbClearResult(rs)
dbDisconnect(con)
}
\seealso{
Other DBIResult generics: \code{\link{DBIResult-class}},
  \code{\link{SQL}}, \code{\link{dbBind}},
  \code{\link{dbClearResult}}, \code{\link{dbColumnInfo}},
  \code{\link{dbFetch}}, \code{\link{dbGetInfo}},
  \code{\link{dbGetRowCount}},
  \code{\link{dbGetRowsAffected}},
  \code{\link{dbGetStatement}}, \code{\link{dbIsValid}}
}
