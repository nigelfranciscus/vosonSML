require(devtools)


install_github("nigelfranciscus/vosonSML", subdir = "vosonSML")

require(vosonSML)
require(magrittr)

# whatever name you assigned to your created app
appname <- "SocialMediaLab 2018"

my_api_key <- "KVHm0hVfdAAljSF65IAtRODg3"
my_api_secret <- "a6z49Hbba1OGJOKP2b5nlGFFmxj2QR80lGjgYr6MrnMfnWyres"
my_access_token <- "352257626-uCsSZSETKDAeei2bBDwnXS72k5mktPDJpIJ69He1" 
my_access_token_secret <- "2jMAPpZtqfWATl6kprW1fsRlYYFKF5ijCBRlke88Fxj1e"

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

# writeToFile is passing