
#' Counts the number of Files that match the search criteria.
#'
#' @param search_criteria (array - optional) An array of search criteria that
#'        selects the Files to be counted. See \\code{\link{v6_FileDetails}} for a
#'        description of the values that can be searched on.
#' @return The number of Files that match the search criteria.
#' @seealso \url{http://developers.vision6.com.au/3.0/method/countFiles}
#' @export
v6_countFiles <- function(search_criteria = "[]") {
  req_str <- v6_req_string("countFiles", search_criteria)

  v6_request(req_str)
}

#' Deletes the specified File.
#'
#' @param file_id (int) The ID of the File to delete.
#' @return true on success.
#' @seealso \url{http://developers.vision6.com.au/3.0/method/deleteFile}
#' @export
v6_deleteFile <- function(file_id) {
  req_str <- v6_req_string("deleteFile", file_id)

  v6_request(req_str)
}

#' Returns the ID of a File with the specified name.
#'
#' @param file_name (string) File name to search for.
#' @param folder_id (int) ID of Folder to search in.
#' @return ID of the matched file.
#' @seealso \url{http://developers.vision6.com.au/3.0/method/findFileInFolder}
#' @export
v6_findFileInFolder <- function(file_name, folder_id) {
  file_name <- v6_quote(file_name)

  req_str <- v6_req_string("findFileInFolder", c(file_name, folder_id))

  v6_request(req_str)
}

#' Returns the details of a specific File.
#'
#' @param file_id (int) The File ID
#' @return a data frame containing a single record of File details.
#'         See \code{\link{v6_fileDetails}} for a description of the values returned.
#' @seealso \url{http://developers.vision6.com.au/3.0/method/getFileById}
#' @export
v6_getFileById <- function(file_id) {
  req_str <- v6_req_string("getFileById", file_id)

  v6_request(req_str)
}

#' Returns the Files that match the search criteria.
#'
#' @param search_criteria (array - optional)
#'        An array of search criteria. See the remarks section below for the
#'        list of values which are searchable. If you do not specify search
#'        criteria, all Files are returned.
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
#' @return a data frame containing zero or more records of File details.
#'         See \code{\link{v6_fileDetails}} for a description of the values returned.
#' @seealso \url{http://developers.vision6.com.au/3.0/method/searchFiles}
#' @export
v6_searchFiles <- function(search_criteria = "[]",
                           limit = 0,
                           offset = 0,
                           sort_by = "",
                           sort_order = "") {
  sort_by <- v6_quote(sort_by)
  sort_order <- v6_quote(sort_order)

  req_str <- v6_req_string("searchFiles",
                           c(search_criteria, limit, offset,
                             sort_by, sort_order))

  v6_request(req_str)
}

#' Uploads a File into the File Manager.
#'
#' @param file_details (array) An associative array with the following values:
#' \tabular{lll}{
#'   Key \tab Type \tab Description \cr
#'   name \tab string \tab The name to use for saving the File once it has been uploaded. \cr
#'   data \tab string \tab The file data encoded with MIME base64. \cr
#' }
#' @param folder_id (int) The ID of the Folder that will contain the uploaded File.
#' @param duplicate_action (string) Action to take if a File with the same name
#'        as the upload File exists. Valid values are:
#' \itemize{
#'   \item increment - create a new File named filename_count.jpg, where
#'         filename is the name of the original file, and count is an
#'         incremental index for Files with this filename. The first duplicate
#'         is named filename_1.jpg.
#'   \item overwrite - overwrite the existing File with the same name.
#' }
#' @param skip_resize_images (bool - optional) Whether or not to resize small images.
#'        Valid values are:
#' \itemize{
#'   \item true - Do not resize images.
#'   \item false - Resize images to a maximum value of 800px for width and 800px
#'         for height. Image ratio is kept during resizing.
#' }
#' @param skip_resample_images (bool - optional) Whether or not to correct for
#'        lower image quality when resizing. Valid values are:
#' \itemize{
#'   \item true - Correct for degraded image quality when resizing.
#'   \item false - Do not correct for degraded image quality when resizing.
#' }
#' @return a list on success containing:
#' \itemize{
#'   \item the ID of the uploaded File
#'   \item the URL for the File
#' }
#' @seealso \url{http://developers.vision6.com.au/3.0/method/uploadBase64FileData}
#' @export
v6_uploadBase64FileData <- function(folder_id,
                                    duplicate_action,
                                    skip_resize_images,
                                    skip_resample_images) {
  duplicate_action <- v6_quote(duplicate_action)
  skip_resize_images <- v6_bool(skip_resize_images)
  skip_resample_images <- v6_bool(skip_resample_images)

  req_str <- v6_req_string("uploadBase64FileData",
                           c(folder_id, duplicate_action,
                             skip_resize_images, skip_resample_images))

  v6_request(req_str)
}

