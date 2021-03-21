# quelques exemples de correspondances entre le ui et le server ----------------------------------------------


# si on veut afficher une table

#=====> UI
dataTableOutput("identifiant")

#=====> server
DT::renderDataTable()


# si on veut afficher une image
#=====> UI
imageOutput("image")

#=====> server

renderImage()

# si on veut afficher un graphique

#=====> UI

plotOutput("plot")

#=====> sever

renderPlot()

#si on veut afficher un text
#=====> UI
verbatimTextOutput("text")

#=====> server

renderPrint()

# si on veut utiliser du text
#=====> UI
textOutput()

#=====> server
renderText()

# si on decide de mettre plusieus output

#=====> UI
uiOutput("iden")

#=====> server

renderUI()

# si on veut faire une indication sous forme de texte

h("texte")
p("text")