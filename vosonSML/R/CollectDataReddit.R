#' Collect reddit thread data
#'
#' Uses RedditExtractoR::reddit_content to collect user and comment data for thread urls.
#' 
#' @param threadUrls character string vector. Reddit thread url's to collect data from.
#' @param waitTime numeric integer. Time in seconds to wait in-between url collection requests.
#' @param writeToFile logical. If the data should be written to file. 
#' 
#' @note The reddit API endpoint used for thread collection has maximum limit of 500 comments per thread url.
#' 
#' @return A data frame object of class dataSource.reddit that can be used for creating unimodal 
#' networks (CreateActorNetwork).
#' 
CollectDataReddit <- function(threadUrls, waitTime = 5, writeToFile = FALSE) {
  
  if (missing(threadUrls) || !is.vector(threadUrls) || length(threadUrls) < 1) {
    stop("Please provide a vector of one or more reddit thread urls.\n", call. = FALSE)
  }

  cat("Collecting thread data for reddit urls...\n")
  
  # make the get request for the reddit thread url
  threads_df <- RedditExtractoR::reddit_content(threadUrls, waitTime)
  
  # add thread id to df, extracted from url
  threads_df$thread_id <- gsub("^(.*)?/comments/([0-9A-Za-z]{6})?/.*?(/)?$", "\\2", 
                               threads_df$URL, ignore.case = TRUE, perl = TRUE)
  
  if (writeToFile) { writeOutputFile(threads_df, "csv", "RedditData") }
  
  class(threads_df) <- append(class(threads_df), c("dataSource", "reddit"))
  
  cat("Done.\n")
  flush.console()
  
  return(threads_df)
}