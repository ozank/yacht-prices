library(XML)
library(RCurl)

Get_page<-function(keyword='bavaria', type='(Sail)',
                           min_length=30, max_length=50,
                           min_year=1980, max_year=2014,
                           min_price=10000, max_price=5000005){

web_address<-paste('http://www.yachtworld.co.uk/core/listing/cache/searchResults.jsp?&searchtype=homepage&Ntk=boatsUK&hmid=0&sm=3&enid=0',
                     '&man=',keyword,
                     '&type=',type,
                     '&luom=126&fromLength=',min_length,'&toLength=',max_length,
                     '&fromYear=',min_year,'&toYear=',max_year,
                     '&fromPrice=',min_price,'&toPrice=',max_price,'&currencyid=1004',
                     '&cit=true&ftid=0&slim=quick&ps=8000','&resultsLayout=0',sep="") #ps=:maximum results per page

webpage<-getURL(web_address)
#webpage<-web_address
}

Read_table<-function(webpage){
  
  table<-readHTMLTable(webpage, which=3)[4:9] #we want the third table in the website
                                              #4:9 the relevant columns
  table<-as.data.frame(sapply(table, function(x) gsub("\\s+", "", x))) #get rid of spaces
  table<-na.omit(table)
  colnames(table)<-c("length","model","year","price","notes","place")
  
  table$length<-as.numeric(gsub('[[:space:]]|[[:punct:]]','',table$length)) #get rid of feet symbol(')
  table$year<-as.numeric(gsub('[[:space:]]|[[:punct:]]','',table$year)) #convert numeric
  table$price<-suppressWarnings(as.numeric(gsub('[[:space:]]|[[:punct:]]','',table$price), na.rm=TRUE)) #convert numeric
  table<-na.omit(table)
  
  return(table)
}