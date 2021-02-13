library(shiny)
server<-shinyServer(function(input,output){
  output$histo<-renderPlot({
    hist(rnorm(input$id))
  })
  
  output$data<-renderDataTable({
    head(mtcars,input$id)
  })
}
)