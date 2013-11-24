source("yacht-pricing-functions.R")

#Get all brands

webpage<-Get_page(keyword="bavaria")
table_dene<-Read_table(webpage)
bavaria<-table_dene
bavaria["make"]<-"bavaria"

webpage<-Get_page(keyword="beneteau")
table_dene<-Read_table(webpage)
beneteau<-table_dene
beneteau["make"]<-"beneteau"

webpage<-Get_page(keyword="dufour")
table_dene<-Read_table(webpage)
dufour<-table_dene
dufour["make"]<-"dufour"

webpage<-Get_page(keyword="elan")
table_dene<-Read_table(webpage)
elan<-table_dene
elan["make"]<-"elan"

webpage<-Get_page(keyword="hanse")
table_dene<-Read_table(webpage)
hanse<-table_dene
hanse["make"]<-"hanse"

webpage<-Get_page(keyword="jeanneau")
table_dene<-Read_table(webpage)
jeanneau<-table_dene
jeanneau["make"]<-"jeanneau"

#Combine all tables
yachts<-rbind(bavaria, beneteau, dufour, elan, hanse, jeanneau)