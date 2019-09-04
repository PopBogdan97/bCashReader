#' Retrieve the block count in a specific Date.
#'
#' @param string input Date
#' @return data frame with the block count of a Date.
#' @export
#' @description Get the block count in a specific Date with the format yyyy-MM-dd
#' @author Vasile Adrian Bogdan Pop
#' @examples
#' block_byDateCount("yyyy-MM-dd")
#' block_byDateCount(date)
block_byDateCount <- function(date){
  base <- "https://blockdozer.com/insight-api/"
  endpoint <- "blocks/"

  call <- paste(base,endpoint,"?blockDate=",date, sep = "")
  get_blocks <- GET(call)
  get_blocks_text <- content(get_blocks, "text")

  get_blocks_json <- fromJSON(get_blocks_text, flatten = TRUE)

  get_blockCount_df <- as.data.frame(get_blocks_json$length)
  colnames(get_blockCount_df) <- c("blockCount")
  return(get_blockCount_df)
}
