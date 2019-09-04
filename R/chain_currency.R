#' Retrieve the Bitcoin Cash current value.
#'
#' @param
#' @return data frame with the Bitcoin Cash current value.
#' @export
#' @description Get the Bitcoin Cash current value.
#' @author Vasile Adrian Bogdan Pop
#' @examples
#' chain_currency()
chain_currency <- function(){
  base <- "https://blockdozer.com/insight-api/"
  endpoint <- "currency"


  call <- paste(base,endpoint, sep = "")
  get_currency <- GET(call)
  get_currency_text <- content(get_currency, "text")

  get_currency_json <- fromJSON(get_currency_text, flatten = TRUE)

  get_currency_df <- as.data.frame(get_currency_json$data)
  colnames(get_currency_df) <- c("currency")
  return(get_currency_df)
}
