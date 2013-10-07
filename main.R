source("yacht-pricing-functions.R")

webpage<-Get_page(keyword="elan")
table_dene<-Read_table(webpage)
elan<-table_dene