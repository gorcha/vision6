
#' Creates a new Contact List.
#'
#' @param list_details (array) A list or data frame of List details.
#'        See \code\link{v6_listDetails}} for a description of valid values.
#' @return the ID of the newly created List on success.
#' @seealso \url{http://developers.vision6.com.au/3.0/method/addList}
#' @export
v6_addList <- function(list_details) {
  list_string <- str_replace(str_replace(toJSON(list_details), "^[", ""), "]$", "")
  req_str <- v6_req_string("addList", list_string)

  v6_request(req_str)
}

#' Deletes all Contacts in a List.
#'
#' @param list_id (int) The ID of the List to clear.
#' @return true on success.
#' @seealso \url{http://developers.vision6.com.au/3.0/method/clearList}
#' @export
v6_clearList <- function(list_id) {
  req_str <- v6_req_string("clearList", list_id)

  v6_request(req_str)
}

#' Counts the number of Lists that match the search criteria.
#'
#' @param search_criteria (array - optional) An array of search criteria that
#'        selects the Lists to be counted. See \code\link{v6_listDetails}} for a
#'        description of the values that can be searched on.
#' @return The number of Lists that match the search criteria.
#' @seealso \url{http://developers.vision6.com.au/3.0/method/countLists}
#' @export
v6_countLists <- function(search_criteria = "[]") {
  req_str <- v6_req_string("countLists", search_criteria)

  v6_request(req_str)
}

#' Deletes a List and all of its Contacts.
#'
#' @param list_id (int) The ID of the List to delete.
#' @return true on success.
#' @seealso \url{http://developers.vision6.com.au/3.0/method/deleteList}
#' @export
v6_deleteList <- function(list_id) {
  req_str <- v6_req_string("deleteList", list_id)

  v6_request(req_str)
}

#' Edits a List.
#'
#' @param list_details (array) A list or data frame of List details to be edited.
#'        See \code\link{v6_listDetails}} for a description of valid values.
#' @return the List ID on success.
#' @seealso \url{http://developers.vision6.com.au/3.0/method/editList}
#' @export
v6_editList <- function(list_details) {
  list_string <- toJSON(list_details)
  req_str <- v6_req_string("editList", list_string)

  v6_request(req_str)
}

#' Returns details for a specific List.
#'
#' @param list_id (int) The ID of the List to retrieve.
#' @return a data frame containing a single record of List details.
#'         See \code{\link{v6_listDetails}} for a description of the values returned.
#' @seealso \url{http://developers.vision6.com.au/3.0/method/getListById}
#' @export
v6_getListById <- function(list_id) {
  req_str <- v6_req_string("getListById", list_id)

  v6_request(req_str)
}

#' Returns the list of preferred Olson timezones used in the system.
#'
#' @return a data frame of timezones with their names.
#' @seealso \url{http://developers.vision6.com.au/3.0/method/getTimezoneList}
#' @export
v6_getTimezoneList <- function() {
  req_str <- v6_req_string("getTimezoneList")

  v6_request(req_str)
}

#' Returns the Lists that match the search criteria.
#'
#' @param search_criteria (array - optional)
#'        An array of search criteria. See the remarks section below for the
#'        list of values which are searchable. If you do not specify search
#'        criteria, all Lists are returned.
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
#' @return a data frame containing zero or more records of List details.
#'         See \code{\link{v6_listDetails}} for a description of the values returned.
#' @seealso \url{http://developers.vision6.com.au/3.0/method/searchLists}
#' @export
v6_searchLists <- function(search_criteria = "[]",
                           limit = 0,
                           offset = 0,
                           sort_by = "",
                           sort_order = "") {
  sort_by <- v6_quote(sort_by)
  sort_order <- v6_quote(sort_order)

  req_str <- v6_req_string("searchLists",
                           c(search_criteria, limit, offset,
                             sort_by, sort_order))

  v6_request(req_str)
}


