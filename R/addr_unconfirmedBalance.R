#' The unconfirmed balance of an address.
#'
#' @param string input Bitcoin Cash address
#' @return data frame with the unconfirmed balance of the the address in both, Bitcoin Cash and Satoshi.
#' @export
#' @description Get the unconfirmed balance of a Bitcoin Cash address.
#' @author Vasile Adrian Bogdan Pop
#' @examples
#' addr_unconfirmedBalance(address)
#' addr_unconfirmedBalance("address string here")
addr_unconfirmedBalance <- function(address){
  base <- "https://blockdozer.com/insight-api/"
  endpoint <- "addr/"
  txs <- "1"

  call <- paste(base,endpoint,address,"/?noTxList=",txs, sep = "")
  get_history <- GET(call)
  get_history_text <- content(get_history, "text")

  get_history_json <- fromJSON(get_history_text, flatten = TRUE)
  get_history_df <- as.data.frame(get_history_json)
  get_unconfirmedBalance_df <- data.frame(get_history_df["unconfirmedBalance"],get_history_df["unconfirmedBalanceSat"])
  return(get_unconfirmedBalance_df)
}
