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
