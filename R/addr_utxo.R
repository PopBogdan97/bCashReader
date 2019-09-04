#' The unspent transactions of an address.
#'
#' @param string input Bitcoin Cash address
#' @return data frame with the unspent transactions of an address.
#' @export
#' @description Get the unspent transactions of an address.
#' @author Vasile Adrian Bogdan Pop
#' @examples
#' addr_utxo(address)
#' addr_utxo("address string here")
addr_utxo <- function(address){
  base <- "https://blockdozer.com/insight-api/"
  endpoint <- "addr/"

  call <- paste(base,endpoint,address,"/utxo", sep = "")
  get_utxo <- GET(call)
  get_utxo_text <- content(get_utxo, "text")

  get_utxo_json <- fromJSON(get_utxo_text, flatten = TRUE)
  get_utxo_df <- as.data.frame(get_utxo_json)

  return(get_utxo_df)
}
