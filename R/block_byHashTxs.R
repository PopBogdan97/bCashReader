#' Retrieve the transactions hashes contained in a block by his hash.
#'
#' @param string input hash of a Bitcoin Cash block
#' @return data frame with the transaction hashes of a specific block.
#' @export
#' @description Get the transaction hashes of a specific Bitcoin Cash block
#' @author Vasile Adrian Bogdan Pop
#' @examples
#' block_byHashTxs(hash)
#' block_byHashTxs("block hash here")
block_byHashTxs <- function(hash){
  base <- "https://blockdozer.com/insight-api/"
  endpoint <- "block/"
  txs <- "0"

  call <- paste(base,endpoint,hash,"/?noTxList=",txs, sep = "")
  get_blockTxs <- GET(call)
  get_blockTxs_text <- content(get_blockTxs, "text")

  get_blockTxs_json <- fromJSON(get_blockTxs_text, flatten = TRUE)


  get_blockTxs_df <- as.data.frame(get_blockTxs_json$tx)
  colnames(get_blockTxs_df) <- c("Transactions")
  return(get_blockTxs_df)
}
