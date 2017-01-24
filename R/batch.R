
#' v6_addBatch
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/addBatch}
#' @export
v6_addBatch <- function() {
}

#' v6_addBatchByContactSearch
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/addBatchByContactSearch}
#' @export
v6_addBatchByContactSearch <- function(message_id,
                                       lists,
                                       search_criteria = "[]",
                                       send_time = "",
                                       is_scheduled = FALSE) {

  req_str <- v6_req_string("addBatchByContactSearch", 
                           c(message_id, toJSON(lists), search_criteria,
                             send_time, v6_bool(is_scheduled)))

  v6_request(req_str)
}

#' Counts the number of Batches that match the search criteria.
#'
#' @param search_criteria (array - optional) An array of search criteria that
#'        selects the Batches to be counted. See \\code{\link{v6_batchDetails}}
#'        for a description of the values that can be searched on.
#' @return The number of Batches that match the search criteria.
#' @seealso \url{http://developers.vision6.com.au/3.0/method/countBatches}
#' @export
v6_countBatches <- function(search_criteria = "[]") {
  req_str <- v6_req_string("countBatches", search_criteria)

  v6_request(req_str)
}

#' Deletes the specified Batch.
#'
#' @param batch_id (int) The ID of the Batch to delete.
#' @return true on success.
#' @seealso \url{http://developers.vision6.com.au/3.0/method/deleteBatch}
#' @export
v6_deleteBatch <- function(batch_id) {
  req_str <- v6_req_string("deleteBatch", batch_id)

  v6_request(req_str)
}

#' v6_editBatch
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/editBatch}
#' @export
v6_editBatch <- function() {
}

#' v6_getAllCurrentBatches
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/getAllCurrentBatches}
#' @export
v6_getAllCurrentBatches <- function() {
}

#' v6_getAutoresponderBatchId
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/getAutoresponderBatchId}
#' @export
v6_getAutoresponderBatchId <- function() {
}

#' v6_getBatchAutoDeactivated
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/getBatchAutoDeactivated}
#' @export
v6_getBatchAutoDeactivated <- function(batch_id,
                                       search_criteria = "[]",
                                       limit = 0,
                                       offset = 0,
                                       sort_by = "",
                                       sort_order = "") {
  sort_by <- v6_quote(sort_by)
  sort_order <- v6_quote(sort_order)

  req_str <- v6_req_string("getBatchAutoDeactivated",
                           c(batch_id, search_criteria, limit, offset,
                             sort_by, sort_order))

  v6_request(req_str)
}

#' v6_getBatchBounced
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/getBatchBounced}
#' @export
v6_getBatchBounced <- function(batch_id,
                               search_criteria = "[]",
                               limit = 0,
                               offset = 0,
                               sort_by = "",
                               sort_order = "") {
  sort_by <- v6_quote(sort_by)
  sort_order <- v6_quote(sort_order)

  req_str <- v6_req_string("getBatchBounced",
                           c(batch_id, search_criteria, limit, offset,
                             sort_by, sort_order))

  v6_request(req_str)
}

#' v6_getBatchById
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/getBatchById}
#' @export
v6_getBatchById <- function(batch_id) {
  req_str <- v6_req_string("getBatchById", batch_id)

  v6_request(req_str)
}

#' v6_getBatchComplained
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/getBatchComplained}
#' @export
v6_getBatchComplained <- function(batch_id,
                                  search_criteria = "[]",
                                  limit = 0,
                                  offset = 0,
                                  sort_by = "",
                                  sort_order = "") {
  sort_by <- v6_quote(sort_by)
  sort_order <- v6_quote(sort_order)

  req_str <- v6_req_string("getBatchComplained",
                           c(batch_id, search_criteria, limit, offset,
                             sort_by, sort_order))

  v6_request(req_str)
}

#' v6_getBatchContactLinks
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/getBatchContactLinks}
#' @export
v6_getBatchContactLinks <- function(batch_id,
                                    send_id = 0,
                                    search_criteria = "[]",
                                    limit = 0,
                                    offset = 0,
                                    sort_by = "",
                                    sort_order = "") {
  sort_by <- v6_quote(sort_by)
  sort_order <- v6_quote(sort_order)

  req_str <- v6_req_string("getBatchContactLinks",
                           c(batch_id, send_id, search_criteria, limit, offset,
                             sort_by, sort_order))

  v6_request(req_str)

}

#' v6_getBatchContacts
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/getBatchContacts}
#' @export
v6_getBatchContacts <- function(batch_id,
                                  search_criteria = "[]",
                                  limit = 0,
                                  offset = 0,
                                  sort_by = "",
                                  sort_order = "") {
  sort_by <- v6_quote(sort_by)
  sort_order <- v6_quote(sort_order)

  req_str <- v6_req_string("getBatchContacts",
                           c(batch_id, search_criteria, limit, offset,
                             sort_by, sort_order))

  v6_request(req_str)
}

#' v6_getBatchIdByQueueId
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/getBatchIdByQueueId}
#' @export
v6_getBatchIdByQueueId <- function(queue_id) {
  req_str <- v6_req_string("getBatchIdByQueueId", queue_id)
  
  v6_request(req_str)
}

#' v6_getBatchLinkContacts
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/getBatchLinkContacts}
#' @export
v6_getBatchLinkContacts <- function(batch_id,
                                    link,
                                    search_criteria = "[]",
                                    limit = 0,
                                    offset = 0,
                                    sort_by = "",
                                    sort_order = "") {
  link <- v6_quote(link)
  sort_by <- v6_quote(sort_by)
  sort_order <- v6_quote(sort_order)

  req_str <- v6_req_string("getBatchLinkContacts",
                           c(batch_id, link, search_criteria, limit, offset,
                             sort_by, sort_order))

  v6_request(req_str)

}

#' v6_getBatchLinkStatistics
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/getBatchLinkStatistics}
#' @export
v6_getBatchLinkStatistics <- function(batch_id) {
  req_str <- v6_req_string("getBatchLinkStatistics", batch_id)

  v6_request(req_str)
}

#' v6_getBatchNotOpened
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/getBatchNotOpened}
#' @export
v6_getBatchNotOpened <- function(batch_id,
                                 search_criteria = "[]",
                                 limit = 0,
                                 offset = 0,
                                 sort_by = "",
                                 sort_order = "") {
  sort_by <- v6_quote(sort_by)
  sort_order <- v6_quote(sort_order)

  req_str <- v6_req_string("getBatchNotOpened",
                           c(batch_id, search_criteria, limit, offset,
                             sort_by, sort_order))

  v6_request(req_str)
}

#' v6_getBatchOpened
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/getBatchOpened}
#' @export
v6_getBatchOpened <- function(batch_id,
                              search_criteria = "[]",
                              limit = 0,
                              offset = 0,
                              sort_by = "",
                              sort_order = "") {
  sort_by <- v6_quote(sort_by)
  sort_order <- v6_quote(sort_order)

  req_str <- v6_req_string("getBatchOpened",
                           c(batch_id, search_criteria, limit, offset,
                             sort_by, sort_order))

  v6_request(req_str)
}

#' v6_getBatchResponses
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/getBatchResponses}
#' @export
v6_getBatchResponses <- function(batch_id,
                                 search_criteria = "[]",
                                 limit = 0,
                                 offset = 0,
                                 sort_by = "",
                                 sort_order = "") {
  sort_by <- v6_quote(sort_by)
  sort_order <- v6_quote(sort_order)

  req_str <- v6_req_string("getBatchResponses",
                           c(batch_id, search_criteria, limit, offset,
                             sort_by, sort_order))

  v6_request(req_str)
}

#' v6_getBatchStatistics
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/getBatchStatistics}
#' @export
v6_getBatchStatistics <- function(batch_id) {
  req_str <- v6_req_string("getBatchStatistics", batch_id)

  v6_request(req_str)
}

#' v6_getBatchStatus
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/getBatchStatus}
#' @export
v6_getBatchStatus <- function(batch_id) {
  req_str <- v6_req_string("getBatchStatus", batch_id)

  v6_request(req_str)
}

#' v6_getBatchUnsubscribed
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/getBatchUnsubscribed}
#' @export
v6_getBatchUnsubscribed <- function(batch_id,
                                    search_criteria = "[]",
                                    limit = 0,
                                    offset = 0,
                                    sort_by = "",
                                    sort_order = "") {
  sort_by <- v6_quote(sort_by)
  sort_order <- v6_quote(sort_order)

  req_str <- v6_req_string("getBatchUnsubscribed",
                           c(batch_id, search_criteria, limit, offset,
                             sort_by, sort_order))

  v6_request(req_str)
}

#' v6_getBatchUpdated
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/getBatchUpdated}
#' @export
v6_getBatchUpdated <- function() {
}

#' v6_searchBatches
#'
#' @seealso \url{http://developers.vision6.com.au/3.0/method/searchBatches}
#' @export
v6_searchBatches <- function(search_criteria = "[]",
                             limit = 0,
                             offset = 0,
                             sort_by = "",
                             sort_order = "") {
  sort_by <- v6_quote(sort_by)
  sort_order <- v6_quote(sort_order)

  req_str <- v6_req_string("searchBatches",
                           c(search_criteria, limit, offset,
                             sort_by, sort_order))

  v6_request(req_str)
}

