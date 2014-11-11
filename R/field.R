
#' Adds a new Field to a List.
#'
#' @param list_id (int) The ID of the List to add the Field to.
#' @param field_details (array) A list or data frame of Field details.
#'        See \code\link{v6_fieldDetails}} for a description of valid values.
#' @return the ID of the newly added Field on success.
#' @seealso \url{http://developers.vision6.com.au/3.0/method/addField}
#' @export
v6_addField <- function(list_id, field_details) {
  field_string <- str_replace(str_replace(toJSON(field_details), "^[", ""), "]$", "")
  req_str <- v6_req_string("addField", c(list_id, field_string))

  v6_request(req_str)
}

#' Counts the number of Fields in a List that match the search criteria.
#'
#' @param list_id (int) ID of the List containing the Fields.
#' @param search_criteria (array - optional) An array of search criteria that
#'        selects the Fields to be counted. See \code\link{v6_fieldDetails}} for
#'        a description of the values that can be searched on.
#' @return The number of Fields in the List that match the search criteria.
#' @seealso \url{http://developers.vision6.com.au/3.0/method/countFields}
#' @export
v6_countFields <- function(list_id, search_criteria = "[]") {
  req_str <- v6_req_string("countFields", c(list_id, search_criteria))

  v6_request(req_str)
}

#' Counts the number of Fields in a List that match the search criteria.
#'
#' @param list_id (int) ID of the List containing the Field.
#' @param field_id (int) ID of the Field to delete.
#' @return The number of Fields in the List that match the search criteria.
#' @seealso \url{http://developers.vision6.com.au/3.0/method/deleteField}
#' @export
v6_deleteField <- function(list_id, field_id) {
  req_str <- v6_req_string("deleteField", c(list_id, field_id))

  v6_request(req_str)
}

#' Edits a Field in a List.
#'
#' @param list_id (int) The ID of the List containing the Field.
#' @param field_details (array) A list or data frame of Field details to be edited.
#'        See \code\link{v6_fieldDetails}} for a description of valid values.
#' @return the ID of the edited Field on success.
#' @seealso \url{http://developers.vision6.com.au/3.0/method/editField}
#' @export
v6_editField <- function(list_id, field_details) {
  field_string <- toJSON(field_details)
  req_str <- v6_req_string("editField", c(list_id, field_string))

  v6_request(req_str)
}

#' Returns details for a specific Field in a List.
#'
#' @param list_id (int) The ID of the List containing the Field.
#' @param field_id (int) The ID of the Field to retrieve.
#' @return a data frame containing a single record of Field details.
#'         See \code{\link{v6_fieldDetails}} for a description of the values returned.
#' @seealso \url{http://developers.vision6.com.au/3.0/method/getFieldById}
#' @export
v6_getFieldById <- function(list_id, field_id) {
  req_str <- v6_req_string("getFieldById", c(list_id, field_id))

  v6_request(req_str)
}

#' Returns the Folder ID for a File type Field in a List.
#'
#' @param list_id (int) The list ID of the Field.
#' @param field_id (int) The ID of the Field to get Folder ID for.
#' @return the Folder ID for the Field on success.
#' @seealso \url{http://developers.vision6.com.au/3.0/method/getFolderIdForField}
#' @export
v6_getFolderIdForField <- function(list_id, field_id) {
  req_str <- v6_req_string("getFolderIdForField", c(list_id, field_id))

  v6_request(req_str)
}

#' Returns the Fields in the List that match the search criteria.
#'
#' @param list_id (int) The ID of the List.
#' @param search_criteria (array - optional)
#'        An array of search criteria. See the remarks section below for the
#'        list of values which are searchable. If you do not specify search
#'        criteria, all Fields in the List are returned.
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
#' @seealso \url{http://developers.vision6.com.au/3.0/method/searchFields}
#' @export
v6_searchFields <- function(list_id,
                            search_criteria = "[]",
                            limit = 0,
                            offset = 0,
                            sort_by = "",
                            sort_order = "") {
  sort_by <- v6_quote(sort_by)
  sort_order <- v6_quote(sort_order)

  req_str <- v6_req_string("searchFields",
                           c(list_id, search_criteria, limit, offset,
                             sort_by, sort_order))

  v6_request(req_str)
}

#' Sets the File Folder ID for a File type Field in a List.
#'
#' @param list_id (int) The List ID of the Field.
#' @param field_id (int) The Field ID.
#' @param folder_id (int) The Folder ID for the Field.
#' @return true on success.
#' @seealso \url{http://developers.vision6.com.au/3.0/method/setFieldFolderId}
#' @export
v6_setFieldFolderId <- function(list_id, field_id, folder_id) {
  req_str <- v6_req_string("setFieldFolderId", c(list_id, field_id, folder_id))

  v6_request(req_str)
}


