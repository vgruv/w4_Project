# w4_Project

library(shiny)
data("mtcars")

shinyServer(function(input, output) {
     mtcars$cyl <- as.factor(mtcars$cyl)
     model_lm <- lm(qsec ~ hp+wt+cyl, data = mtcars)
     model_lm_am <- lm(qsec ~ hp+wt+cyl+am, data = mtcars)

     # get the prediction 
     # calculation is based on the inputted value from the user interface 
     model_lm_pred <- reactive({
          hpInput <- input$sliderHP
          wtInput <- input$sliderWt
          cylInput <- input$CylindersNum
          
          predict(model_lm, newdata = data.frame(hp = hpInput, 
                                                 wt=wtInput, 
                                                 cyl=cylInput))
     })
     
     # Transmission (0 = automatic, 1 = manual)
     model_lm_m_pred <- reactive({
          hpInput <- input$sliderHP
          wtInput <- input$sliderWt
          cylInput <- input$CylindersNum
          
          predict(model_lm_am, newdata = data.frame(hp = hpInput, 
                                                 wt=wtInput, 
                                                 cyl=cylInput,
                                                 am = 1))
     })
     
     model_lm_a_pred <- reactive({
          hpInput <- input$sliderHP
          wtInput <- input$sliderWt
          cylInput <- input$CylindersNum
          
          predict(model_lm_am, newdata = data.frame(hp = hpInput, 
                                                    wt=wtInput, 
                                                    cyl=cylInput,
                                                    am = 0))
     })

     output$pred_lm <- renderText({
          model_lm_pred()
     })
     
     output$pred_lm_m <- renderText({
          model_lm_m_pred()
     })
     
     output$pred_lm_a <- renderText({
          model_lm_a_pred()
     })
})
