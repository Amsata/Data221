
library(shiny)

# ui(User interface) ------------------------------------------------------
ui<-fluidPage(
  tabsetPanel(
    tabPanel("idtab1",
             p("permet à l'utilisateur de saisir des valeurs numériques"),
             numericInput(inputId = "id",label = "Champ de saisie",min=10,max=20,value = 10),
             plotOutput("histo")),
    tabPanel("idtab2",
             #permet de mettre un champ à choix multiple
             selectInput(inputId = "choix",label = "Choix multiple",choices=c("choix 1","choix 2"),multiple=TRUE),
             #permet de mettre un champ à choix unique
             selectInput(inputId = "choix_unique",label = "Choix unique",choices = c("choix 1","choix 2"),multiple = FALSE)
             ),
    tabPanel("idtab3",
             #permet de mettre des valeurs dans un intervalle
             sliderInput(inputId = "slider",label = "Valeur en intervalle",min = 5,max = 20,value = 7),
             #mettre des dates
             dateInput(inputId = "date",label = "Date à saisir"),
             #permettre de mettre un mot de passe
             passwordInput(inputId = "pwd",label = "Saisissez le mot de passe!"),
             #mettre un button
             actionButton(inputId = "button",label = "Cliquez!")
             ),
    tabPanel("idtab4",
             #mettre un lien
             actionLink(inputId = "lien",label = "Le lien "),
             # button à choix multiple
             checkboxGroupInput(inputId = "choix_mul",label = "Button à choix multiple",choices = c("choix 1","choix 2")),
             #button à choix unique
             checkboxInput(inputId = "choix_uni",label = "Button à choix unique"),
             # # radio buton
              radioButtons(inputId = "radio",label = "Choix",choices = c("choix1","choix2","choix3"),selected = "choix1",inline = TRUE)
             ),
    tabPanel("idtab5",
             #Afficher du texte avec des formats!
             #en rouge
             p(code("Texte en rouge")),
             #en italic
             p(em("Texte en italic")),
             #en gras
             p(strong("Texte en gras")),
             a(href="","Lien vers"))
  )
)

# server, tous les codes qui sont derrière --------------------------------

server<-function(input,output){
  output$histo<-renderPlot({
    hist(rnorm(input$id))
  })
}
# appels des fonctions ----------------------------------------------------

shinyApp(ui=ui,server = server)




