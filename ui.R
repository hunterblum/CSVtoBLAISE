library(shinyjs)
library(shinycustomloader)
ui <- fluidPage(
  titlePanel(strong("Blaise Hold File Creator")),
  sidebarLayout(
    sidebarPanel(
      
      # Download Template
      downloadButton("dowload-template",
                     label = "Download Template"),
      
      # Upload Template
      fileInput("uploaded-template",
                label = "Upload your template",
                accept = c(".csv")),
      
      
      #Download Blaise File
      downloadButton("download_final",
                     label = "Download Blaise File")
    ),
    mainPanel(
      #Intsrutctions
      p(strong("Instructions"), style = "font-size:30px;"),
      p("1. Download the template to the left", style = "font-size:18px;"),
      p("2. Enter the data for respondents.", strong("Dates must be in month, day, year format (1/1/2000). New item code variables must begin with IC."), style = "font-size:18px;"),
      p("3. Upload your filled in template by clicking the Browse button to the left. Wait until the app states the upload is completed", style = "font-size:18px;"),
      p("4. Download your file with the Download Blaise File button to the left", style = "font-size:18px;"),
      p("For any questions or errors, contact hunter.blum@usda.gov")
      
                   
      
      
    )
  )
)
