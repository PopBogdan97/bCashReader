#' Retrieve the information contained in a block by his hash.
#'
#' @param string input hash of a Bitcoin Cash block
#' @return data frame with the information of a specific block.
#' @export
#' @description Get the information of a specific Bitcoin Cash block (without the transactions)
#' @author Vasile Adrian Bogdan Pop
#' @examples
#' block_byHash(hash)
#' block_byHash("block hash here")
block_byHash <- function(hash){
  base <- "https://blockdozer.com/insight-api/"
  endpoint <- "block/"
  txs <- "1"

  call <- paste(base,endpoint,hash,"/?noTxList=",txs, sep = "")
  get_block <- GET(call)
  get_block_text <- content(get_block, "text")

  get_block_json <- fromJSON(get_block_text, flatten = TRUE)
  get_block_json$poolInfo <- NULL
  get_block_json$tx <- NULL

  get_block_df <- as.data.frame(get_block_json)


  base2 <- "https://api.blockchair.com/bitcoin-cash/"
  endpoint2 <- "dashboards/block/"


  call2 <- paste(base2,endpoint2,hash, sep = "")
  get_block2 <- GET(call2)
  get_block2_text <- content(get_block2, "text")

  get_block2_json <- fromJSON(get_block2_text, flatten = TRUE)
  get_block2_json$context<-NULL
  get_block2_json$data[[1]]$transactions <- NULL

  get_block2_df <- as.data.frame(get_block2_json)
  colnames(get_block2_df) <- c("height","hash","date","time","median_time","size","version","version_hex","version_bits","merkle_root","nonce","bits","difficulty","chainwork","coinbase_data_hex","transaction_count","input_count","output_count","input_total","input_total_usd","output_total","output_total_usd","fee_total","fee_total_usd","fee_per_kb","fee_per_kb_usd","cdd_total","generation","generation_usd","reward","reward_usd","guessed_miner")

  get_block_df$hash<- NULL
  get_block_df$size <- NULL
  get_block_df$height <- NULL
  get_block_df$version <- NULL
  get_block_df$merkleroot <- NULL
  get_block_df$time <- NULL
  get_block_df$nonce <- NULL
  get_block_df$bits <- NULL
  get_block_df$difficulty <- NULL
  get_block_df$chainwork <- NULL
  get_block_df$reward <- NULL
  get_block_df$poolName <- NULL

  get_blockMerge_df <- merge(get_block_df,get_block2_df, by = NULL)
  return(get_blockMerge_df)
}
