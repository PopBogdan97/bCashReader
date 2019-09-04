#' The total amount of unconfirmed transaction made by an address.
#'
#' @param string input Bitcoin Cash address
#' @return data frame with the total amount of unconfirmed transactions made by the address.
#' @export
#' @description Get the total amount of unconfirmed transactions made by the address.
#' @author Vasile Adrian Bogdan Pop
#' @examples
#' addr_unconfirmedTransactions(address)
#' addr_unconfirmedTransactions("address string here")
addr_unconfirmedTransactions <- function(address){
  base <- "https://blockdozer.com/insight-api/"
  endpoint <- "addr/"
  txs <- "1"

  call <- paste(base,endpoint,address,"/?noTxList=",txs, sep = "")
  get_history <- GET(call)
  get_history_text <- content(get_history, "text")

  get_history_json <- fromJSON(get_history_text, flatten = TRUE)
  get_history_df <- as.data.frame(get_history_json)
  get_unconfirmedTransactions_df <- data.frame(get_history_df["unconfirmedTxApperances"])
  return(get_unconfirmedTransactions_df)
}
