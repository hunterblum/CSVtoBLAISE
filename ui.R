library(shiny)
library(shinythemes)

ui <- fillPage(
  
  theme = shinytheme('darkly'),
                navbarPage(
                  "NASS File Converter",
                  id = "navbar",
                  tabPanel(
                    "Home",
                      mainPanel(
                        p("Welcome to the NASS File Converter!"),
                        p("Currently the app only coverts CSV to Blaise files, however we hope to add functionality in the future."),
                        p("Please contact Hunter Blum (hunter.blum@usda.gov) with any errors or suggestions for improvement.")
                    )
                  ),
                  tabPanel(
                    "CSV to Blaise",
                    sidebarLayout(
                      sidebarPanel(
                        downloadButton("download-template", label = "Download Template"),
                        fileInput("uploaded-template", label = "Upload your template below", accept = c(".csv")),
                        downloadButton("download_final", label = "Download Blaise File")
                      ),
                      mainPanel(
                        p(strong("Instructions"), style = "font-size:30px;"),
                        p("1. Download the template to the left", style = "font-size:18px;"),
                        p("2. Enter the data for respondents. Dates must be in month, day, year format (1/1/2000). New item code variables must begin with IC.", style = "font-size:18px;"),
                        p("3. Upload your filled-in template by clicking the Browse button to the left. Wait until the app states the upload is completed", style = "font-size:18px;"),
                        p("4. Download your file with the Download Blaise File button to the left", style = "font-size:18px;")
                      )
                    )
                  ),
                  tabPanel(
                    "Blaise to CSV",
                    sidebarLayout(
                      sidebarPanel(
                        # Add UI elements specific to Blaise to CSV conversion if needed
                      ),
                      mainPanel(
                        p("Coming Soon...")
                      )
                    )
                  )
                )
)


