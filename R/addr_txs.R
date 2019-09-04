#' All the transactions hashes of a transaction
#'
#' @param string input Bitcoin Cash address
#' @return data frame with all the transactions made by a Bitcoin Cash address.
#' @export
#' @description Get the all the transactions made by the address.
#' @author Vasile Adrian Bogdan Pop
#' @examples
#' addr_txs(address)
#' addr_txs("address string here")
addr_txs <- function(address){
  base <- "https://blockdozer.com/insight-api/"
  endpoint <- "addr/"
  from <- 0
  to<- 1000

  call <- paste(base,endpoint,address,"?from=",toString(from),"&to=",toString(to), sep = "")
  get_history <- GET(call)
  get_history_text <- content(get_history, "text")

  get_history_json <- fromJSON(get_history_text, flatten = TRUE)
  fin_txs <- as.vector(get_history_json$transactions)
  tx_count = as.integer(get_history_json$txApperances)
  while(tx_count > length(fin_txs)){
    from <- to
    to <- to + 1000
    call <- paste(base,endpoint,address,"?from=",toString(as.integer(from)),"&to=",toString(as.integer(to)), sep = "")
    get_history <- GET(call)
    get_history_text <- content(get_history, "text")

    get_history_json <- fromJSON(get_history_text, flatten = TRUE)
    netx_txs <- as.vector(get_history_json$transactions)
    txs <- fin_txs
    fin_txs <- append(txs,netx_txs)
  }
  get_txs_df <- data.frame("transactions" = fin_txs)
  return(get_txs_df)
}
