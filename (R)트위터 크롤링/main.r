library(tm)
library(twitteR)
library(base64enc)
library(KoNLP)

library(NIADic)
library(RmecabKo)
library(rtweet)
library(tidyverse)
library(igraph)

install.packages(c("base64enc", "KoNLP", "NIADic", "RmecabKo", "rtweet", "tidyverse", "igraph"))


useNIADic()


api_key <- "RM3GYv6EsWW7kYKUWUSzPqUHL"
api_secret_key <- "5rLXiX5p3NkJoy6phjRjueiL2fKpbtyWNuOcNuK74R1IwPuf6g"
access_token <- "1432465183734001666-jAX5BvhNKOfPuwjTrVMgo6yRV3QlmK"
access_token_secret <- "MohR7UWGStzYjxoij7BcPaOJtVK7epE7SuKBAMafCU8Ul"
options(httr_oauth_cache = TRUE)
setup_twitter_oauth(api_key,api_secret_key,access_token,access_token_secret)

keyword <- enc2utf8("프리코네")
bangdream <- searchTwitter(keyword, n=1000, lang="ko", since="2018-12-31", until="2022-06-12")

bangdream_df <- twListToDF(bangdream)

write.csv(bangdream_df,"/Users/mastic/Desktop/3grade-hark/pr.csv", row.names = FALSE)

print(bangdream_df)


bangdream_word <-sapply(bangdream,function(t) t$getText())
bangdream_words <- bangdream_word %>% SimplePos09() 
