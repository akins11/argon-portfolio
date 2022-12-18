library(shiny)
library(argonR)
library(htmltools)

source("C:/Users/AYOMIDE/Documents/R/agron_portfolio/utl.R")

text_color <- "#32325D"

main_project_page <- argon_page(
  title = "projects",
  author =  "Akinwande Ayomide",
  favicon = "dib_fav.png",
  
  # Page navigation bar ========================================================
  navbar = port_nav(),
  
  # Main-body ==================================================================
  argonContainer(
    br(), br(),
    
    argonH1(
      display = 3, 
      "Projects"
    ) |> 
      argonTextColor(color = text_color) |>
      argonPadding("y", 5),
    
    argonRow(
      argonTabSet(
        id = "tab_set",
        width = 12,
        iconList = list(
          fa_icon(name = "box", FALSE),
          fa_icon(name = "file-waveform", FALSE),
          fa_icon(name = "robot", FALSE),
          fa_icon(name = "magnifying-glass-chart", FALSE)
        ),
        
        argonTab( # ---------------------------------------------| Analytics App
          tabName = "Analytics App",
          active = TRUE,
          
          argonRow( 
            project_container(
              name = "Market Segmentation Analysis App",
              link = "https://akinwandeayomide.shinyapps.io/segmentationAnalysisApp/",
              img_src = "seg_analysis.png",
              description = "Performs market segmentation analysis using selected cluster 
                             algorithms, summarise each cluster and also create segments 
                             using different approaches.",
              framework = c("R", "Shiny"),
              icon = "circle-nodes", 
              github_src = "https://github.com/akins11/Segmentation-analysis-app"
            ),
            
            project_container(
              name = "Market Basket Analysis App",
              link = "https://market-basket-analysis.onrender.com/",
              img_src = "mba_mba.png",
              description = "Performs market basket analysis using the apriori 
                             algorithm which generate association rules that identify 
                             the most important relationships for the most frequently 
                             purchased items.",
              framework = c("Python", "Dash"),
              icon = "circle-nodes",
              github_src = "https://github.com/akins11/market-basket-analysis-web-app"
            ),
            
            project_container(
              name = "RFM Analysis App",
              link = "https://akinwandeayomide.shinyapps.io/RFM-app/",
              img_src = "rfm_seg.png",
              description = "Performs behavior based customer segmentation using 
                             of RFM analysis, which help in distinguishing 
                             customers.",
              framework = c("R", "Shiny"),
              icon = "circle-nodes",
              github_src = "https://github.com/akins11/RFM-analysis-app"
            )
          ) 
        ),
        
        argonTab( # -----------------------------------------------| Dashboard
          tabName = "Dashboards",
          active = FALSE,
          
          argonRow(
            project_container(
              name = "Hotel Management Dashboard",
              link = "https://akins11.github.io/Hotel-management-dashboard/",
              img_src = "rev_mgt.png",
              description = "Breaks down of revenue, reservations and guests treatment 
                           to generate key insights for making informed decisions.",
              framework = c("R", "Flexdashboard"),
              icon = "file-contract",
              github_src = "https://github.com/akins11/Hotel-management-dashboard"
            ),
            
            project_container(
              name = "Product Analysis Dashboard",
              link = "https://akinwandeayomide.shinyapps.io/productDashboard/",
              img_src = "product_db.png",
              description = "A detailed Report on the profitability of various 
                             products, showcasing insights and performance across
                             specific period.",
              framework = c("R", "Shiny"),
              icon = "file-contract",
              github_src = "https://github.com/akins11/Product-Dashboard"
            ),
            
            project_container(
              name = "Sales Dashboard",
              link = "https://akinwandeayomide.shinyapps.io/regionalSalesDashboard/",
              img_src = "region_sales_lp.png",
              description = "A visual summary of sales performance across 
                             different regions within a specific period of time.",
              framework = c("R", "Shiny"),
              icon = "file-contract",
              github_src = "https://github.com/akins11/Regional-Sales-Dashboard"
            ),
            
            project_container(
              name = "Sales Report",
              link = "https://github.com/akins11/Sales-Report",
              img_src = "dashboard_pb.png",
              description = "A concise and insightful report of sales across various 
                             regions and periods.",
              framework = c("Power BI"),
              icon = "file-contract",
              github_src = "https://github.com/akins11/Sales-Report"
            )
          )
        ),
        
        argonTab( # ------------------------------------------| Machine Learning
          tabName = "ML",
          active = FALSE,
          
          argonRow(
            project_container(
              name = "PM2.5 Sensor Offset Prediction",
              link = "https://akins11.github.io/PM2.5-Sensor-Offset-Prediction/",
              img_src = "pm25_chart.png",
              description = "Predictions of particle matter (PM2.5) sensor offsets 
                             signals using a supervised classification algorithm.",
              framework = c("Python", "Scikit-Learn"),
              icon = "robot",
              github_src = "https://github.com/akins11/PM2.5-Sensor-Offset-Prediction"
            ),
            
            project_container(
              name = "Web Store Sales Prediction",
              link = "https://akins11.github.io/web-sales-prediction/",
              img_src = "sales_web.png",
              description = "Prediction of potential sales of various collection 
                             of high quality clothing brands using supervised 
                             regression model.",
              framework = c("R", "Tidymodels"),
              icon = "robot",
              github_src = "https://github.com/akins11/web-sales-prediction"
            )
          )
        ),
        
        argonTab( # ---------------------------------| Exploratory Data Analysis
          tabName = "EDA",
          active = FALSE,
          
          argonRow(
            project_container(
              name = "Hospitality Guest Review",
              link = "https://akins11.github.io/hospitality-guest-review/",
              img_src = "guest_review.png",
              description = "Sentiment analysis on guests review of their 
                             respective host accommodation.",
              framework = c("Python", "NLTK"),
              icon = "chart-area",
              github_src = "https://github.com/akins11/hospitality-guest-review"
            ),
            
            project_container(
              name = "Regional Sales Exploratory Analysis",
              link = "https://akins11.github.io/Exploratory-analysis-using-SQL/",
              img_src = "sales_EDA.png",
              description = "Exploring business sales performance within a selected 
                             period of time.",
              framework = c("MySQL", "Quarto"),
              icon = "chart-area",
              github_src = "https://github.com/akins11/Exploratory-analysis-using-SQL"
            )
          )
        )
      )
    )
  ),
  
  footer = portfolio_footer()
)



argonPageTemplate(filename = "projects", 
                  path = "C:/Users/AYOMIDE/Documents/R/agron_portfolio/pages", 
                  main_project_page)
