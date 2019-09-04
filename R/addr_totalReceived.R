#' The total amount of Bitcoin Cash received by an address.
#'
#' @param string input Bitcoin Cash address
#' @return data frame with the total amount of crypto received by the address in both, Bitcoin Cash and Satoshi.
#' @export
#' @description Get the total amount of  Bitcoin Cash received by the address.
#' @author Vasile Adrian Bogdan Pop
#' @examples
#' addr_totalReceived(address)
#' addr_totalReceived("address string here")
addr_totalReceived <- function(address){
  base <- "https://blockdozer.com/insight-api/"
  endpoint <- "addr/"
  txs <- "1"

  call <- paste(base,endpoint,address,"/?noTxList=",txs, sep = "")
  get_history <- GET(call)
  get_history_text <- content(get_history, "text")

  get_history_json <- fromJSON(get_history_text, flatten = TRUE)
  get_history_df <- as.data.frame(get_history_json)
  get_totalReceived_df <- data.frame(get_history_df["totalReceived"],get_history_df["totalReceivedSat"])
  return(get_totalReceived_df)
}
