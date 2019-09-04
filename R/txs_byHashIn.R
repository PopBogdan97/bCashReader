#' Retrieve the information about a specific Bitcoin Cash transaction inputs
#'
#' @param string hast of the transaction inputs
#' @return data frame with the information of a specific transaction inputs
#' @export
#' @description Get the all the information of a specific transaction inputs. To see the description of the values retrieved visit: "https://github.com/Blockchair/Blockchair.Support/blob/master/API_DOCUMENTATION_EN.md#link_chainstats" in Dashboard/transaction
#' @author Vasile Adrian Bogdan Pop
#' @examples
#' txs_byHashIn()
txs_byHashIn <- function(hash){
  base <- "https://api.blockchair.com/bitcoin-cash/"
  endpoint <- "dashboards/transaction/"


  call <- paste(base, endpoint, hash, sep = "")
  get_transaction <- GET(call)
  get_transaction_text <- content(get_transaction, "text")

  get_transaction_json <- fromJSON(get_transaction_text, flatten = TRUE)
  get_transaction_json$context<-NULL

  get_transaction_df <- as.data.frame(get_transaction_json$data[[1]]$inputs)
  return(get_transaction_df)
}
