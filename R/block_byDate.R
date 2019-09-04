#' Retrieve the blocks in a specific Date.
#'
#' @param string input Date
#' @return data frame with the blocks of a Date.
#' @export
#' @description Get all the blocks in a specific Date with the format yyyy-MM-dd
#' @author Vasile Adrian Bogdan Pop
#' @examples
#' block_byDate("yyyy-MM-dd")
#' block_byDate(date)
block_byDate <- function(date){
  base <- "https://blockdozer.com/insight-api/"
  endpoint <- "blocks/"

  call <- paste(base,endpoint,"?blockDate=",date, sep = "")
  get_blocks <- GET(call)
  get_blocks_text <- content(get_blocks, "text")

  get_blocks_json <- fromJSON(get_blocks_text, flatten = TRUE)
  get_blocks_json$pagination <- NULL
  get_blocks_json$length <- NULL
  get_blocks_json$blocks$poolInfo.url <- NULL

  get_blocks_df <- as.data.frame(get_blocks_json)
  colnames(get_blocks_df) <- c("height","size","hash","time","txCount","poolName")
  return(get_blocks_df)
}
