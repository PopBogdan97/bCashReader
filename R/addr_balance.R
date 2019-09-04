#' The balance of an address.
#'
#' @param string input Bitcoin Cash address
#' @return data frame with the balance of the the address in both, Bitcoin Cash and Satoshi.
#' @export
#' @description Get the balance of a Bitcoin Cash address.
#' @author Vasile Adrian Bogdan Pop
#' @examples
#' addr_balance(address)
#' addr_balance("address string here")
addr_balance <- function(address){
  base <- "https://blockdozer.com/insight-api/"
  endpoint <- "addr/"
  txs <- "1"

  call <- paste(base,endpoint,address,"/?noTxList=",txs, sep = "")
  get_history <- GET(call)
  get_history_text <- content(get_history, "text")

  get_history_json <- fromJSON(get_history_text, flatten = TRUE)
  get_history_df <- as.data.frame(get_history_json)
  get_balance_df <- data.frame(get_history_df["balance"],get_history_df["balanceSat"])
  return(get_balance_df)
}
