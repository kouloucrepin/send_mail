library(shiny)
library(shinydashboard)

ui <- shinyUI(
   dashboardPage(
  dashboardHeader(title="Dashboard ISSEA",titleWidth = 200),
  dashboardSidebar(
    sidebarMenu(
    menuItem("Acceuil",tabName = "acceuil"),
    menuItem("Généralite",tabName = "generalite"),
    menuItem("Analyse IMC",tabName = "imc"),
    menuItem("? Aide",tabName = "aide")
  ))
  ,
  
  ##body
  dashboardBody(
    
    tags$style(
      ".bienv {
      text-align:center;
      background:lightgray;
      }
      
      .row {
      margin-left:10px;
      }
      
      .value-box .value {
      font-size:5px;
      }
      
      .box-header {
      border-bottom : 1px solid #ccc;
      }
      
      .box{
      margin-right: 5px;
      margin-top: 5px ;
      }
      
      .aide{
      text-align:center;
      background:lightgray;
      }
      
      h1{
      font-size:36px
      }
      
      /* .skin-blue .main-sidebar {
      background-color:white;
      }
      
      .skin-blue .sidebar a {
      color:black;
      font-size:15px;
      }
      
      .skin-blue .sidebar a:hover ,.skin-blue .sidebar a:focus {
      color:blue;
      background-color:blue;
      } */
      "
      
      
    ),
    
    ##items
    tabItems(
      ###tab1
      tabItem(tabName = "acceuil",fluidRow(box(uiOutput("test"),width=11,height = 80,solidHeader = TRUE),
                                  fluidRow(box(title = "Création de l'ISSEA",collapsible = TRUE,width = 5,status = 'info'),
                                           box(title = "Adresse de l'ISSEA",collapsible = TRUE,width=2,status = 'info'),
                                           box(title = "Mission de l'ISSEA",collapsible = TRUE,width = 4,status = 'info'),
                                           
                                  
              ),
              fluidRow(
                box(title = "Création de votre filière",width = 11,collapsible = TRUE,status = 'info')
              )
              )
              
    ),
    ###tab2
    tabItem(
      tabName = "generalite",
      fluidRow(
        valueBox(60,
          "Total Etudiant", icon = icon("line-chart"), color = "orange",width = 3
        ),
        valueBox(50,
          "Moyenne S1", icon = icon("list-alt"), color = "green",width = 3
        ),
        valueBox(40,
          "Moyenne S2", icon = icon("table"), color = "light-blue",width = 3
        ),
        valueBox(20,
          "Etudiant Sportif", icon = icon("line-chart"), color = "purple",width = 3
        )
        
      ),
      fluidRow(
          box(plotOutput("repsex"),width = 6,title = "Répartition des étudiants par sexe",collapsible = TRUE,status="info"),
        
          box(plotOutput("repsex"),width = 6,title = "Moyenne générale par classe",collapsible = TRUE,status="info")
          
        ),
      fluidRow(
        box(plotOutput("repimc"),width = 6,title = "Distribution de l'IMC",collapsible = TRUE,status="info"),
        
        box(plotOutput("reptail"),width = 6,title = "Poids vs Taille",collapsible = TRUE,status="info")
        
      )
      ),
    ##tabitem3
    tabItem(tabName = "imc",
            fluidRow(infoBox(
              "25.5", "moyenne IMC", icon = icon("fas fa-user"), color = "yellow",
             width = 3
            ),
            infoBox(
              "24.42", "Mediane IMC", icon = icon("line-chart"), color = "aqua",
              width = 3
            ),
            infoBox(
              "6.57", "Ecart-type IMC", icon = icon("fas fa-shopping-cart"), color = "purple",
              width = 3
            ),
            infoBox(
              "38.87", "IMC maximum", icon = icon("fas fa-bug"), color = "blue",
              width = 3
            )),
            fluidRow(
              box(plotOutput("histetud"),width = 4,title = "Histogramme des tailles des étudiants",collapsible = TRUE,status="info"),
              box(plotOutput("histpoids"),width = 4,title = "Histogramme des poids des étudiants",collapsible = TRUE,status="info"),
              box(plotOutput("histimc"),width = 4,title = "Histogramme de l'IMC des étudiants",collapsible = TRUE,status="info")
              
            ),
            fluidRow(
              box(plotOutput("repobe"),width = 6,title = "Répartition des Étudiants selon Obésité",collapsible = TRUE,status="info"),
              box(plotOutput("repetudob"),width = 6,title = "Nuage de points des tailles en fonction des poids selon l'obésité",collapsible = TRUE,status="info"),
            ),
            fluidRow(
              box(plotOutput("reppar_sexe"),width = 6,title = "Répartition des IMC par sexe",collapsible = TRUE,status="info"),
              box(plotOutput("rep_imc"),width = 6,title = "Répartition des IMC par classe",collapsible = TRUE,status="info"),
            )
      
    ),
    tabItem(tabName = "aide",
            fluidRow(box(uiOutput("test2"),width=12,solidHeader = TRUE)),
            fluidRow(box(title = "Objectif App",width=6,collapsible = TRUE,status = "info"),
                     box(title = "Didacticiel",width=6,collapsible = TRUE,status = "info"))
      
    )
    )
    
  )
   
))


server <- function(input, output,session) {
      output$test<-renderUI({
        h1("Bienvenue sur la page d'accueil",class="bienv")
      })
      output$test2<-renderUI({
        h1("Aide",class="aide")
      })
  
  
}

shinyApp(ui = ui, server = server)
