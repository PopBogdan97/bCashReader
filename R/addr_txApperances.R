#' The total amount of transaction made by an address.
#'
#' @param string input Bitcoin Cash address
#' @return data frame with the total amount of transactions made by the address.
#' @export
#' @description Get the total amount of transactions made by the address.
#' @author Vasile Adrian Bogdan Pop
#' @examples
#' addr_txApperances(address)
#' addr_txApperances("address string here")
addr_txApperances <- function(address){
  base <- "https://blockdozer.com/insight-api/"
  endpoint <- "addr/"
  txs <- "1"

  call <- paste(base,endpoint,address,"/?noTxList=",txs, sep = "")
  get_history <- GET(call)
  get_history_text <- content(get_history, "text")

  get_history_json <- fromJSON(get_history_text, flatten = TRUE)
  get_history_df <- as.data.frame(get_history_json)
  get_txApperances_df <- data.frame(get_history_df["txApperances"])
  return(get_txApperances_df)
}
