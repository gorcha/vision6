
options(v6_url = "http://research.srcentre.com.au/api/jsonrpcserver.php?version=3.0",
        v6_key = "de13485929e10e7a4a878f93d4e7981fde1251c3e3c228a3fa9595fad4e75a38")

v6_error_codes_file <- system.file("extdata",
                                   "error_codes.txt",
                                   package="vision6")

v6_error_codes <- read.delim(v6_error_codes_file, row.names = 1,
                             stringsAsFactors = FALSE)

#-------------------------------------------------------------------------

v6_quote <- function(d) {
  paste0("\"", d, "\"")
}

v6_bool <- function(d) {
  if (d == TRUE) {
    return("true")
  } else if (d == FALSE) {
    return("false")
  } else {
    return("")
  }
}

v6_req_string <- function(method, params = NULL) {
  req_string <- paste0(
    "{
      \"id\": 1,
      \"method\": \"", method, "\",
      \"params\": [
        \"", getOption("v6_key"), "\"
        ", ifelse(is.null(params), "", paste0(", ", params, collapse = "")), "
      ]
    }"
  )

  gsub("\\n", "", req_string)
}

v6_search <- function(name, operator, value) {
  max_len <- max(length(name), length(operator), length(value))

  name     <- rep_len(name, max_len)
  operator <- rep_len(operator, max_len)
  value    <- rep_len(value, max_len)

  search_str <- c()

  for (i in 1:length(value)) {
    search_str <- c(search_str, paste0("[ \"",
                                       name[i],
                                       "\", \"",
                                       operator[i],
                                       "\", \"",
                                       value[i],
                                       "\" ]"))
  }

  paste0("[", paste0(search_str, collapse = ", "), "]")
}

v6_request <- function(req_str) {
  req_return <- POST(getOption("v6_url"), body = req_str, config = content_type_json())

  req_json <- content(req_return, type = "text/plain")
  req_json <- gsub("^[^[]*\\[", "[", req_json)
  req_json <- gsub("\\][^]]*$", "]", req_json)

  ret_val <- fromJSON(req_json)

  if (identical(names(ret_val), c("id", "result", "error"))) {
    if (is.null(ret_val$result)) {
      stop("-- Vision6 ", ret_val$error$message, " --\n",
           v6_error_codes[as.character(ret_val$error$code), "description"],
           call. = FALSE)
    } else {
      return(ret_val$result)
    }
  } else {
    return(ret_val)
  }
}

