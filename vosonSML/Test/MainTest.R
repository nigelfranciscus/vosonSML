# Template for testing purposes

require(devtools)
install_github("nigelfranciscus/vosonSML", subdir = "vosonSML")

require(vosonSML)
require(magrittr)

# whatever name you assigned to your created app
appname <- ""

my_api_key <- ""
my_api_secret <- ""
my_access_token <- "" 
my_access_token_secret <- ""

myTwitterData <- Authenticate("twitter", 
                              appName = appname, 
                              apiKey=my_api_key,
                              apiSecret=my_api_secret,
                              accessToken=my_access_token,
                              accessTokenSecret=my_access_token_secret,
                              useCachedToken = F) %>%
  Collect(searchTerm="australia", language="en", numTweets=2000,
          writeToFile=TRUE,verbose=TRUE)

View(testTweet)
