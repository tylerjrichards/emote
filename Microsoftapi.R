
library("httr")
library("XML")
library("stringr")
library("ggplot2")
library("plumber")

img.url = ''
img.url     = 'http://static6.businessinsider.com/image/55918b77ecad04a3465a0a63/nbc-fires-donald-trump-after-he-calls-mexicans-rapists-and-drug-runners.jpg'
#* @get /ping
ping <- function() {
  print("PING!")
}

#* @get /emote
emote <- function(url){
  print("hello")
  img.url = url
  
  #http://www.thedailyrash.com/wp-content/uploads/2013/07/obama-sad-looking-down-500x281.jpg
  #https://www.whitehouse.gov/sites/whitehouse.gov/files/images/first-family/44_barack_obama[1].jpg
  #http://thepeak.tv/wp-content/uploads/2015/11/2013-03-03T151338Z_2_CBRE9210K7L00_RTROPTP_4_USA-FISCAL-OBAMA-SHUTDOWN.jpg
  # Define Microsoft API URL to request data
  URL.emoface = 'https://api.projectoxford.ai/emotion/v1.0/recognize'
  
  # Define access key (access key is available via: https://www.microsoft.com/cognitive-services/en-us/emotion-api)
  emotionKEY = 'ec9d95c4653141658eb8a4b6ed9c40ae'
  
  # Define image
  mybody = list(url = img.url)
  
  # Request data from Microsoft
  faceEMO = POST(
    url = URL.emoface,
    content_type('application/json'), add_headers(.headers = c('Ocp-Apim-Subscription-Key' = emotionKEY)),
    body = mybody,
    encode = 'json'
  )
  
  # Show request results (if Status=200, request is okay)
  faceEMO
  
  # Reuqest results from face analysis
  Obama = httr::content(faceEMO)[[1]]
  Obama
  
  print(Obama$scores)
  x <- Obama$scores
  x <- max(Obama$scores$anger, Obama$scores$contempt, Obama$scores$disgust, Obama$scores$fear, Obama$scores$happiness, Obama$scores$sadness)
  
  library(mailR)
  sender <- "emoteuf@gmail.com"
  recipients <- c("emoteuf@gmail.com", "4076836172@tmomail.net", "5618664321@txt.att.net")
  
  if(Obama$scores$anger == x) {
    send.mail(from = sender,
              to = recipients,
              subject = "Anger",
              body = " ",
              smtp = list(host.name = "smtp.gmail.com", port = 465, 
                          user.name = "emoteuf@gmail.com",            
                          passwd = "ldtchs1850", ssl = TRUE),
              authenticate = TRUE,
              send = TRUE)
  }
  if(Obama$scores$happiness == x) {
    send.mail(from = sender,
              to = recipients,
              subject = "Happiness",
              body = " ",
              smtp = list(host.name = "smtp.gmail.com", port = 465, 
                          user.name = "emoteuf@gmail.com",            
                          passwd = "ldtchs1850", ssl = TRUE),
              authenticate = TRUE,
              send = TRUE)
  }
  if(Obama$scores$contempt == x) {
    send.mail(from = sender,
              to = recipients,
              subject = "Contempt",
              body = " ",
              smtp = list(host.name = "smtp.gmail.com", port = 465, 
                          user.name = "tylerjrichards@gmail.com",            
                          passwd = "ldtchs1850", ssl = TRUE),
              authenticate = TRUE,
              send = TRUE)
  }
  if(Obama$scores$disgust == x) {
    send.mail(from = sender,
              to = recipients,
              subject = "Disgust",
              body = " ",
              smtp = list(host.name = "smtp.gmail.com", port = 465, 
                          user.name = "tylerjrichards@gmail.com",            
                          passwd = "ldtchs1850", ssl = TRUE),
              authenticate = TRUE,
              send = TRUE)
  }
  if(Obama$scores$fear == x) {
    send.mail(from = sender,
              to = recipients,
              subject = "Fear",
              body = " ",
              smtp = list(host.name = "smtp.gmail.com", port = 465, 
                          user.name = "tylerjrichards@gmail.com",            
                          passwd = "ldtchs1850", ssl = TRUE),
              authenticate = TRUE,
              send = TRUE)
  }
  if(Obama$scores$sadness == x) {
    send.mail(from = sender,
              to = recipients,
              subject = "Sadness",
              body = " ",
              smtp = list(host.name = "smtp.gmail.com", port = 465, 
                          user.name = "tylerjrichards@gmail.com",            
                          passwd = "ldtchs1850", ssl = TRUE),
              authenticate = TRUE,
              send = TRUE)
  }
  
  
}






