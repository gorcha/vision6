
#' Creates a new Folder.
#'
#' @param folder_details (array) A list or data frame of Field details.
#'        See \code\link{v6_folderDetails}} for a description of valid values.
#' @return the ID of the newly added Folder on success.
#' @seealso \url{http://developers.vision6.com.au/3.0/method/addFolder}
#' @export
v6_addFolder <- function(folder_details) {
  folder_string <- str_replace(str_replace(toJSON(folder_details), "^[", ""), "]$", "")
  req_str <- v6_req_string("addFolder", folder_string)

  v6_request(req_str)
}

#' Counts the number of Folders that match the search criteria.
#'
#' @param folder_type (string) The type of Folder to count.
#'        Valid values are: list, message or file.
#' @param search_criteria (array - optional) An array of search criteria that
#'        selects the Folders to be counted. See \code\link{v6_folderDetails}}
#'        for a description of the values that can be searched on.
#' @return The number of Folders that match the search criteria.
#' @seealso \url{http://developers.vision6.com.au/3.0/method/countFolders}
#' @export
v6_countFolders <- function(folder_type, search_criteria) {
  folder_type <- v6_quote(folder_type)
  req_str <- v6_req_string("countFolders", c(folder_type, search_criteria))

  v6_request(req_str)
}

#' Deletes the specified Folder.
#'
#' @param folder_id (int) The ID of the Folder to delete.
#' @return true on success.
#' @seealso \url{http://developers.vision6.com.au/3.0/method/deleteFolder}
#' @export
v6_deleteFolder <- function(folder_id) {
  req_str <- v6_req_string("deleteFolder", folder_id)

  v6_request(req_str)
}

#' Renames the specified Folder.
#'
#' @param folder_details (array) A list or data frame of Folder details to be edited.
#'        See \code\link{v6_folderDetails}} for a description of valid values.
#' @return true on success.
#' @seealso \url{http://developers.vision6.com.au/3.0/method/editFolder}
#' @export
v6_editFolder <- function(folder_details) {
  folder_string <- toJSON(folder_details)
  req_str <- v6_req_string("editFolder", folder_string)

  v6_request(req_str)
}

#' Returns the details of a specific Folder.
#'
#' @param folder_id (int) The ID of the Folder to retrieve.
#' @return a data frame containing a single record of Folder details.
#'         See \code{\link{v6_folderDetails}} for a description of the values returned.
#' @seealso \url{http://developers.vision6.com.au/3.0/method/getFolderById}
#' @export
v6_getFolderById <- function(folder_id) {
  req_str <- v6_req_string("getFolderById", folder_id)

  v6_request(req_str)
}

#' Returns the Folders that match the search criteria.
#'
#' @param folder_type (string) The type of Folders to search for.
#'        Valid values are: list, message or file.
#' @param search_criteria (array - optional)
#'        An array of search criteria. See the remarks section below for the
#'        list of values which are searchable. If you do not specify search
#'        criteria, all Folders with the specified folder_type are returned.
#' @param limit (int - optional) Maximum number of items to return.
#' @param offset (int - optional) Number of items to skip before beginning to
#'        return results. See Using Search Methods for information about using
#'        the offset parameter with the limit parameter to include pagination
#'        in your results.
#' @param sort_by (string - optional) The name of the value to sort the results by.
#' @param sort_order (string - optional) The order the results are returned in
#'        (either ascending or descending). The default is descending.
#'        Valid values are:
#'        \itemize{
#'          \item DESC - Sort from highest to lowest (default).
#'          \item ASC - Sort from lowest to highest.
#'        }
#' @return a data frame containing zero or more records of Field details.
#'         See \code{\link{v6_fieldDetails}} for a description of the values returned.
#' @seealso \url{http://developers.vision6.com.au/3.0/method/searchFolders}
#' @export
v6_searchFolders <- function(folder_type,
                             search_criteria = "[]",
                             limit = 0,
                             offset = 0,
                             sort_by = "",
                             sort_order = "") {
  folder_type <- v6_quote(folder_type)
  sort_by <- v6_quote(sort_by)
  sort_order <- v6_quote(sort_order)

  req_str <- v6_req_string("searchFolders",
                           c(folder_type, search_criteria, limit, offset,
                             sort_by, sort_order))

  v6_request(req_str)
}

