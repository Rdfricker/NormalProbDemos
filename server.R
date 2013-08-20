library(shiny)

shinyServer(function(input,output){

# Probability Density Function Plots	
  output$normal_pdf_plot <- renderPlot({
  	if (input$typeTail == "left") {	  
      x <- seq(-6,6,0.01)
      y <- dnorm(x,input$mean,input$sd)
      max_height <- dnorm(input$mean,input$mean,input$sd)
      plot(x,y,type="l",xlab=expression(y),ylab=expression(f(y)),xlim=c(-6,6),ylim=c(0,1.04*max_height),lwd=3,col="blue",xaxs="i",yaxs="i")   
      
      new_x <- x[x < input$y]
      new_y <- y[x < input$y]
      polygon(c(input$y,rev(new_x),qnorm(0.000001,input$mean,input$sd)),c(0,rev(new_y),0),col="yellow")
      mtext(bquote(y==.(input$y)),side=1,padj=1,cex=2,at=input$y)
      mtext(bquote(P(Y<=y)==.(pnorm(input$y,input$mean,input$sd))),,side=3,padj=0,cex=2,at=0)
      
      lines(x,y,,lwd=3,col="blue")
      }   

  	if (input$typeTail == "right") {	  
      x <- seq(-6,6,0.01)
      y <- dnorm(x,input$mean,input$sd)
      max_height <- dnorm(input$mean,input$mean,input$sd)
      plot(x,y,type="l",xlab=expression(y),ylab=expression(f(y)),xlim=c(-6,6),ylim=c(0,1.04*max_height),lwd=3,col="blue",xaxs="i",yaxs="i")   
      
      new_x <- x[x > input$y]
      new_y <- y[x > input$y]
      polygon(c(input$y,new_x,qnorm(0.9999,input$mean,input$sd)),c(0,new_y,0),col="yellow")
      mtext(bquote(y==.(input$y)),side=1,padj=1,cex=2,at=input$y)
      mtext(bquote(P(Y>=y)==.(1-pnorm(input$y,input$mean,input$sd))),,side=3,padj=0,cex=2,at=0)
      
      lines(x,y,,lwd=3,col="blue")
      }   
     
  })
  
  
})


