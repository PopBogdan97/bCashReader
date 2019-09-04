#' Retrieve the Bitcoin Cash blockchain stats
#'
#' @param
#' @return data frame with the Bitcoin Cash blockchain stats
#' @export
#' @description Get the Bitcoin Cash current blockchain stats. To see the description of the values retrieved visit: "https://github.com/Blockchair/Blockchair.Support/blob/master/API_DOCUMENTATION_EN.md#link_chainstats" in Dashboard/stats
#' @author Vasile Adrian Bogdan Pop
#' @examples
#' chain_stats()
chain_stats <- function(){
  base <- "https://api.blockchair.com/bitcoin-cash/"
  endpoint <- "stats"


  call <- paste(base,endpoint, sep = "")
  get_stats <- GET(call)
  get_stats_text <- content(get_stats, "text")

  get_stats_json <- fromJSON(get_stats_text, flatten = TRUE)
  get_stats_json$context<-NULL
  get_stats_json$data$countdowns$event<-NULL

  get_stats_df <- as.data.frame(get_stats_json)
  colnames(get_stats_df) <- c("blocks","transactions","outputs","circulation","blocks_24h","transactions_24h","difficulty","volume_24h","mempool_transactions","mempool_size","mempool_tps","mempool_total_fee_usd","best_block_height","best_block_hash","best_block_time","blockchain_size","average_transaction_fee_24h","inflation_24h","median_transaction_fee_24h","cdd_24h","largest_transaction_24h_hash","largest_transaction_24h_value_usd","nodes","hashrate_24h","inflation_usd_24h","average_transaction_fee_usd_24h","median_transaction_fee_usd_24h","market_price_usd","market_price_btc","market_price_usd_change_24h_percentage","market_cap_usd","market_dominance_percentage","time_left_to_reward_halving","suggested_transaction_fee_per_byte_sat")
  return(get_stats_df)
}
