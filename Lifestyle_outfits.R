library(robotstxt)
library(rvest)
url <- "https://www.lifestylestores.com/in/en/search?gclid=CjwKCAiAhKycBhAQEiwAgf19epqHByXjcTigRYMKndD1sH38ReF-4pWRmnB8v0SmJdzYc_NscmSZ8xoCUpwQAvD_BwE"
path = paths_allowed(url)
#html from website
web = read_html(url)
View(web)
product_name <- web %>% html_nodes(".jss546")%>% html_text()
View(product_name)
product_price <- web %>%html_nodes(".jss574") %>% html_text()
View(product_price)
New_Collection <- web%>%html_nodes(".green") %>% html_text()
length(New_Collection)<-length(product_name)
View(New_Collection)
Discount <- web %>% html_nodes(".jss567") %>% html_text()
View(Discount)


#creating dataframe
Lifestyle_outfits <- data.frame(product_name,product_price,New_Collection,Discount)
View(Lifestyle_outfits)
#save
write.csv(Lifestyle_outfits,"Lifestyle_outfits.csv")