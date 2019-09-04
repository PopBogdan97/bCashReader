#' Retrieve the raw informations contained in a block by his hash.
#'
#' @param string input hash of a Bitcoin Cash block
#' @return data frame with the raw information of a specific block.
#' @export
#' @description Get the raw information of a specific Bitcoin Cash block
#' @author Vasile Adrian Bogdan Pop
#' @examples
#' block_byHashRaw(hash)
#' block_byHashRaw("block hash here")
block_byHashRaw <- function(hash){
  base <- "https://blockdozer.com/insight-api/"
  endpoint <- "rawblock/"


  call <- paste(base,endpoint,hash, sep = "")
  get_block <- GET(call)
  get_block_text <- content(get_block, "text")

  get_block_json <- fromJSON(get_block_text, flatten = TRUE)

  get_block_df <- as.data.frame(get_block_json)
  return(get_block_df)
}
