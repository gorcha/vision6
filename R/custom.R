#' Multi batch
#' 
#' Applies a batch method over a list of multiple batches
#'
#' @param batch_list 
#' @param batch_func 
#' @param source_desc 
#'
#' @export
multi_batch <- function(batch_list, batch_func, source_desc) {
  out <- NULL
  cat("\nStarting", deparse(substitute(batch_func)), ":\n")
  for (i in batch_list) {
    cat(".")
    if (which(batch$id == i) %% 100 == 0) cat(which(batch$id == i), "\n")
    x <- batch_func(i)
    if (length(x) > 0) {
      x$source <- source_desc
      x$batch_id <- i
      out <- bind_rows(out, x)
    }
  }
  cat("\nDone.\n")
  out
}

#' Multi contacts
#' 
#' A wrapper for v6_searchContacts where the numer of contacts is large. 
#'
#' @param lid 
#' @param n 
#' @param size 
#' @param returned_fields 
#' @param ... 
#'
#' @export
multi_contacts <- function(lid, n = v6_countContacts(lid), size = 1000, returned_fields, ...) {
  
  if (n <= size){
    out <- v6_searchContacts(lid, returned_fields = returned_fields, limit = size, ...)
  } else {
    # progress bar
    if (interactive()) {
      env <- environment()
      pb_Total <- n
      counter <- 0
      pb <- txtProgressBar(min = 0, max = pb_Total, style = 3)
    } 
    
    x <- NULL
    for (i in 1:ceiling(n/size)){
      x[[i]] <-  v6_searchContacts(lid, returned_fields = returned_fields, limit = size, offset = (i * size) - size, ...)
      if (interactive()) {
        curVal <- get("counter", envir = env)
        assign("counter", curVal + nrow(x[[i]]) ,envir=env)
        setTxtProgressBar(get("pb", envir=env), curVal + nrow(x[[i]]))
      }
    }
    out <- do.call(rbind,x)
    if (interactive()) {
      close(pb)
    }
  }
  
  if (nrow(out) != n) warning ("warning: listid ", lid, " downloaded contact size ", nrow(out), " does not match provided `n` ", n)
  out
}

#' Multi edit
#' 
#' A wrapper for v6_editContacts for large number contacts to edit
#'
#' @param list_id 
#' @param contacts 
#' @param chunk_size 
#' @param ... 
#'
#' @export
multi_edit <- function(list_id, contacts, chunk_size = 5000, ...) {
  n_chunks <- ceiling(nrow(contacts) / chunk_size)
  
  for (i in 1:n_chunks) {
    start_row <- 1 + chunk_size * (i - 1)
    end_row <- min(nrow(contacts), chunk_size * i)
    
    cat('Uploading records', start_row, 'to', end_row, '\n')
    
    the_chunk <- contacts[start_row:end_row,]
    t0 <- Sys.time()
    result <- v6_editContacts(list_id, the_chunk, ...)
    # print(Sys.time() - t0, '\n')
  }
  return(result)
}