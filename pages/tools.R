library(shiny)
library(argonR)
library(htmltools)

source("C:/Users/AYOMIDE/Documents/R/agron_portfolio/utl.R")

tool_page <- argon_page(
  title = "tools",
  author =  "Akinwande Ayomide",
  favicon = "dib_fav.png",
  
  # Page navigation bar ========================================================
  navbar = port_nav(),
  
  
  # Main-body ==================================================================
  
  argonSection(
    size = "xl",
    status = "Gray 200", 
    gradient = FALSE,
    separator = FALSE,
    shape = FALSE,
    cascade = TRUE,
    
    
    argonRow(
      center = TRUE,
      
      tool_box("R_b_logo.png", c("Tidyverse", "shiny", "Quarto", "Tidymodels")),
      tool_box("python_b_logo.png", c("Pandas", "Plotly", "Dash", "Scikit-learn"))
    ),
    
    argonRow(
      center = TRUE,
      
      tool_box("mysql_b_logo.png", c("Data Modelling", "Data Exploration")),
      tool_box("ms_excel_b_logo.png", c("Pivot Tables", 
                                        "Visualization", 
                                        "Data Analysis"))
    ),
    
    argonRow(
      center = TRUE,
      
      tool_box("ms_power_bi_b_logo.png", c("Data Modelling", 
                                           "Power Query", 
                                           "Dashboard")),
      tool_box("html_b_logo.webp")
    )
  ),
  
  footer = portfolio_footer()
)

argonPageTemplate(filename = "tools", 
                  path = "C:/Users/AYOMIDE/Documents/R/agron_portfolio/pages", 
                  tool_page)
