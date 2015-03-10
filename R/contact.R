
#' v6_addContacts
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/addContacts}
#' @export
v6_addContacts <- function() {
}

#' v6_confirmContact
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/confirmContact}
#' @export
v6_confirmContact <- function() {
}

#' v6_countContacts
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/countContacts}
#' @export
v6_countContacts <- function() {
}

#' v6_countPreviousUnsubscribers
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/countPreviousUnsubscribers}
#' @export
v6_countPreviousUnsubscribers <- function() {
}

#' v6_deactivateContact
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/deactivateContact}
#' @export
v6_deactivateContact <- function() {
}

#' v6_deleteContacts
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/deleteContacts}
#' @export
v6_deleteContacts <- function() {
}

#' v6_editContacts
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/editContacts}
#' @export
v6_editContacts <- function() {
}

#' v6_getContactById
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/getContactById}
#' @export
v6_getContactById <- function() {
}

#' v6_reactivateContact
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/reactivateContact}
#' @export
v6_reactivateContact <- function() {
}

#' v6_resubscribeContact
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/resubscribeContact}
#' @export
v6_resubscribeContact <- function(list_id, contact_id) {
  req_str <- v6_req_string("resubscribeContact", c(list_id, contact_id))

  v6_request(req_str)
}


#' v6_searchContacts
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/searchContacts}
#' @export
v6_searchContacts <- function(list_id,
                              search_criteria = "[]",
                              limit = 0,
                              offset = 0,
                              sort_by = "",
                              sort_order = "",
                              returned_fields = "all") {
  sort_by <- v6_quote(sort_by)
  sort_order <- v6_quote(sort_order)

  req_str <- v6_req_string("searchContacts",
                           c(list_id, search_criteria, limit, offset,
                             sort_by, sort_order, toJSON(returned_fields)))

  v6_request(req_str)
}

#' v6_searchPreviousUnsubscribers
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/searchPreviousUnsubscribers}
#' @export
v6_searchPreviousUnsubscribers <- function() {
}

#' v6_subscribeContact
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/subscribeContact}
#' @export
v6_subscribeContact <- function() {
}

#' v6_unsubscribeContact
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/unsubscribeContact}
#' @export
v6_unsubscribeContact <- function(list_id, email_address) {
  email_address <- v6_quote(email_address)

  req_str <- v6_req_string("unsubscribeContact", c(list_id, email_address))

  v6_request(req_str)
}

#' v6_unsubscribeContactById
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/unsubscribeContactById}
#' @export
v6_unsubscribeContactById <- function(list_id, contact_id) {
  req_str <- v6_req_string("unsubscribeContact", c(list_id, contact_id))

  v6_request(req_str)
}


