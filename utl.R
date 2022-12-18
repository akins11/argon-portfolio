text_color <- "#32325D"


argon_page <- function(..., title = NULL, description = NULL, author = NULL, 
                       navbar = NULL, footer = NULL, favicon = NULL,
                       analytics = NULL){
  
  htmltools::tags$html(
    # head: need to use takeHeads from htmltools to extract all head elements
    argonR:::takeHeads(
      htmltools::tags$head(
        htmltools::tags$meta(charset = "utf-8"),
        htmltools::tags$meta(
          name = "viewport",
          content = "width=device-width, initial-scale=1, shrink-to-fit=no"
        ),
        htmltools::tags$meta(name = "description", content = description),
        htmltools::tags$meta(name = "author", content = author),
        htmltools::tags$title(title),
        
        # web dependencies CSS
        if (!is.null(favicon)) {
          htmltools::tags$link(href = paste0("inst/images/", favicon), rel = "icon", type = "image/png")
        },
        htmltools::tags$link(href = "https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700", rel = "stylesheet"),
        htmltools::tags$link(href = "inst/assets/vendor/nucleo/css/nucleo.css", rel = "stylesheet"),
        htmltools::tags$link(href = "inst/assets/vendor/fontawesome/css/fontawesome.min.css", rel = "stylesheet"),
        htmltools::tags$link(href = "inst/assets/vendor/fontawesome/css/all.min.css", rel = "stylesheet"),
        htmltools::tags$link(type = "text/css", href = "inst/assets/css/argon.min.css", rel = "stylesheet"),
        htmltools::tags$link(type = "text/css", href = "inst/assets/css/style.css", rel = "stylesheet"),
        
        # add analytic scripts if any
        if (!is.null(analytics)) analytics
        
      )
    ),
    # Body
    htmltools::tags$body(
      htmltools::tags$header(class = "header-global", navbar),
      tags$main(...),
      footer,
      
      # Core -->
      htmltools::tags$script(src = "inst/assets/vendor/jquery/jquery.min.js"),
      htmltools::tags$script(src = "inst/assets/vendor/popper/popper.min.js"),
      htmltools::tags$script(src = "inst/assets/vendor/bootstrap/bootstrap.min.js"),
      htmltools::tags$script(src = "inst/assets/vendor/headroom/headroom.min.js"),
      # Optional JS -->
      htmltools::tags$script(src = "inst/assets/vendor/onscreen/onscreen.min.js"),
      #htmltools::includeScript(path = "./assets/vendor/nouislider/js/nouislider.min.js"),
      #htmltools::includeScript(path = "./assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"),
      
      # Argon JS -->
      htmltools::tags$script(src = "inst/assets/js/argon.min.js")
    )
  )
}


argon_dropdown <- function(...) {
  dropdown_class <- "dropdown-menu dropdown-menu-lg"
  
  htmltools::tags$li(
    class = "nav-item dropdown",
    
    htmltools::tags$a(
      class = "nav-link",
      href = "#",
      `data-toggle` = "dropdown",
      role = "button",
      
      htmltools::tags$i(class = "ni ni-bullet-list-67 d-lg-none"),
      
      htmltools::tags$span(
        class = "nav-link-inner--text",
        
        argonR::argonIcon(name = "bullet-list-67", color = "default") 
      )
    ),
    
    htmltools::tags$div(
      class = dropdown_class,
      
      htmltools::tags$div(
        class = "dropdown-menu-inner",
        ...
      )
    )
  )
}



port_nav <- function() {
  argonR::argonNavbar(
    id = "main-navbar",
    src =  "inst/images/port_logo.svg",
    
    # -------------------------------------------------------------| left menu |
    argonR::argonNavMenu(
      side = "left",
      
      argon_dropdown(
        argonR::argonDropdownItem(
          name = "Home",
          description = NULL,
          src = "index.html",
          icon = argonR::argonIcon(name = "building", color = "default")
        ),
        
        argonR::argonDropdownItem(
          name = "Tools",
          description = NULL,
          src = "tools.html",
          icon = argonR::argonIcon(name = "settings", color = "default")
        ),
        
        argonR::argonDropdownItem(
          name = "Projects",
          description = NULL,
          src = "projects.html",
          icon = argonR::argonIcon(name = "chart-bar-32", color = "default")
        ),

        argonR::argonDropdownItem(
          name = "CV",
          description = NULL,
          src = "https://drive.google.com/file/d/1frZ_-wxQyCSDJU8Vj-oJQGpB0WHXVE0p/view?usp=share_link",
          icon = argonR::argonIcon(name = "collection", color = "default")
        ),
        
        argonR::argonDropdownItem(
          name = "Github",
          description = NULL,
          src = "https://github.com/akins11",
          icon = argonR::argonIconWrapper(
            iconTag = fa_icon(name = "github"),
            circle = FALSE,
            size = "sm",
            shadow = FALSE,
            status = "default",
            hover_shadow = FALSE
          )
        )
      )
    )
  )
}


fa_icon <- function(name, brand = TRUE) {
  type <- ifelse(brand, "brands", "solid")
  
  htmltools::tags$i(class = glue::glue("fa-{type} fa-{name}"))
  # htmltools::tags$i(class = "fa-brands fa-github")
}


plain_card <- function(..., 
                       hover_lift = FALSE, 
                       shadow = FALSE, 
                       width = 12) {
  card_class <- "card my-3"
  
  if (hover_lift) {
    card_class <- paste(card_class, "card-lift--hover")
  }
  if (shadow) {
    card_class <- paste(card_class, "shadow")
  }
  
  cardTag <- htmltools::tags$div(
    class = card_class,
    
    htmltools::tags$div(
      class = "card-body",
      
      ...
    )
  )
  
  argonR::argonColumn(width = width, cardTag)
}




img_card <- function(src = NULL, 
                     url = NULL, 
                     floating = FALSE, 
                     hover_lift = FALSE) {
  
  div_class <- "shadow" #"shadow"
  
  if (floating) {
    img_class <- paste(img_class, "floating")
  }
  if (hover_lift) {
    card_class <- paste(card_class, "card-lift--hover")
  }
    

  htmltools::tags$div(
    style = "min-height: 200px;",

    htmltools::tags$a(
      href = url, 
      target = "_blank", 
      htmltools::img(class = "img-fluid", 
                     src = src, 
                     width = "200", 
                     height = "400")
    )
  )
}



tool_box <- function(img = NULL, framework = NULL) {
  
  if (!is.null(framework)) {
    bd_width <- ifelse(length(framework) > 3, 3, 4)
    
    fw <- lapply(
      framework,
      
      function(.x) {
        argonR::argonColumn(
          width = bd_width,
          
          argonR::argonBadge(
            text = .x,
            # src = "https://www.google.com",
            pill = FALSE,
            status = "primary"
          )
        )
      }
    )
    
  } else {
    fw <- htmltools::div()
  }
  
  argonR::argonColumn(
    width = 6,
    center = TRUE,
    
    plain_card(
      hover_lift = TRUE,
      shadow = TRUE,
      
      img_card(
        src = glue::glue("inst/images/s_img/{img}")
      ),
      
      argonR::argonRow(
        fw
      )
    )
  )
}


project_container <- function(name, 
                              link, 
                              img_src, 
                              description, 
                              framework,
                              icon,
                              github_src) {
  
  if (!is.null(framework)) {
    bd_width <- ifelse(length(framework) > 3, 2, 3)
    
    fw <- lapply(
      framework,
      
      function(.x) {
        argonR::argonColumn(
          width = bd_width,
          
          argonR::argonBadge(
            text = .x,
            # src = "https://www.google.com",
            pill = FALSE,
            status = "primary"
          )
        )
      }
    )
    
  } else {
    fw <- htmltools::div()
  }
  
  
  argonR::argonColumn(
    width = 12,
    
    project_card(
      title = name,
      src = link,
      icon = fa_icon(name = icon, brand = FALSE), 
      github_src = github_src,
      
      argonR::argonImage(
        src = glue::glue("inst/images/s_img/{img_src}"),
        floating = FALSE
      ),
      
      argonR::argonRow(
        
        argonR::argonColumn(
          width = 7,
          
          argonR::argonLead(description) |>
            argonR::argonTextColor(color = text_color)
        ),
        
        argonR::argonColumn(
          width = 5,
          
          argonR::argonRow(
            argonR::argonLead("Tools Used:") |> argonR::argonMargin("t", 4)
          ),
          
          argonR::argonRow(
            fw
          )
        )
      )
    )
  )
}


project_card <- function(..., title, src, icon, github_src = NULL) {
  card_class <- "card my-3 shadow border-0 bg-Gray 100"
  icon_class <- "icon icon-shape rounded-circle mb-4 icon-shape-default"
  
  card_tag <- htmltools::div(
    class = card_class,
    
    # Header ------------------------------------------------------------------>
    htmltools::div(
      class = "card-header",
      style = "background-color: #FCFCFC;",
      
      htmltools::div(
        class = "row align-items-center m-2",
        
        # Icon -------------------------------->
        argonR::argonIconWrapper(
          iconTag = icon,
          circle = TRUE,
          size = "sm",
          shadow = TRUE,
          status = "default",
          hover_shadow = FALSE
        ),
        
        # Title ------------------------------->
        htmltools::h6(
          class = "text-default my-0 mx-1 pl-3",
          title
        )
      )
    ),
    
    # Body -------------------------------------------------------------------->
    htmltools::div(
      class = "card-body",
      
      # Content ------------------------------->
      htmltools::p(
        class = "description",
        ...
      ),
      
      # Link Button --------------------------->
      htmltools::div(
        class = "d-flex flex-row justify-content-between",
        
        htmltools::a(
          class = "btn btn-default mt-4",
          href = src,
          target = "_blank",
          "View"
        ),
        
        htmltools::div(
          class = "pt-4",
          
          htmltools::a(
            href = github_src,
            target = "_blank",
            
            argonR::argonIconWrapper(
              iconTag = fa_icon(name = "github"),
              circle = TRUE,
              size = "sm",
              shadow = TRUE,
              status = "default",
              hover_shadow = TRUE
            )
          )
        )
      )
    )
  ) 
  
  argonColumn(width = 12, card_tag)
}


link_button <- function() {
  htmltools::a(
    href = "projects.html",
    class = "btn btn-default btn-lg",
    row = "button",
    
    "View Projects"
  )
}


portfolio_footer <- function() {
  argonR::argonFooter(
    has_card = FALSE,
    status = "default",
    
    argonR::argonContainer(
      size = "lg",
      
      argonR::argonRow(
        argonR::argonColumn(
          width = 12,
          
          argonR::argonH1(
            display = 3,
            "Contact"
          ) |> argonR::argonTextColor(color = "secondary")
        )
      ),
      
      argonR::argonRow(
        argonR::argonColumn(
          width = 4,
          
          argonR::argonLead(
            "I am available for:"
          ) |> argonR::argonTextColor(color = "secondary"),
          
          htmltools::div(
            class = "footer-col",
            htmltools::tags$ul(
              class = "ts-text",
              
              htmltools::tags$li("Data analysis."),
              htmltools::tags$li("Shiny Applications."),
              htmltools::tags$li("Dash Applications."),
              htmltools::tags$li("Business Intelligence Dashboards"),
              htmltools::tags$li("Prediction models.")
            )
          )
        ),
        
        argonR::argonColumn(
          width = 4,
          
          argonR::argonLead(
            "Get in touch"
          ) |> argonR::argonTextColor(color = "secondary"),
          
          htmltools::div(
            class = "footer-col",
            
            htmltools::div(
              class = "ct-links",
              
              htmltools::tags$ul(
                class = "ul-s",
                
                htmltools::tags$li(
                  htmltools::tags$a(
                    href = "mailto:akinwandeayomide24@gmail.com",
                    htmltools::tags$i(class = "fa-solid fa-envelope")
                  )
                ),
                htmltools::tags$li(
                  htmltools::tags$a(
                    href = "https://wa.me/+2348099356268/",
                    htmltools::tags$i(class = "fa-brands fa-whatsapp") 
                  )
                ),
                htmltools::tags$li(
                  htmltools::tags$a(
                    href = "https://t.me/Ay_Akins",
                    htmltools::tags$i(class = "fa-brands fa-telegram") 
                  )
                )
              )
            )
          )
        ),
        
        argonR::argonColumn(
          width = 4,
          
          argonR::argonLead(
            "Follow Me"
          ) |> argonR::argonTextColor(color = "secondary"),
          
          htmltools::div(
            class = "footer-col",
            
            htmltools::div(
              class = "ct-links",
              
              htmltools::tags$ul(
                class = "ul-s",
                
                htmltools::tags$li(
                  htmltools::tags$a(
                    href = "https://twitter.com/Akinwande_ay24?s=09",
                    htmltools::tags$i(class = "fa-brands fa-twitter") 
                  )
                ),
                htmltools::tags$li(
                  htmltools::tags$a(
                    href = "https://www.linkedin.com/in/akinwande-ayomide-7bb37a199",
                    htmltools::tags$i(class = "fa-brands fa-linkedin-in") 
                  )
                ),
                htmltools::tags$li(
                  htmltools::tags$a(
                    href = "https://www.facebook.com/ayomide.akinwande.1",
                    htmltools::tags$i(class = "fa-brands fa-facebook-f") 
                  )
                )
              )
            )
          )
        )
      )
    )
  )
}
