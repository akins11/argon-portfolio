library(shiny)
library(argonR)
library(htmltools)
library(fontawesome)

source("C:/Users/AYOMIDE/Documents/R/agron_portfolio/utl.R")


index_page <- argon_page(
  
  title = "home",
  author =  "Akinwande Ayomide",
  description = "Project ShowCase",
  favicon = "dib_fav.png",
   
  # Page navigation bar ========================================================
  navbar = port_nav(),
   
   
  # Main-body ==================================================================
  argonSection(
      size = "xl",
      status = "Gray 200",
      gradient = TRUE,
      separator = FALSE,
      # separator_color = "white",
      shape = FALSE,
      cascade = TRUE,
      
      argonColumn(
          
        argonRow(
          
          argonColumn(
            width = 6,
            
            argonH1(
              display = 3, 
              "Hi!, I’m Ayomide Akinwande"
              )|> argonTextColor(color = text_color), 
            
          
            argonLead(
                "A strategic data analyst with a desire for developing effective 
                data project from design through to implementation that unravel 
                business problems and improve business efficiency by delivering 
                actionable insights using several analytical tools."
              ) |> argonTextColor(color = text_color),
            
            argonLead(
               "Skilled in developing and enhancement of the existing 
               processes through various data tasks such as data cleaning, 
               exploratory data analysis, data visualization, data mining 
               and building machine learning models."
              ) |> argonTextColor(color = text_color)
        ),
      
        argonColumn(
          width = 6,
          
            argonImage(
                src = "inst/images/dib_logo_img.svg",
                floating = FALSE
              ) |>
              argonBlur()
          
          )
        ),
      
      argonRow(
        center = TRUE,
        
        link_button()
      ) |>
        argonPadding(orientation = "t", value = 4)
      
    ) |> 
      argonPadding(orientation = "x", value = 0)
  )
)

argonPageTemplate(filename = "index", 
                  path = "C:/Users/AYOMIDE/Documents/R/agron_portfolio/pages", 
                  index_page)
