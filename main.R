source("yacht-pricing-functions.R")

#Get all brands

webpage<-Get_page(keyword="bavaria")
table_dene<-Read_table(webpage)
bavaria<-table_dene
bavaria["make"]<-"bavaria"
#remove excessive prices
bavaria<-subset(bavaria, price<4e5)

webpage<-Get_page(keyword="beneteau")
table_dene<-Read_table(webpage)
beneteau<-table_dene
beneteau["make"]<-"beneteau"
beneteau<-subset(beneteau, price<6e5)

webpage<-Get_page(keyword="dufour")
table_dene<-Read_table(webpage)
dufour<-table_dene
dufour["make"]<-"dufour"

webpage<-Get_page(keyword="elan")
table_dene<-Read_table(webpage)
elan<-table_dene
elan["make"]<-"elan"
elan<-subset(elan, price<4e5)

webpage<-Get_page(keyword="hanse")
table_dene<-Read_table(webpage)
hanse<-table_dene
hanse["make"]<-"hanse"
hanse<-subset(hanse, price<1e6)

webpage<-Get_page(keyword="jeanneau")
table_dene<-Read_table(webpage)
jeanneau<-table_dene
jeanneau["make"]<-"jeanneau"
jeanneau<-subset(jeanneau, price<1e6)
#Combine all tables
yachts<-rbind(bavaria, beneteau, dufour, elan, hanse, jeanneau)

#Save data image
save.image("./datasets.RData")
