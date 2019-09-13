#' The history of an address.
#'
#' @param string input Bitcoin Cash address
#' @return data frame with the general data (hystory) of the the address in both.
#' @export
#' @description Get the general data (hystory) of a Bitcoin Cash address.
#' @author Vasile Adrian Bogdan Pop
#' @examples
#' addr_hystory(address)
#' addr_hystory("address string here")
addr_history <- function(address){
  base <- "https://blockdozer.com/insight-api/"
  endpoint <- "addr/"
  txs <- "1"

  call <- paste(base,endpoint,address,"/?noTxList=",txs, sep = "")
  get_history <- GET(call)
  get_history_text <- content(get_history, "text")

  get_history_json <- fromJSON(get_history_text, flatten = TRUE)
  get_history_df <- as.data.frame(get_history_json)
  return(get_history_df)
}
