# library(vision6)

options(v6_url = "http://research.srcentre.com.au/api/jsonrpcserver.php?version=3.0",
        v6_key = "7b079fce5ce061222fc071c7165323e17b06fdd602875b09d27b6abf1653d5a8")
options(warn = 0)

# options()

multi_batch <- function(batch_list, batch_func, source_desc) {
  out <- NULL
  cat("\nStarting", deparse(substitute(batch_func)), ":\n")
  for (i in batch_list) {
    cat(".")
    # if (which(batch$id == i) %% 100 == 0) cat(which(batch$id == i), "\n")
    x <- batch_func(i)
    if (length(x) > 0) {
      x$source <- source_desc
      x$batch_id <- i
      out <- bind_rows(out, x)
    }
  }
  cat("\nDone.\n")
  # out
}

multi_contacts <- function(lid, n, size = 1000){
  if (n <= size){
    out <- v6_searchContacts(lid)
  } else {
    x <- NULL
    for (i in 1:ceiling(n/size)){
      x[[i]] <-  v6_searchContacts(lid, limit = size, offset = (i * size) - size)
    }

    out <- do.call(rbind,x)
  }
  if (nrow(out) != n) stop ("error: contact size not matching count")
  # append listid
  out$list_id <- lid
  out
}

v6_links <- function(b, batchlinks) {
  
  x <- NULL
  for (i in unique(batchlinks)){
    x[[i]] <- v6_getBatchLinkContacts(b, i)
    x$batch_id <- b
  }
  out <- do.call(rbind, x)
  out
}


#-------------------------------------------------------------------------------

# check for api
# getOption

# check for lists
v6_countLists()

all_lists <- v6_searchLists()

list_id <- all_lists$id

#-------------------------------------------------------------------------------

v6 <- structure(list(), class = "v6")

v6$list_summary <- structure(all_lists, class = "v6summary")

v6$list <- structure(sapply(as.character(list_id),function(x) NULL), class = "v6list")

str(v6)

#-------------------------------------------------------------------------------

# Get all contacts for each list
for (lid in list_id){
  
  # Get the count of contacts for each list
  n <- v6_countContacts(lid)
  
  # Get contacts in batches to avoid error with last return strings
  if (n > 0) {
    v6$list[[as.character(lid)]]$contacts <- multi_contacts(lid, n, size = 1000)
  }
  
}


#-------------------------------------------------------------------------------

# Get batches
v6$batch_summary <- v6_searchBatches(search_criteria = paste0("[",
                                                              paste0(c(paste0("[[ \"list_id\", \"in\",", toJSON(list_id), " ]]"),
                                                                       v6_search("is_test", "exactly", 0),
                                                                       v6_search("send_status", "exactly", "completed")),
                                                                     collapse = ","),
                                                              "]",
                                                              collapse = ""))

# get messages
v6$messages_summary <- v6_searchMessages()
v6$messages <- structure(sapply(as.character(v6$messages_summary$id),function(x) NULL), class = "v6messages")

for (mid in v6$messages_summary$id){
  v6$messages[[as.character(mid)]] <- v6_getMessageById(mid)
}

#-------------------------------------------------------------------------------

# get all batch information for each list

for (lid in list_id) {
  print(paste0("List ", which(list_id %in% lid), " of ", length(list_id)))
  batches <- v6$batch_summary$id[v6$batch_summary$list_id %in% lid]
  v6$list[[as.character(lid)]]$batch <- structure(sapply(as.character(batches),function(x) NULL), class = "v6batch")
  if (length(batches) > 0) {
    for(b in batches){
      out <- v6_getBatchContacts(b) 
      y <- v6_getBatchOpened(b) 
      z <- v6_getBatchComplained(b)
      
      if (length(y) > 0) {
        y <- y[, c('send_id', 'device', 'mail_client')]
        names(y) <- c('send_id', 'device_type', 'mail_client')
        out <- merge(out, y, by = "send_id", all.x = T)
      }
      
      if (length(z) > 0) {
        z <- z[, c('send_id', 'complaint_timestamp', 'complaint_provider_type', 'is_complaint' )]
        out <- merge(out, z, by = "send_id", all.x = T)
      }
      
      out$batchid <- b
      out$listid <- lid
      
      v6$list[[as.character(lid)]]$batch[[as.character(b)]]$contacts <- out
      v6$list[[as.character(lid)]]$batch[[as.character(b)]]$statistics <- v6_getBatchStatistics(b)
      v6$list[[as.character(lid)]]$batch[[as.character(b)]]$linkstatistics <- v6_getBatchLinkStatistics(b)
      
      # links clicked
      batchlinks <- v6$list[[as.character(lid)]]$batch[[as.character(b)]]$linkstatistics$link_url
      
      if(length(batchlinks) > 0){
        v6$list[[as.character(lid)]]$batch[[as.character(b)]]$links <- v6_links(b, batchlinks) 
      }
    }
  }
}

#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------


# asdf <- lapply(v6$list, `[[`, "contacts")
# 
# zxc <- unlist(lapply(v6$list, function(x){
#   lapply(x[['batch']], `[[`, "contacts")
# }), recursive = FALSE)



