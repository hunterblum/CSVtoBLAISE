#libraries
library(tidyverse)
library(lubridate)

function(input, output, session) {
  
#Download Template
  
  output$`dowload-template` <- downloadHandler(filename = "HoldTemplate.csv",
                                               content = function(file){
                                                 file.copy("Template.csv", file)
                                               })
  
#Upload Template
  
  uploaded_template <- eventReactive(c(input$`uploaded-template`),
                                     {
                                      template <- read.csv(input$`uploaded-template`$datapath, fileEncoding = "UTF-8-BOM")
                                      
                                      template
                                     })
  

  
  #Variable Editing - Add Loading Time
  
  Strings_Final <- reactive({
    
  isolate({Blaise_Strings <- uploaded_template()
  
  Blaise_Strings$state_fips <- ifelse(Blaise_Strings$state_fips<10, paste0("0", as.character(Blaise_Strings$state_fips)), paste0(as.character(Blaise_Strings$state_fips)))
  
  Blaise_Strings$date <- as.character(Blaise_Strings$date)
  Blaise_Strings$date <- mdy(Blaise_Strings$date)
  Blaise_Strings$year <- as.character(year(Blaise_Strings$date))
  Blaise_Strings$month <- as.character(month(Blaise_Strings$date))
  Blaise_Strings$day <- as.character(month(Blaise_Strings$date))
  Blaise_Strings <- Blaise_Strings %>% select(year, month, day, everything())
  
  

  Blaise_Strings$tract <- ifelse(Blaise_Strings$tract<10, paste0("0", as.character(Blaise_Strings$tract)), paste0(as.character(Blaise_Strings$tract)))
  
  Blaise_Strings$subtract <- ifelse(Blaise_Strings$subtract<10, paste0("0", as.character(Blaise_Strings$subtract)), paste0(as.character(Blaise_Strings$subtract)))
  
  colnames(Blaise_Strings) <- sub("^IC", "", colnames(Blaise_Strings))
  
  Strings_Long <- Blaise_Strings %>% pivot_longer(cols = 10:ncol(Blaise_Strings), names_to = "IC", values_to = "value")
  
  
  
  Strings_Short <- paste0(as.character(Strings_Long$sample_id), "\\", 
                          as.character(Strings_Long$year), "\\",
                          as.character(Strings_Long$month), "\\",
                          as.character(Strings_Long$day), "\\","000", "\\",
                          as.character(Strings_Long$state_fips),
                          as.character(Strings_Long$poid), "\\",
                          as.character(Strings_Long$tract), "\\",
                          as.character(Strings_Long$subtract), "\\", "\\", "A\\1\\",
                          as.character(Strings_Long$IC), "\\",
                          as.character(Strings_Long$value), "\\", "\\")
  
  
  
})
  })

  
  #Create .txt file and download
  
  output$download_final <- downloadHandler(
    filename = function(){
      paste0(Sys.Date(), "_BlaiseHold.RAW")
    } , 
    content = function(file){
      
      Strings_Final() %>% 
        write.table(file, quote = F, row.names = F, col.names = F)
    }
    

    
    
  )
  
  
  
  
  

}