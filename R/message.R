
#' v6_addMessage
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/addMessage}
#' @export
v6_addMessage <- function() {
}

#' v6_countMessages
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/countMessages}
#' @export
v6_countMessages <- function() {
}

#' v6_deleteMessage
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/deleteMessage}
#' @export
v6_deleteMessage <- function() {
}

#' v6_editMessage
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/editMessage}
#' @export
v6_editMessage <- function() {
}

#' v6_getMessageById
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/getMessageById}
#' @export
v6_getMessageById <- function() {
}

#' v6_getMessagesSentToContact
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/getMessagesSentToContact}
#' @export
v6_getMessagesSentToContact <- function() {
}

#' v6_searchMessages
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/searchMessages}
#' @export
v6_searchMessages <- function(search_criteria = "[]",
                              limit = 0,
                              offset = 0,
                              sort_by = "",
                              sort_order = "") {
  sort_by <- v6_quote(sort_by)
  sort_order <- v6_quote(sort_order)

  req_str <- v6_req_string("searchMessages",
                           c(search_criteria, limit, offset,
                             sort_by, sort_order))

  v6_request(req_str)
}


