#' Retrieve the information contained in a block by his height.
#'
#' @param string input height of a Bitcoin Cash block
#' @return data frame with the information of a specific block.
#' @export
#' @description Get the informations contained in a specific Bitcoin Cash block
#' @author Vasile Adrian Bogdan Pop
#' @examples
#' block_byHeight(height)
#' block_byHeight("block height here")
block_byHeight <- function(height){
  base <- "https://blockdozer.com/insight-api/"
  endpoint <- "block-index/"

  call <- paste(base,endpoint,height,sep = "")
  get_blockHash <- GET(call)
  get_blockHash_text <- content(get_blockHash, "text")

  get_blockHash_json <- fromJSON(get_blockHash_text, flatten = TRUE)

  get_blockHash_df <- as.data.frame(get_blockHash_json)

  block_df <- block_byHash(get_blockHash_df$blockHash)
  return(block_df)
}
