% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/folder.R
\name{v6_countFolders}
\alias{v6_countFolders}
\title{Counts the number of Folders that match the search criteria.}
\usage{
v6_countFolders(folder_type, search_criteria = "[]")
}
\arguments{
\item{folder_type}{(string) The type of Folder to count.
Valid values are: list, message or file.}

\item{search_criteria}{(array - optional) An array of search criteria that
selects the Folders to be counted. See \\code{\link{v6_folderDetails}}
for a description of the values that can be searched on.}
}
\value{
The number of Folders that match the search criteria.
}
\description{
Counts the number of Folders that match the search criteria.
}
\seealso{
\url{http://developers.vision6.com.au/3.0/method/countFolders}
}
