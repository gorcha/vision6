% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/field.R
\name{v6_getFieldById}
\alias{v6_getFieldById}
\title{Returns details for a specific Field in a List.}
\usage{
v6_getFieldById(list_id, field_id)
}
\arguments{
\item{list_id}{(int) The ID of the List containing the Field.}

\item{field_id}{(int) The ID of the Field to retrieve.}
}
\value{
a data frame containing a single record of Field details.
        See \code{\link{v6_fieldDetails}} for a description of the values returned.
}
\description{
Returns details for a specific Field in a List.
}
\seealso{
\url{http://developers.vision6.com.au/3.0/method/getFieldById}
}
