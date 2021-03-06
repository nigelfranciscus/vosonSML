% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/CollectDataYoutube.R
\name{CollectDataYoutube}
\alias{CollectDataYoutube}
\title{Collect YouTube comments data for generating different types of networks}
\usage{
CollectDataYoutube(apiKey, videoIDs, verbose = FALSE,
  writeToFile = FALSE, maxComments = 1e+13)
}
\arguments{
\item{apiKey}{character string, specifying the Google Developer API Key used for authentication.}

\item{videoIDs}{character vector, specifying one or more YouTube video IDs. For example, if the video URL is 
'https://www.youtube.com/watch?v=W2GZFeYGU3s', then use videoIDs='W2GZFeYGU3s'. For multiple videos, the 
function GetYoutubeVideoIDs can be used to create a vector object suitable as input for videoIDs.}

\item{verbose}{logical. If TRUE then this function will output runtime information to the console as it 
computes. Useful diagnostic tool for long computations. Default is FALSE.}

\item{writeToFile}{logical. If TRUE then the data is saved to file in current working directory (CSV format), 
with filename denoting current system time. Default is FALSE.}

\item{maxComments}{numeric integer, specifying how many 'top-level' comments to collect from each video. This value 
*does not* take into account 'reply' comments (i.e. replies to top-level comments), therefore the total number of
comments collected may be higher than maxComments. By default this function attempts to collect all comments.}
}
\value{
A dataframe object of class dataSource.youtube that can be used for creating unimodal networks 
(CreateActorNetwork).
}
\description{
This function collects YouTube comments data for one or more YouTube videos. It structures the data into a data 
frame of class dataSource.youtube, ready for creating networks for further analysis.
}
\details{
CollectDataYoutube collects public comments from YouTube videos, using the YouTube API.

The function then finds and maps the relationships of YouTube users who have interacted with each other 
(i.e. user i has replied to user j or mentioned user j in a comment) and structures these relationships into a data 
frame format suitable for creating unimodal networks (CreateActorNetwork).

For multiple videos, the user may wish to use the function GetYoutubeVideoIDs, which creates a character
vector of video IDs from a plain text file of YouTube video URLs, which can then be used for the videoIDs
argument of the function CollectDataYoutube.
}
\note{
Currently supported network types: unimodal 'actor' network; CreateActorNetwork.

Data generated using this function is *not* suitable for dynamic networks.
Dynamic YouTube comments networks are not currently implemented in the vosonSML package. This will be implemented in 
a future release.

Note on maxComments argument: Due to quirks/specifications of the Google API, it is currently not possible to 
specify the exact number of comments to return from the API using maxResults argument (i.e.including comments 
that are replies to top-level comments). Therefore, the number of comments collected is usually somewhat greater than
maxComments, if a value is specified for this argument. For example, if a video contains 10 top-level 
comments, and one of these top-level comments has 5 'child' or reply comments, then the total number of comments
collected will be equal to 15. Currently, the user must 'guesstimate' the maxResults value, to collect a 
number of comments in the order of what they require.
}
